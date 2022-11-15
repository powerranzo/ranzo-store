package com.ranzo.power.service.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface UploadService {

	Map<String,Object> uploadFile(MultipartFile file, HttpServletRequest request, String dirName);
	public void deleteServerFile(String fileName, HttpServletRequest request, String dirName);
}

