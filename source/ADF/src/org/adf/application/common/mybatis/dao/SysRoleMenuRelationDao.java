package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysRoleMenuRelation;

@Repository
public class SysRoleMenuRelationDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysRoleMenuRelation";

    public int insertSysRoleMenuRelation(SysRoleMenuRelation obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysRoleMenuRelation", obj);
    }

    public int updateSysRoleMenuRelation(SysRoleMenuRelation obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysRoleMenuRelation", obj);
    }

    public int deleteSysRoleMenuRelation(SysRoleMenuRelation obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysRoleMenuRelation", obj);
    }

    public SysRoleMenuRelation selectSysRoleMenuRelationByPk(SysRoleMenuRelation obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysRoleMenuRelationByPk", obj);
    }

}