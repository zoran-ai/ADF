package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysFlexFieldDefine;

@Repository
public class SysFlexFieldDefineDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysFlexFieldDefine";

    public int insertSysFlexFieldDefine(SysFlexFieldDefine obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysFlexFieldDefine", obj);
    }

    public int updateSysFlexFieldDefine(SysFlexFieldDefine obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysFlexFieldDefine", obj);
    }

    public int deleteSysFlexFieldDefine(SysFlexFieldDefine obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysFlexFieldDefine", obj);
    }

    public SysFlexFieldDefine selectSysFlexFieldDefineByPk(SysFlexFieldDefine obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysFlexFieldDefineByPk", obj);
    }

}