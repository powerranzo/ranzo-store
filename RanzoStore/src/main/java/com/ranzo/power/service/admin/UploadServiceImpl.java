package com.ranzo.power.service.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ranzo.power.util.MediaUtils;
import com.ranzo.power.util.UploadFileUtils;

@Service
public class UploadServiceImpl implements UploadService {

	@Override
	public void uploadCKEditor(HttpServletRequest request, 
			HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
		System.out.println("uploadCKEditor() 호출");
		UUID uid = UUID.randomUUID();
		OutputStream out = null;
		PrintWriter printWriter = null;
		String fileName=uid+"_"+upload.getOriginalFilename();
		byte[] bytes=upload.getBytes();
		String uploadPath=MediaUtils.getServerUploadPath(request);
		out=new FileOutputStream(new File(uploadPath+fileName));
		out.write(bytes);
		printWriter=response.getWriter();
		String fileUrl=MediaUtils.getFileUrlPath(request)+fileName;
		printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
		printWriter.flush();
		try {
			if (out != null) {
				out.close();
			}
			if (printWriter != null) {
				printWriter.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Map<String,Object> uploadFile(MultipartFile file, HttpServletRequest request, String dirName) {
		UUID uid=UUID.randomUUID();
		String savedName="";
		if(file.getOriginalFilename().indexOf("_")!=-1) 
			savedName=uid.toString()+"_"+file.getOriginalFilename().replace("_", "");
		else
			savedName=uid.toString()+"_"+file.getOriginalFilename();
		String uploadPath=MediaUtils.getServerUploadPath(request);
		if(dirName==null) dirName="";
		UploadFileUtils.makeDir(uploadPath, dirName);
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
		System.out.println("fileSize:"+file.getSize());
		return fileInfo;
	}

	@Override
	public void deleteServerFile(String fileName, HttpServletRequest request
			, String dirName) {
		if(dirName==null) dirName="";
		if(fileName != null && !fileName.equals("-")) {
			File f=new File(MediaUtils.getServerUploadPath(request)+dirName+"/"+fileName);
			if(f.exists()) 
				f.delete(); 
		}		
	}
}
