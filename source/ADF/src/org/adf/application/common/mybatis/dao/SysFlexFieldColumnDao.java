package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysFlexFieldColumn;

@Repository
public class SysFlexFieldColumnDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysFlexFieldColumn";

    public int insertSysFlexFieldColumn(SysFlexFieldColumn obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysFlexFieldColumn", obj);
    }

    public int updateSysFlexFieldColumn(SysFlexFieldColumn obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysFlexFieldColumn", obj);
    }

    public int deleteSysFlexFieldColumn(SysFlexFieldColumn obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysFlexFieldColumn", obj);
    }

    public SysFlexFieldColumn selectSysFlexFieldColumnByPk(SysFlexFieldColumn obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysFlexFieldColumnByPk", obj);
    }

}