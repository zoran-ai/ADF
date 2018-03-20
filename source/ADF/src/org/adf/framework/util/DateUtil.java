package org.adf.framework.util;

import java.text.SimpleDateFormat;
import java.util.Date;

@SuppressWarnings("all")
public class DateUtil {
	
	public static final String DATE_FORMAT_DEFAULT = "yyyy-MM-dd";
	public static final String DATE_FORMAT_US = "MM/dd/yyyy";
	public static final String DATE_FORMAT_CN = "yyyy年MM月dd日";
	public static final String DATE_FORMAT_SIMPLE = "yyyyMMdd";
	
	public static final String DATE_TIME_FORMAT_DEFAULT = "yyyy-MM-dd HH:mm:ss";
	public static final String DATE_TIME_FORMAT_US = "MM/dd/yyyy HH:mm:ss";
	public static final String DATE_TIME_FORMAT_CN = "yyyy年MM月dd日 HH时mm分ss秒";
	public static final String DATE_TIME_FORMAT_SIMPLE = "yyyyMMddHHmmss";
	public static final String DATE_TIME_FORMAT_ALL = "yyyyMMddHHmmssSSS";
	
	/**
	 * 将字符串转换成日期
	 */
	public static Date strToDate(String str, String format) throws Exception {
		if (str == null || "".equals(str)) return null;
		return new SimpleDateFormat(format).parse(str);
	}
	
	/**
	 * 将日期转换成字符串
	 */
	public static String dateToStr(Date date, String format) throws Exception {
		if (date == null) return null;
		return new SimpleDateFormat(format).format(date);
	}

}
