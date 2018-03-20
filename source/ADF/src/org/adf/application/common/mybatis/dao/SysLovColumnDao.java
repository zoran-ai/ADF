package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysLovColumn;

@Repository
public class SysLovColumnDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysLovColumn";

    public int insertSysLovColumn(SysLovColumn obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysLovColumn", obj);
    }

    public int updateSysLovColumn(SysLovColumn obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysLovColumn", obj);
    }

    public int deleteSysLovColumn(SysLovColumn obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysLovColumn", obj);
    }

    public SysLovColumn selectSysLovColumnByPk(SysLovColumn obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysLovColumnByPk", obj);
    }

}