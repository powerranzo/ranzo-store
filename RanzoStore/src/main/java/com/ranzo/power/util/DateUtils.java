package com.ranzo.power.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class DateUtils {

	public static String getToday() {
		LocalDate now=LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formatedNow = now.format(formatter);
		return formatedNow;
	}
	
	public static String dateToString(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");   
		return format.format(date);
	}
	
	public static Date stringToDate(String date, String type) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat(type);
		return format.parse(date);
	}
}
