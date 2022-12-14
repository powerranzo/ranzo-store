package com.ranzo.power.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;

public class MediaUtils {
	private static Map<String, MediaType> mediaMap;
	static {
		mediaMap = new HashMap<>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("GIF", MediaType.IMAGE_PNG);
	}
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type.toUpperCase());
	}
	
	public static String getServerUploadPath(HttpServletRequest request) {
		return request.getServletContext().getRealPath("/resources/images/");
	} 
	
	public static String getFileUrlPath(HttpServletRequest request) {
		return request.getContextPath()+"/resources/images/";
	}
}
