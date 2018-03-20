package org.adf.application.common.enumeration;

public enum EnumContentType {
	
	TEXT("text/plain;charset=UTF-8"),
	HTML("text/html;charset=UTF-8"),
	XML("text/xml;charset=UTF-8"),
	JSON("application/json;charset=UTF-8");
	
	private String contentType;

	private EnumContentType(String contentType) {
		this.contentType = contentType;
	}
	
	public String toString() {
		return contentType;
	}
	
	public static void main(String[] args){
		System.out.println(EnumContentType.TEXT.toString());
	}
	
}
