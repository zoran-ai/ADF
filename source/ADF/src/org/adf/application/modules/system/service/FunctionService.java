package org.adf.application.modules.system.service;

import java.util.List;

import javax.annotation.Resource;

import org.adf.application.common.mybatis.dao.SysFunctionDao;
import org.adf.application.common.mybatis.dao.SysOperationDao;
import org.adf.application.common.mybatis.entity.SysFunction;
import org.adf.application.common.mybatis.entity.SysOperation;
import org.adf.application.modules.system.dao.FunctionDao;
import org.springframework.stereotype.Service;

@Service
@SuppressWarnings("all")
public class FunctionService {

	@Resource
	private FunctionDao functionDao;
	
	@Resource
	private SysFunctionDao sfDao;
	
	@Resource
	private SysOperationDao soDao;
	
	/**
	 * 获取功能列表
	 */
	public List<SysFunction> getFunctionList() throws Exception {
		return functionDao.getFunctionList();
	}
	
	/**
	 * 获取功能信息
	 */
	public SysFunction getFunctionInfo(String functionCode) throws Exception {
		SysFunction sf = new SysFunction();
		sf.setFunction_code(functionCode);
		return sfDao.selectSysFunctionByPk(sf);
	}
	
	/**
	 * 新建功能
	 */
	public void addFunction(SysFunction sf) throws Exception {
		sfDao.insertSysFunction(sf);
	}
	
	/**
	 * 编辑功能
	 */
	public void editFunction(SysFunction sf) throws Exception {
		sfDao.updateSysFunction(sf);
	}
	
	/**
	 * 获取操作列表
	 */
	public List<SysOperation> getOperationList(String functionCode) throws Exception {
		return functionDao.getOperationList(functionCode);
	}
	
	/**
	 * 获取操作信息
	 */
	public SysOperation getOperationInfo(String operationCode) throws Exception {
		SysOperation so = new SysOperation();
		so.setOperation_code(operationCode);
		return soDao.selectSysOperationByPk(so);
	}
	
	/**
	 * 新建操作
	 */
	public void addOperation(SysOperation so) throws Exception {
		soDao.insertSysOperation(so);
	}
	
	/**
	 * 编辑操作
	 */
	public void editOperation(SysOperation so) throws Exception {
		soDao.updateSysOperation(so);
	}
	
}
