package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysRoleUserRelation;

@Repository
public class SysRoleUserRelationDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysRoleUserRelation";

    public int insertSysRoleUserRelation(SysRoleUserRelation obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysRoleUserRelation", obj);
    }

    public int updateSysRoleUserRelation(SysRoleUserRelation obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysRoleUserRelation", obj);
    }

    public int deleteSysRoleUserRelation(SysRoleUserRelation obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysRoleUserRelation", obj);
    }

    public SysRoleUserRelation selectSysRoleUserRelationByPk(SysRoleUserRelation obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysRoleUserRelationByPk", obj);
    }

}