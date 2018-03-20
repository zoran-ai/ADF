package org.adf.application.common.enumeration;

public enum EnumParameter {
	
	COMPANY_NAME("company_name");
	
	private String parameterCode;

	private EnumParameter(String parameterCode) {
		this.parameterCode = parameterCode;
	}
	
	public String toString() {
		return parameterCode;
	}
	
	public static void main(String[] args){
		System.out.println(EnumParameter.COMPANY_NAME.toString());
	}
	
}
