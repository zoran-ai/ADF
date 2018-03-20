package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysDataStructNodeAttribute;

@Repository
public class SysDataStructNodeAttributeDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysDataStructNodeAttribute";

    public int insertSysDataStructNodeAttribute(SysDataStructNodeAttribute obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysDataStructNodeAttribute", obj);
    }

    public int updateSysDataStructNodeAttribute(SysDataStructNodeAttribute obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysDataStructNodeAttribute", obj);
    }

    public int deleteSysDataStructNodeAttribute(SysDataStructNodeAttribute obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysDataStructNodeAttribute", obj);
    }

    public SysDataStructNodeAttribute selectSysDataStructNodeAttributeByPk(SysDataStructNodeAttribute obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysDataStructNodeAttributeByPk", obj);
    }

}