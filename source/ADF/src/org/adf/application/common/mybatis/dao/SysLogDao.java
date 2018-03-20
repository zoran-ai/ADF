package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysLog;

@Repository
public class SysLogDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysLog";

    public int insertSysLog(SysLog obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysLog", obj);
    }

    public int updateSysLog(SysLog obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysLog", obj);
    }

    public int deleteSysLog(SysLog obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysLog", obj);
    }

    public SysLog selectSysLogByPk(SysLog obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysLogByPk", obj);
    }

}