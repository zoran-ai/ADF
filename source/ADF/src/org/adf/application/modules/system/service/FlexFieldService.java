package org.adf.application.modules.system.service;

import java.util.List;

import javax.annotation.Resource;

import org.adf.application.common.mybatis.dao.SysFlexFieldColumnDao;
import org.adf.application.common.mybatis.dao.SysFlexFieldDefineDao;
import org.adf.application.common.mybatis.entity.SysFlexFieldColumn;
import org.adf.application.common.mybatis.entity.SysFlexFieldDefine;
import org.adf.application.common.mybatis.vo.FlexFieldColumnVO;
import org.adf.application.modules.system.dao.FlexFieldDao;
import org.springframework.stereotype.Service;

@Service
@SuppressWarnings("all")
public class FlexFieldService {

	@Resource
	private FlexFieldDao flexFieldDao;
	
	@Resource
	private SysFlexFieldDefineDao ffdDao;
	
	@Resource
	private SysFlexFieldColumnDao ffcDao;
	
	/**
	 * 获取弹性域定义列表
	 */
	public List<SysFlexFieldDefine> getFlexFieldDefineList() throws Exception {
		return flexFieldDao.getFlexFieldDefineList();
	}
	
	/**
	 * 获取弹性域定义信息
	 * @param flexCode 弹性域编码
	 */
	public SysFlexFieldDefine getFlexFieldDefineInfo(String flexCode) throws Exception {
		SysFlexFieldDefine ffd = new SysFlexFieldDefine();
		ffd.setFlex_code(flexCode);
		return ffdDao.selectSysFlexFieldDefineByPk(ffd);
	}
	
	/**
	 * 新建弹性域定义
	 */
	public void addFlexFieldDefine(SysFlexFieldDefine ffd) throws Exception {
		ffdDao.insertSysFlexFieldDefine(ffd);
	}
	
	/**
	 * 编辑弹性域定义
	 */
	public void editFlexFieldDefine(SysFlexFieldDefine ffd) throws Exception {
		ffdDao.updateSysFlexFieldDefine(ffd);
	}
	
	/**
	 * 获取弹性域字段列表
	 * @param flexCode 弹性域编码
	 */
	public List<FlexFieldColumnVO> getFlexFieldColumnList(String flexCode) throws Exception {
		return flexFieldDao.getFlexFieldColumnList(flexCode);
	}
	
	/**
	 * 获取弹性域字段信息
	 * @param flexCode 弹性域编码
	 */
	public FlexFieldColumnVO getFlexFieldColumnInfo(String flexCode, String columnName) throws Exception {
		return flexFieldDao.getFlexFieldColumnInfo(flexCode, columnName);
	}
	
	/**
	 * 新建弹性域字段
	 */
	public void addFlexFieldColumn(SysFlexFieldColumn ffc) throws Exception {
		ffcDao.insertSysFlexFieldColumn(ffc);
	}
	
	/**
	 * 编辑弹性域字段
	 */
	public void editFlexFieldColumn(SysFlexFieldColumn ffc) throws Exception {
		ffcDao.updateSysFlexFieldColumn(ffc);
	}
	
	/**
	 * 获取表列表
	 */
	public List<String> getTableList(String schema) throws Exception {
		return flexFieldDao.getTableList(schema);
	}
	
	/**
	 * 获取表字段信息列表
	 * @param schema    数据库用户
	 * @param tableName 数据库表
	 */
	public List<String> getAttributeColumnList(String schema, String tableName) throws Exception {
		return flexFieldDao.getAttributeColumnList(schema, tableName);
	}
	
}
