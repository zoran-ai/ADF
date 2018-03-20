package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysDataDictTypeAttribute;

@Repository
public class SysDataDictTypeAttributeDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysDataDictTypeAttribute";

    public int insertSysDataDictTypeAttribute(SysDataDictTypeAttribute obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysDataDictTypeAttribute", obj);
    }

    public int updateSysDataDictTypeAttribute(SysDataDictTypeAttribute obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysDataDictTypeAttribute", obj);
    }

    public int deleteSysDataDictTypeAttribute(SysDataDictTypeAttribute obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysDataDictTypeAttribute", obj);
    }

    public SysDataDictTypeAttribute selectSysDataDictTypeAttributeByPk(SysDataDictTypeAttribute obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysDataDictTypeAttributeByPk", obj);
    }

}