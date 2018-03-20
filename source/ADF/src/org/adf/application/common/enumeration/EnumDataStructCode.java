package org.adf.application.common.enumeration;

public enum EnumDataStructCode {
	
	MENU("menu_resource");
	
	private String dataStructCode;

	private EnumDataStructCode(String dataStructCode) {
		this.dataStructCode = dataStructCode;
	}
	
	public String toString() {
		return dataStructCode;
	}
	
	public static void main(String[] args){
		System.out.println(EnumDataStructCode.MENU.toString());
	}
	
}
