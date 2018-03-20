package org.adf.application.common.list.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.adf.application.common.list.dao.ListDao;
import org.adf.application.common.mybatis.entity.SysDataDictItem;

@Service
@SuppressWarnings("all")
public class ListService {

	@Resource
	private ListDao listDao;
	
	/**
	 * 根据一个数据字典类型获取数据字典项列表
	 */
	public List<SysDataDictItem> getSingleDataDictItemList(String typeCode,
			String enabledFlag) throws Exception {
		return listDao.getSingleDataDictItemList(typeCode, enabledFlag);
	}
	
	/**
	 * 根据多个数据字典类型获取数据字典项列表
	 */
	public List<SysDataDictItem> getMultiDataDictItemList(String typeCodes,
			String enabledFlag) throws Exception {
		return listDao.getMultiDataDictItemList(typeCodes, enabledFlag);
	}
	
}
