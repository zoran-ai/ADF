package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysDataDictItemAttribute;

@Repository
public class SysDataDictItemAttributeDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysDataDictItemAttribute";

    public int insertSysDataDictItemAttribute(SysDataDictItemAttribute obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysDataDictItemAttribute", obj);
    }

    public int updateSysDataDictItemAttribute(SysDataDictItemAttribute obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysDataDictItemAttribute", obj);
    }

    public int deleteSysDataDictItemAttribute(SysDataDictItemAttribute obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysDataDictItemAttribute", obj);
    }

    public SysDataDictItemAttribute selectSysDataDictItemAttributeByPk(SysDataDictItemAttribute obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysDataDictItemAttributeByPk", obj);
    }

}