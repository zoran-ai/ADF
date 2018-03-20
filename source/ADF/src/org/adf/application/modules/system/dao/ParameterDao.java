package org.adf.application.modules.system.dao;

import java.util.List;

import org.adf.application.common.mybatis.entity.SysParameterConfig;
import org.adf.application.common.mybatis.entity.SysParameterType;
import org.adf.application.common.mybatis.vo.QueryParameter;
import org.adf.application.common.mybatis.vo.SysParameterDefineVO;
import org.adf.framework.mybatis.dao.BaseDao;
import org.springframework.stereotype.Repository;

@Repository
@SuppressWarnings("all")
public class ParameterDao extends BaseDao {

	public static final String NAMESPACE = "org.adf.application.modules.system.mapper.ParameterMapper";
	
	/**
	 * 获取参数类型列表
	 */
	public List<SysParameterType> getParameterTypeList() throws Exception {
        return selectList(NAMESPACE + "." + "getParameterTypeList");
    }
	
	/**
	 * 获取参数定义列表
	 * @param typeCode 参数类型编码
	 */
	public List<SysParameterDefineVO> getParameterDefineList(String typeCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setTypeCode(typeCode);
		return selectList(NAMESPACE + "." + "getParameterDefineList", qp);
	}
	
	/**
	 * 获取参数定义信息
	 * @param parameterCode 参数编码
	 */
	public SysParameterDefineVO getParameterDefineInfo(String parameterCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setParameterCode(parameterCode);
		return selectOne(NAMESPACE + "." + "getParameterDefineInfo", qp);
	}
	
	/**
	 * 获取参数配置列表
	 * @param typeCode 参数类型编码
	 */
	public List<SysParameterDefineVO> getParameterConfigList(String typeCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setTypeCode(typeCode);
		return selectList(NAMESPACE + "." + "getParameterConfigList", qp);
	}
	
	/**
	 * 获取多个参数值
	 * @param typeCode 参数类型编码，多个参数编码以逗号分隔，每个参数编码都需要有前后单引号
	 */
	public List<SysParameterConfig> getMultiParameterValue(String parameterCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setParameterCode(parameterCode);
		return selectList(NAMESPACE + "." + "getMultiParameterValue", qp);
	}
	
}
