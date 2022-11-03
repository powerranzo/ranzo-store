package com.ranzo.power.model.member.dto;

public class KakaoDTO {
	private String k_name;
	private String k_email;
	
	//getter,setter,생성자,toString
	public String getK_name() {
		return k_name;
	}
	public void setK_name(String k_name) {
		this.k_name = k_name;
	}
	public String getK_email() {
		return k_email;
	}
	public void setK_email(String k_email) {
		this.k_email = k_email;
	}
	
	public KakaoDTO(String k_name, String k_email) {
		this.k_name = k_name;
		this.k_email = k_email;
	}
	public KakaoDTO() {
	}
	
	@Override
	public String toString() {
		return "KakaoDTO [k_name=" + k_name + ", k_email=" + k_email + "]";
	}
}
