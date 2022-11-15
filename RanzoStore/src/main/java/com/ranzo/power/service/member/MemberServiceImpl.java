package com.ranzo.power.service.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ranzo.power.model.board.dto.QnaDTO;
import com.ranzo.power.model.board.dto.ReviewDTO;
import com.ranzo.power.model.member.dao.MemberDAO;
import com.ranzo.power.model.member.dto.MemberDTO;
import com.ranzo.power.model.shop.dto.ExhibitionDTO;
import com.ranzo.power.util.DateUtils;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberDao;
	
	@Override
	public boolean loginCheck(MemberDTO dto, HttpSession session) {
		boolean result = memberDao.loginCheck(dto);
		if(result) { //로그인 성공
			MemberDTO dto2=viewMember(dto.getUserid());
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", dto2.getName());
			if(memberDao.adminCheck(dto.getUserid())){
				session.setAttribute("admin", "y");
			}
		}
		return result;
	}
	
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public void insertMember(MemberDTO dto) {
		memberDao.insertMember(dto);
	}

	@Override
	public int idChk(MemberDTO dto) {
		return memberDao.idChk(dto);
	}

	@Override
	public boolean pwdCheck(String userid, String passwd) {
		return memberDao.pwdCheck(userid, passwd);
	}
	
	@Override
	public MemberDTO viewMember(String userid) {
		return memberDao.viewMember(userid);
	}

	@Override
	public void updateMember(MemberDTO dto) {
		memberDao.updateMember(dto);
	}

	@Override
	public void deleteMember(String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("today", DateUtils.getToday());
		memberDao.deleteMember(map);
	}

	@Override
	public MemberDTO findId(MemberDTO dto) {
		return memberDao.findId(dto);
	}

	@Override
	public MemberDTO findPwd(MemberDTO dto) {
		return memberDao.findPwd(dto);
	}
	
	// 임시 비번 발행 & 임시 비번으로 회원 비번 설정
	// 네이버 메일 발송
	@Override
	public void sendPwd(String userid, String email) throws Exception {
        
		//임시 비번 발행 & 임시 비번으로 회원 비번 변경
		char[] charSet = new char[] {
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                '!', '@', '#', '$', '%', '^', '&' };

        StringBuffer sb = new StringBuffer();
        SecureRandom sr = new SecureRandom();
        sr.setSeed(new Date().getTime());

        int idx = 0;
        int len = charSet.length;
        for (int i=0; i<10; i++) {
            idx = sr.nextInt(len);  
            sb.append(charSet[idx]);
        }
        
        String tempPwd = sb.toString();

		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("tempPwd", tempPwd);
        memberDao.tempPwd(map);
		//임시 비번 끝
        
        
		//메일 관련 정보
		String host = "smtp.naver.com";
		final String username = "ranzostore";
		final String password = "ranzo1234!@";
		int port = 465;
		
		//메일 내용
		String recipient = email;
		String subject = "Ranzo Store 임시 비밀번호가 발급되었습니다.";
		String body="임시 비밀번호 : " + tempPwd 
				+ "\r\n 확인 후 로그인하여 회원 정보 수정을 통해 비밀번호를 변경해주세요.\r\n";
		
		Properties props = System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
			}
		});
		session.setDebug(true);
		
		Message mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(new InternetAddress("ranzostore@naver.com", "RanzoStore"));
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        mimeMessage.setSubject(subject);
        mimeMessage.setText(body);
        Transport.send(mimeMessage);
	}
	
	//카카오 로그인 (인가 코드 주고 토큰 받아오기)
	@Override
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
            
			sb.append("&client_id=c25de70aa517d0143d2b73595c73dc86"); //발급받은 key
			sb.append("&redirect_uri=http://localhost/power/member/kakaoLogin"); //설정한 주소
            
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
            
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
            
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
            
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
            
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
            
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;

	}

	//받아온 카카오 회원 정보 저장 및 처리
	@Override
	public MemberDTO getUserInfo(String access_Token) {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("nickname", nickname);
			userInfo.put("email", email);

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		MemberDTO result = memberDao.findkakao(userInfo);
		// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
		System.out.println("userInfo:" + result);
		if(result==null) {
		// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
			memberDao.kakaoinsert(userInfo);
			// 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
			return memberDao.findkakao(userInfo);
			// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
			//  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
		} else {
			return result;
			// 정보가 이미 있기 때문에 result를 리턴함.
		}
	}
	
	@Override
	public void kakaoLogout(String access_Token) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String result = "";
            String line = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
	}

	@Override
	public List<QnaDTO> qnaList(String userid, int start, int end) {
		return memberDao.qnaList(userid, start, end);
	}
	
	@Override
	public int countQna(String userid) {
		return memberDao.countQna(userid);
	}

	@Override
	public List<ReviewDTO> reviewList(String userid, int start, int end) {
		return memberDao.reviewList(userid, start, end);
	}
	
	@Override
	public int countReview(String userid) {
		return memberDao.countReview(userid);
	}

	@Override
	public List<ExhibitionDTO> wishlist(String userid) {
		return memberDao.wishlist(userid);
	}

	@Override
	public int emptyWish(String userid) {
		return memberDao.emptyWish(userid);
	}

}
