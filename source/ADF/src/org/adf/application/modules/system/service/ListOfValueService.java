package org.adf.application.modules.system.service;

import java.util.List;

import javax.annotation.Resource;

import org.adf.application.common.mybatis.dao.SysLovColumnDao;
import org.adf.application.common.mybatis.dao.SysLovDefineDao;
import org.adf.application.common.mybatis.entity.SysLovColumn;
import org.adf.application.common.mybatis.entity.SysLovDefine;
import org.adf.application.modules.system.dao.ListOfValueDao;
import org.springframework.stereotype.Service;

@Service
@SuppressWarnings("all")
public class ListOfValueService {

	@Resource
	private ListOfValueDao listOfValueDao;
	
	@Resource
	private SysLovDefineDao sldDao;
	
	@Resource
	private SysLovColumnDao slcDao;
	
	/**
	 * 获取值列表定义列表
	 */
	public List<SysLovDefine> getLovDefineList() throws Exception {
		return listOfValueDao.getLovDefineList();
	}
	
	/**
	 * 获取值列表视图列表
	 */
	public List<String> getLovViewList(String schema) throws Exception {
		return listOfValueDao.getLovViewList(schema);
	}
	
	/**
	 * 获取视图字段列表
	 */
	public List<SysLovColumn> getViewColumnList(String schema, String viewName) throws Exception {
		return listOfValueDao.getViewColumnList(schema, viewName);
	}
	
	/**
	 * 获取值列表字段列表
	 */
	public List<SysLovColumn> getLovColumnList(String schema, String viewName, String lovCode) throws Exception {
		return listOfValueDao.getLovColumnList(schema, viewName, lovCode);
	}
	
	/**
	 * 获取值列表定义信息
	 */
	public SysLovDefine getLovDefineInfo(String lovCode) throws Exception {
		SysLovDefine sld = new SysLovDefine();
		sld.setLov_code(lovCode);
		return sldDao.selectSysLovDefineByPk(sld);
	}
	
	/**
	 * 保存LOV信息
	 */
	public void saveLovInfo(SysLovDefine sld, List<SysLovColumn> slcList) throws Exception {
		SysLovDefine sldQuery = new SysLovDefine();
		sldQuery.setLov_code(sld.getLov_code());
		
		SysLovDefine oldSLD = sldDao.selectSysLovDefineByPk(sldQuery);
		
		if (oldSLD == null) {
			sldDao.insertSysLovDefine(sld);
		} else {
			sldDao.updateSysLovDefine(sld);
		}
		
		listOfValueDao.removeLovColumnList(sld.getLov_code());
		
		for (SysLovColumn slc : slcList) {
			slcDao.insertSysLovColumn(slc);
		}
	}
	
}
