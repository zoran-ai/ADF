package org.adf.framework.util.json;

import java.io.FileWriter;
import java.lang.reflect.Field;

@SuppressWarnings("all")
public class GeneratorJSONUtil {

	public final static String model_path = "js/json/model/";
	
	public static void general(String className) throws Exception {
		String prefixPath = GeneratorJSONUtil.class.getResource("/").toString();
		prefixPath = prefixPath.substring(6, prefixPath.indexOf("WebRoot")) + "WebRoot/";
		
		String filePath = prefixPath + model_path;
		String fileName = className.substring(className.lastIndexOf(".")+1, className.length()) + ".js";
		String fileContext = getFileContext(className);
		
		writeFile(filePath, fileName, fileContext);
		
		System.out.println("JS文件生成成功！[" + fileName + "]");
	}
	
	private static String getFileContext(String className) throws Exception {
		String context = "";
		
		String name = className.substring(className.lastIndexOf(".")+1, className.length());
		
		Class model = Class.forName(className);
		Field[] fieldArr = model.getDeclaredFields();
		
		context = "function " + name + "() {\n";
		for (Field field : fieldArr) {
				context += "	this." + field.getName() + " = null;\n";
		}
		context += "}";
		
		return context;
	}

	/**
	 * 写文件
	 * @param path    文件路径
	 * @param name    文件名称
	 * @param content 文件内容
	 */
	private static void writeFile(String path, String name, String content) throws Exception {
		FileWriter fw = new FileWriter(path + name);
		fw.write(content);
		fw.close();
	}
	
	public static void main(String[] args) {
		try {
			String pkg = "org.adf.application.common.mybatis.entity.";
			String cla = "SysFlexFieldColumn";
			GeneratorJSONUtil.general(pkg + cla);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
