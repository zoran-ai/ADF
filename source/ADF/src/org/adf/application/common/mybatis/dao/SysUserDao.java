package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysUser;

@Repository
public class SysUserDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysUser";

    public int insertSysUser(SysUser obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysUser", obj);
    }

    public int updateSysUser(SysUser obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysUser", obj);
    }

    public int deleteSysUser(SysUser obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysUser", obj);
    }

    public SysUser selectSysUserByPk(SysUser obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysUserByPk", obj);
    }

}