package com.ranzo.power.model.admin.dto;

import java.util.Date;

public class PopupDTO {
	public int no;
	public String title;
	public String content;
	public Date start_date; //시간설정 util. to_date()
	public Date end_date;
}
