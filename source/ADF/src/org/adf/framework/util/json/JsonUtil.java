package org.adf.framework.util.json;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.DefaultValueProcessor;
import net.sf.json.util.JSONUtils;

import org.apache.poi.ss.formula.functions.T;

@SuppressWarnings("all")
public class JsonUtil {

	private static JsonConfig config;
	
	static {
		String[] dateFormats = new String[] {"yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd"};
		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(dateFormats));
		
		config = new JsonConfig();
		config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());
		
		config.registerDefaultValueProcessor(Integer.class,
				new DefaultValueProcessor() {
					public Object getDefaultValue(Class type) {
						return null;
					}
				});
		config.registerDefaultValueProcessor(Long.class,
				new DefaultValueProcessor() {
					public Object getDefaultValue(Class type) {
						return null;
					}
				});
		config.registerDefaultValueProcessor(Double.class,
				new DefaultValueProcessor() {
					public Object getDefaultValue(Class type) {
						return null;
					}
				});
	}
	
	/**
	 * JSON转换成Map
	 */
	public static Map getMapFromJSON(String json) {
		Map map = new HashMap();

		JSONObject jsonObject = JSONObject.fromObject(json);
		Iterator it = jsonObject.keys();
		while (it.hasNext()) {
			String key = (String) it.next();
			Object value = jsonObject.get(key);
			map.put(key, value);
		}

		return map;
	}

	/**
	 * Map转换成JSON
	 */
	public static String getJSONFromMap(Map map) {
		JSONObject jsonObject = JSONObject.fromObject(map, config);
		return jsonObject.toString();
	}
	
	/**
	 * JSON转换成Java对象
	 */
	public static Object getObjectFromJSON(String originJson, Class targetClass) {
		JSONObject jsonObject = JSONObject.fromObject(originJson);
		return JSONObject.toBean(jsonObject, targetClass);
	}

	/**
	 * Java对象转换成JSON
	 */
	public static String getJSONFromObject(Object obj) {
		JSONObject jsonObject = JSONObject.fromObject(obj, config);
		return jsonObject.toString();
	}

	/**
	 * JSON转换成Array
	 */
	public static Object[] getObjectArrayFromJSON(String json) {
		JSONArray jsonArray = JSONArray.fromObject(json);
		return jsonArray.toArray();
	}

	/**
	 * Array转换成JSON
	 */
	public static String getJSONFromObjectArray(Object[] objectArray) {
		JSONArray jsonArray = JSONArray.fromObject(objectArray, config);
		return jsonArray.toString();
	}
	
	/**
	 * JSON转换成List
	 */
	public static <T> List<T> getListFromJSON(String json, Class targetClass) {
		JSONArray jsonArray = JSONArray.fromObject(json);
		List<T> list = new ArrayList<T>();
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject object = (JSONObject) jsonArray.get(i);
			T t = (T) JSONObject.toBean(object, targetClass);
			if (t != null) {
				list.add(t);
			}
		}
		return list;
	}
	
	/**
	 * List转换成JSON
	 */
	public static String getJSONFromObjectList(List objectList) {
		JSONArray jsonArray = JSONArray.fromObject(objectList);
		return jsonArray.toString();
	}

}
