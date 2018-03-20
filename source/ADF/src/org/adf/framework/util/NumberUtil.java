package org.adf.framework.util;

import java.text.DecimalFormat;
import java.text.NumberFormat;

@SuppressWarnings("all")
public class NumberUtil {

	/**
	 * 四舍五入，保留若干位小数
	 * @param number    待格式化的数字
	 * @param isFixed   是否显示固定的小数位数
	 * @param several   保留小数的位数
	 */
	public static String formatSeveralDigits(Double number, boolean isFixed, int several) {
		String result = "";
		
		if (number != null) {
			String pattern = "";
			
			DecimalFormat df = (DecimalFormat) NumberFormat.getInstance(); 
			
			if (isFixed) {
				pattern = "0.";
				for (int i = 0; i < several; i++) {
					pattern += "0";
				}
				
				df.applyPattern(pattern);
				
				result = df.format(number);
			} else {
				if (Math.round(number) - number == 0) {
					result = String.valueOf((long)number.doubleValue());
				} else {
					pattern = "0.";
					for (int i = 0; i < several; i++) {
						pattern += "#";
					}
					
					df.applyPattern(pattern);
					
					result = df.format(number);
				}
			}
		}
		
		return result;
	}

}
