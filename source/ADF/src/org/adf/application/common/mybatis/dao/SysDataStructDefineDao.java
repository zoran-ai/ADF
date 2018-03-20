package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysDataStructDefine;

@Repository
public class SysDataStructDefineDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysDataStructDefine";

    public int insertSysDataStructDefine(SysDataStructDefine obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysDataStructDefine", obj);
    }

    public int updateSysDataStructDefine(SysDataStructDefine obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysDataStructDefine", obj);
    }

    public int deleteSysDataStructDefine(SysDataStructDefine obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysDataStructDefine", obj);
    }

    public SysDataStructDefine selectSysDataStructDefineByPk(SysDataStructDefine obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysDataStructDefineByPk", obj);
    }

}