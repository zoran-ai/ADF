package org.adf.application.modules.system.service;

import java.util.List;

import javax.annotation.Resource;

import org.adf.application.common.mybatis.dao.SysParameterConfigDao;
import org.adf.application.common.mybatis.dao.SysParameterDefineDao;
import org.adf.application.common.mybatis.dao.SysParameterTypeDao;
import org.adf.application.common.mybatis.entity.SysParameterConfig;
import org.adf.application.common.mybatis.entity.SysParameterDefine;
import org.adf.application.common.mybatis.entity.SysParameterType;
import org.adf.application.common.mybatis.vo.SysParameterDefineVO;
import org.adf.application.modules.system.dao.ParameterDao;
import org.springframework.stereotype.Service;

@Service
@SuppressWarnings("all")
public class ParameterService {

	@Resource
	private ParameterDao parameterDao;
	
	@Resource
	private SysParameterTypeDao ptDao;
	
	@Resource
	private SysParameterDefineDao pdDao;
	
	@Resource
	private SysParameterConfigDao pcDao;
	
	/**
	 * 获取参数类型列表
	 */
	public List<SysParameterType> getParameterTypeList() throws Exception {
		return parameterDao.getParameterTypeList();
	}
	
	/**
	 * 获取参数类型信息
	 * @param typeCode 参数类型编码
	 */
	public SysParameterType getParameterTypeInfo(String typeCode) throws Exception {
		SysParameterType pt = new SysParameterType();
		pt.setType_code(typeCode);
		return ptDao.selectSysParameterTypeByPk(pt);
	}
	
	/**
	 * 新建参数类型
	 */
	public void addParameterType(SysParameterType pt) throws Exception {
		ptDao.insertSysParameterType(pt);
	}
	
	/**
	 * 编辑参数类型
	 */
	public void editParameterType(SysParameterType pt) throws Exception {
		ptDao.updateSysParameterType(pt);
	}
	
	/**
	 * 获取参数列表
	 * @param typeCode 参数类型编码
	 */
	public List<SysParameterDefineVO> getParameterDefineList(String typeCode) throws Exception {
		return parameterDao.getParameterDefineList(typeCode);
	}
	
	/**
	 * 获取参数信息
	 * @param parameterCode 参数编码
	 */
	public SysParameterDefineVO getParameterDefineInfo(String parameterCode) throws Exception {
		return parameterDao.getParameterDefineInfo(parameterCode);
	}
	
	/**
	 * 新建参数
	 */
	public void addParameterDefine(SysParameterDefine pd) throws Exception {
		pdDao.insertSysParameterDefine(pd);
	}
	
	/**
	 * 编辑参数
	 */
	public void editParameterDefine(SysParameterDefine pd) throws Exception {
		pdDao.updateSysParameterDefine(pd);
	}
	
	/**
	 * 获取参数配置列表
	 * @param typeCode 参数类型编码
	 */
	public List<SysParameterDefineVO> getParameterConfigList(String typeCode) throws Exception {
		return parameterDao.getParameterConfigList(typeCode);
	}
	
	/**
	 * 保存参数设置
	 */
	public void saveParameterConfig(List<SysParameterDefineVO> pdVOList) throws Exception {
		for (SysParameterDefineVO pdVO : pdVOList) {
			SysParameterConfig pcQuery = new SysParameterConfig();
			pcQuery.setParameter_code(pdVO.getParameter_code());
			
			SysParameterConfig pcEntity = pcDao.selectSysParameterConfigByPk(pcQuery);
			
			SysParameterConfig pc = new SysParameterConfig();
			pc.setParameter_code(pdVO.getParameter_code());
			pc.setParameter_value(pdVO.getParameter_value());
			
			if (pcEntity != null) {
				pcDao.updateSysParameterConfig(pc);
			} else {
				pcDao.insertSysParameterConfig(pc);
			}
		}
	}
	
	/**
	 * 获取单个参数值
	 * @param parameterCode 参数编码
	 */
	public String getSingleParameterValue(String parameterCode) throws Exception {
		SysParameterConfig pcQuery = new SysParameterConfig();
		pcQuery.setParameter_code(parameterCode);
		SysParameterConfig pcEntity = pcDao.selectSysParameterConfigByPk(pcQuery);
		if (pcEntity != null) {
			return pcEntity.getParameter_value() == null ? "" : pcEntity.getParameter_value();
		} else {
			return "";
		}
	}
	
	/**
	 * 获取多个参数值
	 * @param parameterCodes 参数编码，多个参数编码以逗号分隔，每个参数编码都需要有前后单引号
	 */
	public List<SysParameterConfig> getMultiParameterValue(String parameterCode) throws Exception {
		return parameterDao.getMultiParameterValue(parameterCode);
	}
	
}
