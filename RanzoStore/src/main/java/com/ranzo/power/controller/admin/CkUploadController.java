package com.ranzo.power.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class CkUploadController {
		private static final Logger logger=
				LoggerFactory.getLogger(CkUploadController.class);
		@RequestMapping("imageUpload.do")
		public void imageUpload(HttpServletRequest request, 
				HttpServletResponse response, Model m,
				@RequestParam MultipartFile upload) throws Exception{
//			UUID uid = UUID.randomUUID();
			OutputStream out = null;
			PrintWriter printWriter = null;
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");

			try {
//				String fileName=uid+"_"+upload.getOriginalFilename();
				String fileName=upload.getOriginalFilename();
				byte[] bytes=upload.getBytes();
				String uploadPath=request.getServletContext().getRealPath("/resources/images/");
				System.out.println("uploadPath:" + uploadPath);
				out=new FileOutputStream(new File(uploadPath+fileName));
				out.write(bytes);
				printWriter=response.getWriter();
				String fileUrl=request.getContextPath()+"/resources/images/"+fileName;
				printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
				printWriter.flush();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (out != null) {
						out.close();
					}
					if (printWriter != null) {
						printWriter.close();
					}
				} catch (IOException e2) {
					e2.printStackTrace();
				}
			}
			return;
		}

}
