package com.ranzo.power.controller.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ranzo.power.service.board.QnaService;
import com.ranzo.power.service.board.ReviewService;
import com.ranzo.power.util.MediaUtils;
import com.ranzo.power.util.UploadFileUtils;


@Controller
public class AjaxUploadController {
		//로깅
		private static final Logger logger
		=LoggerFactory.getLogger(AjaxUploadController.class);
		
		@Inject
		QnaService qnaService;
		
		//업로드 디렉토리
		@Resource(name = "uploadPath")
		String uploadPath; //c:/upload
		
		@RequestMapping(value = "/upload/uploadAjax", method = RequestMethod.GET)
		public String uploadAjax() {
			return "/upload/uploadAjax";//포워딩
		}
		
		@ResponseBody //객체를 json 형식으로 데이터 리턴
		@RequestMapping(value = "/upload/uploadAjax"
				, method = RequestMethod.POST
				, produces = "text/plain;charset=utf-8")//한글이 깨지지 않도록 처리
		//업로드한 파일정보와 Http 상태코드를 함께 리턴 (HttpStatus, HttpHeaders, HttpBody를 포함)
		public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
			//View의 이름이 아니라 data 자체를 보내는 처리
			return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, 
					file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
			//파일성공여부는 uploadAjax.jsp의 function(data,status,req)으로 넘어감
		}
		
		@ResponseBody
		@RequestMapping("/upload/displayFile")
		public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
			//서버의 파일을 다운로드하기 위한 스트림
			InputStream in = null;//java.io
			ResponseEntity<byte[]> entity = null;
			try {
				//확장자 검사
				String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
				MediaType mType = MediaUtils.getMediaType(formatName);
				//헤더 구성 객체
				HttpHeaders headers = new HttpHeaders();
				//InputStream 생성
				in = new FileInputStream(uploadPath + fileName);
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				//다운로드용 컨텐츠 타입
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""
				+new String(fileName.getBytes("utf-8"), "iso-8859-1")+ "\"");
				//바이트배열(내용), 헤더, 상태코드 3개를 묶어서 전달
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
						headers, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(
						HttpStatus.BAD_REQUEST);//실패했을 때 에러메시지 전달
			} finally {
				if (in != null)
					in.close();//스트림 닫기
			}
			return entity;
		}
		
		@ResponseBody //뷰가 아닌 데이터를 리턴
		@RequestMapping(value="/upload/deleteFile")
		public ResponseEntity<String> deleteFile(String fileName){
			logger.info("fileName:"+fileName); 
			//확장자 검사
			String formatName=fileName.substring(
					fileName.lastIndexOf(".")+1);//마지막 .다음 문자부터 끝까지 글자
			MediaType mType=MediaUtils.getMediaType(formatName);
			if(mType != null) { //이미지 파일의 원본이미지 삭제
				String front=fileName.substring(0, 12);//0~11까지
				String end=fileName.substring(14);//14부터 끝까지
				new File(uploadPath+(front+end).replace(
						'/',File.separatorChar)).delete();
			}
			//기타종류 원본 파일 삭제(이미지이면 썸네일 삭제)
			new File(uploadPath+fileName.replace(
					'/',File.separatorChar)).delete();
			//레코드 삭제
			qnaService.deleteFile(fileName);
			
			return new ResponseEntity<String>("deleted"
					,HttpStatus.OK);//uploadAjax.jsp의 if(result=="deleted")와 연결
		}

}
