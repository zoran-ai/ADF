package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysFunction;

@Repository
public class SysFunctionDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysFunction";

    public int insertSysFunction(SysFunction obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysFunction", obj);
    }

    public int updateSysFunction(SysFunction obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysFunction", obj);
    }

    public int deleteSysFunction(SysFunction obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysFunction", obj);
    }

    public SysFunction selectSysFunctionByPk(SysFunction obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysFunctionByPk", obj);
    }

}