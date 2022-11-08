package com.ranzo.power.controller.admin;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ranzo.power.service.admin.UploadService;


@Controller
public class FileUploadController {
		private static final Logger logger=
				LoggerFactory.getLogger(FileUploadController.class);
		
		@Inject
		UploadService uploadService;
		
		@Resource(name = "uploadPath") 
		String uploadPath;
		
		@RequestMapping("ck_imageUpload.do")
		public void imageUpload(HttpServletRequest request, 
				HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception{
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			
			try {
				uploadService.uploadCKEditor(request, response, upload);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				
			}
			return;
		}

}
