package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysDataDictType;

@Repository
public class SysDataDictTypeDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysDataDictType";

    public int insertSysDataDictType(SysDataDictType obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysDataDictType", obj);
    }

    public int updateSysDataDictType(SysDataDictType obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysDataDictType", obj);
    }

    public int deleteSysDataDictType(SysDataDictType obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysDataDictType", obj);
    }

    public SysDataDictType selectSysDataDictTypeByPk(SysDataDictType obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysDataDictTypeByPk", obj);
    }

}