package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysDataDictItem;

@Repository
public class SysDataDictItemDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysDataDictItem";

    public int insertSysDataDictItem(SysDataDictItem obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysDataDictItem", obj);
    }

    public int updateSysDataDictItem(SysDataDictItem obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysDataDictItem", obj);
    }

    public int deleteSysDataDictItem(SysDataDictItem obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysDataDictItem", obj);
    }

    public SysDataDictItem selectSysDataDictItemByPk(SysDataDictItem obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysDataDictItemByPk", obj);
    }

}