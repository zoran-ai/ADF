package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysParameterType;

@Repository
public class SysParameterTypeDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysParameterType";

    public int insertSysParameterType(SysParameterType obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysParameterType", obj);
    }

    public int updateSysParameterType(SysParameterType obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysParameterType", obj);
    }

    public int deleteSysParameterType(SysParameterType obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysParameterType", obj);
    }

    public SysParameterType selectSysParameterTypeByPk(SysParameterType obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysParameterTypeByPk", obj);
    }

}