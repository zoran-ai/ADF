package org.adf.framework.mybatis.generate.service;

import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.adf.application.common.mybatis.vo.ColumnVO;
import org.adf.application.common.mybatis.vo.PKColumnVO;
import org.adf.framework.mybatis.generate.dao.MyBatisDao;
import org.springframework.stereotype.Service;

@Service
@SuppressWarnings("all")
public class MyBatisService {
	
	@Resource
	private MyBatisDao myBatisDao;
	
	public final static String model_package = "org.adf.application.common.mybatis.entity";
	public final static String mapper_package = "org.adf.application.common.mybatis.mapper";
	public final static String dao_package = "org.adf.application.common.mybatis.dao";
	
	public final static String model_path = "org/adf/application/common/mybatis/entity/";
	public final static String mapper_path = "org/adf/application/common/mybatis/mapper/";
	public final static String dao_path = "org/adf/application/common/mybatis/dao/";
	
	private String prefixPath;
	private String tableSchema;
	private String tableName;
	
	private List<ColumnVO> columnList;
	private List<PKColumnVO> pkColumnList;
	
	public String getPrefixPath() {
		return prefixPath;
	}

	public void setPrefixPath(String prefixPath) {
		this.prefixPath = prefixPath;
	}

	public String getTableSchema() {
		return tableSchema;
	}

	public void setTableSchema(String tableSchema) {
		this.tableSchema = tableSchema;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public List<ColumnVO> getColumnList() {
		return columnList;
	}

	public void setColumnList(List<ColumnVO> columnList) {
		this.columnList = columnList;
	}

	public List<PKColumnVO> getPkColumnList() {
		return pkColumnList;
	}

	public void setPkColumnList(List<PKColumnVO> pkColumnList) {
		this.pkColumnList = pkColumnList;
	}

	/**
	 * 生成Model、Mapper、Dao文件
	 * @param prefixPath  文件路径前缀
	 * @param tableSchema 数据库用户
	 * @param tableName   数据库表
	 */
	public void generator(String prefixPath, String tableSchema, String tableName) throws Exception {
		// 设置文件路径前缀
		this.setPrefixPath(prefixPath);
		// 设置数据库用户
		this.setTableSchema(tableSchema);
		// 设置表名
		this.setTableName(tableName);
		
		// 设置字段
		this.setColumnList(myBatisDao.getColumnList(tableSchema, tableName));
		// 设置主键
		this.setPkColumnList(myBatisDao.getPKColumnList(tableSchema, tableName));
		
		if ((this.getColumnList() != null && this.getColumnList().size() > 0)
			&& (this.getPkColumnList() != null && this.getPkColumnList().size() > 0)) {
			// 生成Model文件
			generatorModel();
			// 生成Mapper文件
			generatorMapper();
			// 生成Dao文件
			generatorDao();
		}
	}

	/**
	 * 生成Model文件
	 */
	private void generatorModel() throws Exception {
		String filePath = prefixPath + model_path;
		String fileName = getModelName(tableName) + ".java";
		String fileContent = getModelFileContent();
		
		writeFile(filePath, fileName, fileContent);
		
		System.out.println("Model文件生成成功：" + filePath + fileName);
	}
	
	/**
	 * 生成Mapper文件
	 */
	private void generatorMapper() throws Exception {
		String filePath = prefixPath + mapper_path;
		String fileName = getModelName(tableName) + ".xml";
		String fileContent = getMapperFileContent();
		
		writeFile(filePath, fileName, fileContent);
		
		System.out.println("Mapper文件生成成功：" + filePath + fileName);
	}
	
	/**
	 * 生成Dao文件
	 */
	private void generatorDao() throws Exception {
		String filePath = prefixPath + dao_path;
		String fileName = getModelName(tableName) + "Dao.java";
		String fileContent = getDaoFileContent();
		
		writeFile(filePath, fileName, fileContent);
		
		System.out.println("DAO文件生成成功：" + filePath + fileName);
	}
	
	/**
	 * 获取Model文件内容
	 */
	private String getModelFileContent() throws Exception {
		String fileContent = "";
		
		fileContent += "package " + model_package + ";\n\n";
		
		fileContent += "import org.apache.ibatis.type.Alias;\n\n";
		
		fileContent += "@Alias(\"" + getModelName(tableName) + "\")\n";
		
		fileContent += "public class " + getModelName(tableName) + " {\n\n";
		
		for (ColumnVO column : columnList) {
			fileContent += "    private String " + column.getColumn_name() + ";\n";
		}
		
		fileContent += "\n";
		
		for (ColumnVO column : columnList) {
			String columnName = column.getColumn_name();
			String firstUpper = String.valueOf(columnName.charAt(0)).toUpperCase() + columnName.substring(1, columnName.length());
			
			fileContent += "    public String get" + firstUpper + "() {\n";
			fileContent += "        return " + columnName + ";\n";
			fileContent += "    }\n\n";
			
			fileContent += "    public void set" + firstUpper + "(String " + columnName + ") {\n";
			fileContent += "        this." + columnName + " = " + columnName + ";\n";
			fileContent += "    }\n\n";
		}
		
		fileContent += "}";
		
		return fileContent;
	}
	
	/**
	 * 获取Mapper文件内容
	 */
	private String getMapperFileContent() throws Exception {
		String modelName = getModelName(tableName);
		
		String fileContent = "";
		
		fileContent += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
		fileContent += "<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\" \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\n";
		fileContent += "<mapper namespace=\"" + mapper_package + "." + modelName + "\">\n\n";
		
		fileContent += "    <insert id=\"insert" + modelName + "\" parameterType=\"" + modelName + "\">\n";
		fileContent += "        insert into " + tableName.toLowerCase() + "\n";
		int i = 0;
		for (ColumnVO column : columnList) {
			if (i == 0) {
				fileContent += "       (" + column.getColumn_name() + "\n";
			} else if (i == columnList.size() - 1){
				fileContent += "       ," + column.getColumn_name() + ")\n";
			} else {
				fileContent += "       ," + column.getColumn_name() + "\n";
			}
			i++;
		}
		fileContent += "        values\n";
		int j = 0;
		for (ColumnVO column : columnList) {
			if (j == 0) {
				if ("date".equals(column.getData_type())) {
					fileContent += "       (to_date(#{" + column.getColumn_name() + "},'yyyy-mm-dd hh24:mi:ss')\n";
				} else {
					fileContent += "       (#{" + column.getColumn_name() + "}\n";
				}
			} else if (j == columnList.size() - 1){
				if ("date".equals(column.getData_type())) {
					fileContent += "       ,to_date(#{" + column.getColumn_name() + "},'yyyy-mm-dd hh24:mi:ss'))\n";
				} else {
					fileContent += "       ,#{" + column.getColumn_name() + "})\n";
				}
			} else {
				if ("date".equals(column.getData_type())) {
					fileContent += "       ,to_date(#{" + column.getColumn_name() + "},'yyyy-mm-dd hh24:mi:ss')\n";
				} else {
					fileContent += "       ,#{" + column.getColumn_name() + "}\n";
				}
			}
			j++;
		}
		fileContent += "    </insert>\n\n";
		
		fileContent += "    <update id=\"update" + modelName + "\" parameterType=\"" + modelName + "\">\n";
		fileContent += "        update " + tableName.toLowerCase() + "\n";
		int k = 0;
		for (ColumnVO column : columnList) {
			if (k == 0) {
				if ("date".equals(column.getData_type())) {
					fileContent += "           set " + column.getColumn_name() + " = to_date(#{" + column.getColumn_name() + "},'yyyy-mm-dd hh24:mi:ss')\n";
				} else {
					fileContent += "           set " + column.getColumn_name() + " = #{" + column.getColumn_name() + "}\n";
				}
			} else {
				if ("date".equals(column.getData_type())) {
					fileContent += "              ," + column.getColumn_name() + " = to_date(#{" + column.getColumn_name() + "},'yyyy-mm-dd hh24:mi:ss')\n";
				} else {
					fileContent += "              ," + column.getColumn_name() + " = #{" + column.getColumn_name() + "}\n";
				}
				
			}
			k++;
		}
		fileContent += "         where 1 = 1\n";
		
		for (PKColumnVO pkColumn : pkColumnList) {
			fileContent += "           and " + pkColumn.getColumn_name() + " = #{" + pkColumn.getColumn_name() + "}\n";
		}
		
		fileContent += "    </update>\n\n";
		
		fileContent += "    <delete id=\"delete" + modelName + "\" parameterType=\"" + modelName + "\">\n";
		fileContent += "        delete\n";
		fileContent += "          from " + tableName.toLowerCase() + "\n";
		
		fileContent += "         where 1 = 1\n";
		
		for (PKColumnVO pkColumn : pkColumnList) {
			fileContent += "           and " + pkColumn.getColumn_name() + " = #{" + pkColumn.getColumn_name() + "}\n";
		}
		
		fileContent += "    </delete>\n\n";
		
		fileContent += "    <select id=\"select" + modelName + "ByPk\" parameterType=\"" + modelName + "\" resultType=\"" + modelName + "\">\n";
		int l = 0;
		for (ColumnVO column : columnList) {
			if (l == 0) {
				if ("date".equals(column.getData_type())) {
					fileContent += "        select to_char(" + column.getColumn_name() + ",'yyyy-mm-dd hh24:mi:ss') " + column.getColumn_name() + "\n";
				} else {
					fileContent += "        select " + column.getColumn_name() + "\n";
				}
			} else {
				if ("date".equals(column.getData_type())) {
					fileContent += "              ,to_char(" + column.getColumn_name() + ",'yyyy-mm-dd hh24:mi:ss') " + column.getColumn_name() + "\n";
				} else {
					fileContent += "              ," + column.getColumn_name() + "\n";
				}
			} 
			l++;
		}
		fileContent += "          from " + tableName.toLowerCase() + "\n";
		
		fileContent += "         where 1 = 1\n";
		
		for (PKColumnVO pkColumn : pkColumnList) {
			fileContent += "           and " + pkColumn.getColumn_name() + " = #{" + pkColumn.getColumn_name() + "}\n";
		}
		fileContent += "    </select>\n\n";
		
		fileContent += "</mapper>";
		
		return fileContent;
	}
	
	/**
	 * 获取Dao文件内容
	 */
	private String getDaoFileContent() throws Exception {
		String fileContent = "";
		
		fileContent += "package " + dao_package + ";\n\n";
		fileContent += "import org.springframework.stereotype.Repository;\n\n";
		fileContent += "import org.adf.framework.mybatis.dao.BaseDao;\n\n";
		fileContent += "import " + model_package + "." + getModelName(tableName) + ";\n\n";
		fileContent += "@Repository\n";
		fileContent += "public class " + getModelName(tableName) + "Dao extends BaseDao {\n\n";
		fileContent += "    public static final String NAMESPACE = \"" + mapper_package + "." + getModelName(tableName) + "\";\n\n";
		
		fileContent += "    public int insert" + getModelName(tableName) + "(" + getModelName(tableName) + " obj) throws Exception {\n";
		fileContent += "        return insert(NAMESPACE + \".\" + \"insert" + getModelName(tableName) + "\", obj);\n";
		fileContent += "    }\n\n";	
		
		fileContent += "    public int update" + getModelName(tableName) + "(" + getModelName(tableName) + " obj) throws Exception {\n";
		fileContent += "        return update(NAMESPACE + \".\" + \"update" + getModelName(tableName) + "\", obj);\n";
		fileContent += "    }\n\n";	
		
		fileContent += "    public int delete" + getModelName(tableName) + "(" + getModelName(tableName) + " obj) throws Exception {\n";
		fileContent += "        return delete(NAMESPACE  + \".\" + \"delete" + getModelName(tableName) + "\", obj);\n";
		fileContent += "    }\n\n";	
		
		fileContent += "    public " + getModelName(tableName) + " select" + getModelName(tableName) + "ByPk" + "(" + getModelName(tableName) + " obj) throws Exception {\n";
		fileContent += "        return selectOne(NAMESPACE + \".\" + \"select" + getModelName(tableName) + "ByPk\", obj);\n";
		fileContent += "    }\n\n";	
		
		fileContent += "}";
		
		return fileContent;
	}

	/**
	 * 根据表名获取Model类的名称
	 * @param tableName 表名
	 */
	private String getModelName(String tableName) {
		StringBuffer modelName = new StringBuffer("");
		
		tableName = tableName.toLowerCase();
		
		List<Integer> upperList = new ArrayList<Integer>();
		upperList.add(0);
		
		for (int i=0; i<tableName.length(); i++) {
			String str = String.valueOf(tableName.charAt(i));
			if ("_".equals(str)) {
				upperList.add(i+1);
			}
		}
		
		for (int i=0; i<tableName.length(); i++) {
			String str = String.valueOf(tableName.charAt(i));
			if (upperList.contains(i)) {
				modelName.append(str.toUpperCase());
			} else {
				modelName.append(str);
			}
		}
		
		return modelName.toString().replaceAll("_", "");
	}
	
	/**
	 * 写文件
	 * @param path    文件路径
	 * @param name    文件名称
	 * @param content 文件内容
	 */
	public void writeFile(String path, String name, String content) throws Exception {
		FileWriter fw = new FileWriter(path + name);
		fw.write(content);
		fw.close();
	}
	
}