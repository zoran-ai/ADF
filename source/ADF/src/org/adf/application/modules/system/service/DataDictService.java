package org.adf.application.modules.system.service;

import java.util.List;

import javax.annotation.Resource;

import org.adf.application.common.mybatis.dao.SysDataDictItemAttributeDao;
import org.adf.application.common.mybatis.dao.SysDataDictItemDao;
import org.adf.application.common.mybatis.dao.SysDataDictTypeAttributeDao;
import org.adf.application.common.mybatis.dao.SysDataDictTypeDao;
import org.adf.application.common.mybatis.entity.SysDataDictItem;
import org.adf.application.common.mybatis.entity.SysDataDictItemAttribute;
import org.adf.application.common.mybatis.entity.SysDataDictType;
import org.adf.application.common.mybatis.entity.SysDataDictTypeAttribute;
import org.adf.application.common.mybatis.vo.DataDictItemAttributeVO;
import org.adf.application.common.mybatis.vo.DataDictTypeAttributeVO;
import org.adf.application.modules.system.dao.DataDictDao;
import org.springframework.stereotype.Service;

@Service
@SuppressWarnings("all")
public class DataDictService {

	@Resource
	private DataDictDao dataDictDao;
	
	@Resource
	private SysDataDictTypeDao ddtDao;
	
	@Resource
	private SysDataDictItemDao ddiDao;
	
	@Resource
	private SysDataDictTypeAttributeDao ddtaDao;
	
	@Resource
	private SysDataDictItemAttributeDao ddiaDao;
	
	/**
	 * 获取数据字典类型列表
	 */
	public List<SysDataDictType> getDataDictTypeList() throws Exception {
		return dataDictDao.getDataDictTypeList();
	}
	
	/**
	 * 获取数据字典类型信息
	 */
	public SysDataDictType getDataDictTypeInfo(String typeCode) throws Exception {
		SysDataDictType ddty = new SysDataDictType();
		ddty.setType_code(typeCode);
		return ddtDao.selectSysDataDictTypeByPk(ddty);
	}
	
	/**
	 * 新建数据字典类型
	 */
	public void addDataDictType(SysDataDictType ddt) throws Exception {
		ddtDao.insertSysDataDictType(ddt);
	}
	
	/**
	 * 编辑数据字典类型
	 */
	public void editDataDictType(SysDataDictType ddt) throws Exception {
		ddtDao.updateSysDataDictType(ddt);
	}
	
	/**
	 * 获取数据字典项列表
	 */
	public List<SysDataDictItem> getDataDictItemList(String typeCode) throws Exception {
		return dataDictDao.getDataDictItemList(typeCode);
	}
	
	/**
	 * 获取数据字典项信息
	 */
	public SysDataDictItem getDataDictItemInfo(String typeCode, String itemCode) throws Exception {
		SysDataDictItem ddi = new SysDataDictItem();
		ddi.setType_code(typeCode);
		ddi.setItem_code(itemCode);
		return ddiDao.selectSysDataDictItemByPk(ddi);
	}
	
	/**
	 * 新建数据字典项
	 */
	public void addDataDictItem(SysDataDictItem ddi) throws Exception {
		ddiDao.insertSysDataDictItem(ddi);
	}
	
	/**
	 * 编辑数据字典项
	 */
	public void editDataDictItem(SysDataDictItem ddi) throws Exception {
		ddiDao.updateSysDataDictItem(ddi);
	}
	
	/**
	 * 获取数据字典类型属性列表
	 */
	public List<DataDictTypeAttributeVO> getDataDictTypeAttributeList(String typeCode) throws Exception {
		return dataDictDao.getDataDictTypeAttributeList(typeCode);
	}
	
	/**
	 * 获取数据字典类型属性信息
	 */
	public DataDictTypeAttributeVO getDataDictTypeAttributeInfo(String typeCode, String attributeCode) throws Exception {
		return dataDictDao.getDataDictTypeAttributeInfo(typeCode, attributeCode);
	}
	
	/**
	 * 新建数据字典类型属性
	 */
	public void addDataDictTypeAttribute(SysDataDictTypeAttribute ddta) throws Exception {
		ddtaDao.insertSysDataDictTypeAttribute(ddta);
	}
	
	/**
	 * 编辑数据字典类型属性
	 */
	public void editDataDictTypeAttribute(SysDataDictTypeAttribute ddta) throws Exception {
		ddtaDao.updateSysDataDictTypeAttribute(ddta);
	}
	
	/**
	 * 获取数据字典项属性列表
	 */
	public List<DataDictItemAttributeVO> getDataDictItemAttributeList(
			String typeCode, String itemCode) throws Exception {
		return dataDictDao.getDataDictItemAttributeList(typeCode, itemCode);
	}
	
	/**
	 * 保存数据字典项属性
	 */
	public void saveDataDictItemAttributes(List<DataDictItemAttributeVO> ddiaVOList) throws Exception {
		for (DataDictItemAttributeVO ddiaVO : ddiaVOList) {
			SysDataDictItemAttribute ddiaQuery = new SysDataDictItemAttribute();
			ddiaQuery.setType_code(ddiaVO.getType_code());
			ddiaQuery.setItem_code(ddiaVO.getItem_code());
			ddiaQuery.setAttribute_code(ddiaVO.getAttribute_code());
			
			SysDataDictItemAttribute ddiaEntity = ddiaDao.selectSysDataDictItemAttributeByPk(ddiaQuery);
			
			SysDataDictItemAttribute ddia = new SysDataDictItemAttribute();
			ddia.setType_code(ddiaVO.getType_code());
			ddia.setItem_code(ddiaVO.getItem_code());
			ddia.setAttribute_code(ddiaVO.getAttribute_code());
			ddia.setAttribute_value(ddiaVO.getAttribute_value() == null ? "" : ddiaVO.getAttribute_value());
			
			if (ddiaEntity != null) {
				ddiaDao.updateSysDataDictItemAttribute(ddia);
			} else {
				ddiaDao.insertSysDataDictItemAttribute(ddia);
			}
		}
	}
	
}
