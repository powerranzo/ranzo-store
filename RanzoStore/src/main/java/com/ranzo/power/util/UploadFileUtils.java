package com.ranzo.power.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class UploadFileUtils {
	//로깅
	private static final Logger logger=LoggerFactory.getLogger(UploadFileUtils.class);

	public static String uploadFile(String uploadPath, 
			String originalName, byte[] fileData) throws Exception {
		//uuid 발급
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		// 업로드할 디렉토리 생성
		String savedPath = calcPath(uploadPath);
		File target = new File(uploadPath+savedPath, savedName);
		// 임시 디렉토리에 업로드된 파일을 지정된 디렉토리 복사
		FileCopyUtils.copy(fileData, target);
		//파일의 확장자 검사
		// a.jpg, aaa.bbb.ccc.jpg
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		String uploadedFileName = null;
		// 이미지 파일인 경우 : 썸네일(작은 이미지)을 생성
		if(MediaUtils.getMediaType(formatName) != null) {
			//썸네일 생성
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		}else { //이미지 파일이 아닌경우 : 썸네일 생성 안함
			uploadedFileName = noImg(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;
	}

	//날짜처리 (2022년폴더 / 00월폴더 / 00일폴더 생성)
	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator 
				+ new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = monthPath + File.separator 
				+ new DecimalFormat("00").format(cal.get(Calendar.DATE));
		//디렉토리 생성 메소드 호출
		makeDir(uploadPath, yearPath, monthPath, datePath);
		logger.info(datePath);
		return datePath;
	}

	public static void makeDir(String uploadPath, String... paths) {
		// String... 은 가변사이즈 매개변수 (배열의 요소가 몇개든 상관없이 처리)
		// paths가 바로 위 yearPath, monthPath, datePath 를 다 처리함
		//디렉토리가 존재하면 skip
		if(new File(paths[paths.length - 1]).exists()) {
			return;
		}
		//디렉토리가 존재하지 않으면
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if (!dirPath.exists()) {
				dirPath.mkdir(); //디렉토리 생성
			}
		}
	}

	//썸네일 이미지와 이름 생성
	public static String makeThumbnail(String uploadPath, String path, 
			String fileName) throws Exception  {
		// 원본 이미지를 읽기 위한 버퍼
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		// 100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, 
				Scalr.Mode.FIT_TO_HEIGHT, 100);
		// 썸네일의 이름
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

		//썸네일 생성
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		//썸네일의 이름을 리턴
		return thumbnailName.substring(
				uploadPath.length()).replace(File.separatorChar, '/');
	}

	// 이미지 파일이 아닌 파일처리 메소드 makeIcon=>noImg
	public static String noImg(String uploadPath, String path, 
			String fileName) throws Exception {
		//File.separator는 이름 구분자인데, 예를 들어 윈도우의 경우
		// upload\\test.txt, 리눅스는 upload/test.txt라고 쓰게 되는데 '\', '/'를 따로 신경
		//안써도 "upload"+File.separator+"text.txt"라고 쓰면 OS에 따라 자동으로 처리한다.
		String iconName = uploadPath + path + File.separator + fileName;
		//아이콘 이름을 리턴, File.separatorChar는 File.separator와 같은 기능의 이름 구분자이나
		//리턴값을 따로 정할 수 있다.
		return iconName.substring(uploadPath.length()).replace(
				File.separatorChar, '/');
	}

	public static Map<String,Object> uploadFile2(MultipartFile file, 
			HttpServletRequest request, String dirName) {

		UUID uid=UUID.randomUUID();
		String savedName = "";
		//파일명에 "_" 가 포함된 경우 삭제
		if(file.getOriginalFilename().indexOf("_")!=-1) 
			savedName = uid.toString()+"_"+file.getOriginalFilename().replace("_", "");
		else
			savedName = uid.toString()+"_"+file.getOriginalFilename();

		//... wtpwebapps\RanzoStore\resources\images\
		String uploadPath = MediaUtils.getServerUploadPath(request);
		
		//상위 디렉토리가 없는 경우를 위함
		String[] dirNames = dirName.split("/");
		String tmp = "";
		for(int i=0; i<dirNames.length; i++) {
			tmp += File.separator + dirNames[i];
			UploadFileUtils.makeDir(uploadPath, tmp);
		}
		
		File target=new File(uploadPath+dirName, savedName);

		try {
			FileCopyUtils.copy(file.getBytes(), target);
		} catch (IOException e) {
			e.printStackTrace();
		}

		Map<String,Object> fileInfo = new HashMap<String,Object>();
		fileInfo.put("fileUrl", MediaUtils.getFileUrlPath(request)+dirName+"/"+savedName);
		fileInfo.put("fileName", savedName);
		fileInfo.put("fileSize", file.getSize());
		return fileInfo;
	}

	public static void deleteServerFile(String fileName, 
			HttpServletRequest request, String dirName) {
		if(dirName==null) dirName="";
		if(fileName != null && !fileName.equals("-")) {
			File f=new File(MediaUtils.getServerUploadPath(request)+dirName+"/"+fileName);
			if(f.exists()) 
				f.delete(); 
		}		 
	}
}
