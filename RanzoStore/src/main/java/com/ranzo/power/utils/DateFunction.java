package com.ranzo.power.utils;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DateFunction {

	public static String getToday() {
		LocalDate now=LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formatedNow = now.format(formatter);
		return formatedNow;
	}
}
