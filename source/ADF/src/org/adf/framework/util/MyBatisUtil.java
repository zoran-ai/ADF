package org.adf.framework.util;

import java.util.ArrayList;
import java.util.List;

import org.adf.framework.mybatis.generate.service.MyBatisService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class MyBatisUtil {

	public static void main(String[] args) throws Exception {
		String sourcePrefixPath = "E:\\IT\\Workbench\\ai\\svn\\adf\\src\\";
		String springPrefixPath = "E:\\IT\\Workbench\\ai\\svn\\adf\\WebRoot\\WEB-INF\\resource\\spring\\";
		String tableSchema = "adfdb";
		
		List<String> tableList = new ArrayList<String>();
		
//		tableList.add("sys_parameter_type");
//		tableList.add("sys_parameter_define");
//		tableList.add("sys_parameter_config");
//		tableList.add("sys_data_dict_type");
//		tableList.add("sys_data_dict_type_attribute");
//		tableList.add("sys_data_dict_item");
//		tableList.add("sys_data_dict_item_attribute");
//		tableList.add("sys_data_struct_define");
//		tableList.add("sys_data_struct_attribute");
//		tableList.add("sys_data_struct_node");
//		tableList.add("sys_data_struct_node_attribute");
//		tableList.add("sys_lov_define");
//		tableList.add("sys_lov_column");
//		tableList.add("sys_function");
//		tableList.add("sys_operation");
//		tableList.add("sys_flex_field_define");
//		tableList.add("sys_flex_field_column");

		String[] springConfigFiles = {
				springPrefixPath + "applicationContext.xml",
				springPrefixPath + "applicationContext-mybatis.xml" };
		
		ApplicationContext context = new FileSystemXmlApplicationContext(springConfigFiles);
		
		MyBatisService service = (MyBatisService) context.getBean("myBatisService");
		
		for (String tableName : tableList) {
			if (tableName != null && !"".equals(tableName)) {
				service.generator(sourcePrefixPath, tableSchema, tableName);
			}
		}
	}

}
