package org.adf.framework.util.json;

import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

@SuppressWarnings("all")
public class DateJsonValueProcessor implements JsonValueProcessor {

	public DateJsonValueProcessor() {
		super();
	}
	
	@Override
	public Object processArrayValue(Object value, JsonConfig config) {
		return process(value);
	}

	@Override
	public Object processObjectValue(String key, Object value, JsonConfig config) {
		return process(value);
	}

	private Object process(Object value) {
		if (value == null) {
			return "";
		} else {
			Date date = (Date)value;
			String format = "";
			if (date.getHours() == 0 && date.getMinutes() == 0&& date.getSeconds() == 0) {
				format = "yyyy-MM-dd";
			} else {
				format = "yyyy-MM-dd HH:mm:ss";
			}
			return new SimpleDateFormat(format).format((Date)value);
		}
	}

}
