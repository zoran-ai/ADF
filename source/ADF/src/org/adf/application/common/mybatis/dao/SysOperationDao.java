package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysOperation;

@Repository
public class SysOperationDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysOperation";

    public int insertSysOperation(SysOperation obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysOperation", obj);
    }

    public int updateSysOperation(SysOperation obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysOperation", obj);
    }

    public int deleteSysOperation(SysOperation obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysOperation", obj);
    }

    public SysOperation selectSysOperationByPk(SysOperation obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysOperationByPk", obj);
    }

}