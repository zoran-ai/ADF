package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysRole;

@Repository
public class SysRoleDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysRole";

    public int insertSysRole(SysRole obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysRole", obj);
    }

    public int updateSysRole(SysRole obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysRole", obj);
    }

    public int deleteSysRole(SysRole obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysRole", obj);
    }

    public SysRole selectSysRoleByPk(SysRole obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysRoleByPk", obj);
    }

}