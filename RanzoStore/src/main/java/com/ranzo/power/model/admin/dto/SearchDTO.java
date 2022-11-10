package com.ranzo.power.model.admin.dto;

import com.ranzo.power.util.DateUtils;

public class SearchDTO {
	private String searchOption1;
	private String startDate;
	private String endDate;
	private String searchOption2;
	private String searchKeyword;
	private String orderOption;
	
	public String getsearchOption1() {
		return searchOption1;
	}
	public void setsearchOption1(String searchOption1) {
		this.searchOption1 = searchOption1;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getsearchOption2() {
		return searchOption2;
	}
	public void setsearchOption2(String searchOption2) {
		this.searchOption2 = searchOption2;
	}
	public String getOrderOption() {
		return orderOption;
	}
	public void setOrderOption(String orderOption) {
		this.orderOption = orderOption;
	}
	
	
	@Override
	public String toString() {
		return "SearchDTO [searchOption1=" + searchOption1 + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", searchOption2=" + searchOption2 + ", searchKeyword=" + searchKeyword + ", orderOption="
				+ orderOption + "]";
	}
	public SearchDTO() {
		this.searchOption1 = "all";
		this.searchOption2 = "all";
		this.startDate="2000-01-01";
		this.endDate=DateUtils.getToday();
		this.searchKeyword ="";
	}
	public SearchDTO(String searchOption1, String startDate, String endDate, String searchOption2, String searchKeyword,
			String orderOption) {
		this.searchOption1 = searchOption1;
		this.startDate = startDate;
		this.endDate = endDate;
		this.searchOption2 = searchOption2;
		this.searchKeyword = searchKeyword;
		this.orderOption = orderOption;
	}
	
}
