package com.ranzo.power.service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface UploadService {

		public String uploadCKEditor(HttpServletRequest request, HttpServletResponse response, 
				MultipartFile upload) throws Exception;
		public String uploadFile(MultipartFile file, HttpServletRequest request);
		public void deleteServerFile(String fileName, HttpServletRequest request);
	}

