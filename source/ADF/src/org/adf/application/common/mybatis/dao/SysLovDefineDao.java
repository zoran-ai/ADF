package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysLovDefine;

@Repository
public class SysLovDefineDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysLovDefine";

    public int insertSysLovDefine(SysLovDefine obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysLovDefine", obj);
    }

    public int updateSysLovDefine(SysLovDefine obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysLovDefine", obj);
    }

    public int deleteSysLovDefine(SysLovDefine obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysLovDefine", obj);
    }

    public SysLovDefine selectSysLovDefineByPk(SysLovDefine obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysLovDefineByPk", obj);
    }

}