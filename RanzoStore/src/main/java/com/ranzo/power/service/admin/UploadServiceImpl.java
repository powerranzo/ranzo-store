package com.ranzo.power.service.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.ranzo.power.util.MediaUtils;

@Service
public class UploadServiceImpl implements UploadService {

	@Override
	public void uploadCKEditor(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, MultipartFile upload) throws Exception {
		UUID uid = UUID.randomUUID();
		OutputStream out = null;
		PrintWriter printWriter = null;
		String fileName=uid+"_"+upload.getOriginalFilename();
		byte[] bytes=upload.getBytes();
		String uploadPath=request.getServletContext().getRealPath("/resources/images/");
		out=new FileOutputStream(new File(uploadPath+fileName));
		out.write(bytes);
		printWriter=response.getWriter();
		String fileUrl=request.getContextPath()+"/resources/images/"+fileName;
		session.setAttribute("fileUrl", fileUrl);
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
	public String uploadFile(MultipartFile file, HttpServletRequest request) {
		UUID uid=UUID.randomUUID();
		String savedName=uid.toString()+"_"+file.getOriginalFilename(); 
		String uploadPath=request.getServletContext().getRealPath("/resources/images/");
		File target=new File(uploadPath, savedName);
		try {
			FileCopyUtils.copy(file.getBytes(), target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return request.getContextPath()+"/resources/images/"+savedName;
	}

	@Override
	public void deleteServerFile(String fileName, HttpServletRequest request) {
		if(fileName != null && !fileName.equals("-")) {
			File f=new File(MediaUtils.getServerUploadPath(request)+fileName);
			if(f.exists()) 
				f.delete(); 
		}		
	}
}
