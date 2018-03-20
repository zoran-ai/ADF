package org.adf.application.common.enumeration;

public enum EnumAttributeCode {
	
	FUNCTION("function_code"),
	ICON("font_icon_code");
	
	private String attributeCode;

	private EnumAttributeCode(String attributeCode) {
		this.attributeCode = attributeCode;
	}
	
	public String toString() {
		return attributeCode;
	}
	
	public static void main(String[] args){
		System.out.println(EnumAttributeCode.FUNCTION.toString());
	}
	
}
