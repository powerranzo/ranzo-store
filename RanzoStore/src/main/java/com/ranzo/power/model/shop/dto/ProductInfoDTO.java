package com.ranzo.power.model.shop.dto;

public class ProductInfoDTO {
	private String code;
	private String attach;
	private String content;

	public ProductInfoDTO() {

	}

	public ProductInfoDTO(String code, String attach, String content) {
		super();
		this.code = code;
		this.attach = attach;
		this.content = content;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getAttach() {
		return attach;
	}

	public void setAttach(String attach) {
		this.attach = attach;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
