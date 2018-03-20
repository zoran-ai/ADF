package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysDataStructNode;

@Repository
public class SysDataStructNodeDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysDataStructNode";

    public int insertSysDataStructNode(SysDataStructNode obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysDataStructNode", obj);
    }

    public int updateSysDataStructNode(SysDataStructNode obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysDataStructNode", obj);
    }

    public int deleteSysDataStructNode(SysDataStructNode obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysDataStructNode", obj);
    }

    public SysDataStructNode selectSysDataStructNodeByPk(SysDataStructNode obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysDataStructNodeByPk", obj);
    }

}