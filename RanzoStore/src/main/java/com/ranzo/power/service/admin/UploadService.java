package com.ranzo.power.service.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface UploadService {

	Map<String,Object> uploadFile(MultipartFile file, HttpServletRequest request, String dirName);
	public void deleteServerFile(String fileName, HttpServletRequest request, String dirName);
	void uploadCKEditor(HttpServletRequest request, HttpServletResponse response, MultipartFile upload)
			throws Exception;
}

