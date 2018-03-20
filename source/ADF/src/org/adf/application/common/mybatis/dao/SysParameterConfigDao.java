package org.adf.application.common.mybatis.dao;

import org.springframework.stereotype.Repository;

import org.adf.framework.mybatis.dao.BaseDao;

import org.adf.application.common.mybatis.entity.SysParameterConfig;

@Repository
public class SysParameterConfigDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.mybatis.mapper.SysParameterConfig";

    public int insertSysParameterConfig(SysParameterConfig obj) throws Exception {
        return insert(NAMESPACE + "." + "insertSysParameterConfig", obj);
    }

    public int updateSysParameterConfig(SysParameterConfig obj) throws Exception {
        return update(NAMESPACE + "." + "updateSysParameterConfig", obj);
    }

    public int deleteSysParameterConfig(SysParameterConfig obj) throws Exception {
        return delete(NAMESPACE  + "." + "deleteSysParameterConfig", obj);
    }

    public SysParameterConfig selectSysParameterConfigByPk(SysParameterConfig obj) throws Exception {
        return selectOne(NAMESPACE + "." + "selectSysParameterConfigByPk", obj);
    }

}