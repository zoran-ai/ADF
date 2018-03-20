package org.adf.application.common.lov.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.adf.application.common.lov.dao.LovDao;
import org.adf.application.common.mybatis.entity.SysLovColumn;

@Service
@SuppressWarnings("all")
public class LovService {

	@Resource
	private LovDao lovDao;
	
	/**
	 * 获取值列表字段列表
	 */
	public List<SysLovColumn> getLovColumnList(String schema, String lovCode) throws Exception {
		return lovDao.getLovColumnList(schema, lovCode);
	}
	
	/**
	 * 获取值列表视图SQL
	 */
	public String getLovViewSQL(String schema, String lovCode) throws Exception {
		return lovDao.getLovViewSQL(schema, lovCode);
	}
	
	/**
	 * 获取值列表数据列表
	 * @param sql SQL文本
	 */
	public List<Map<String, Object>> getLovDataList(String sql) throws Exception {
		return lovDao.getLovDataList(sql);
	}
	
	
}
