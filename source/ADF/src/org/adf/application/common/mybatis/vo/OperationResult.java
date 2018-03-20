package org.adf.application.common.mybatis.vo;

import org.apache.ibatis.type.Alias;

@Alias("OperationResult")
public class OperationResult {

	private String result_code;
	private String result_info;

	public String getResult_code() {
		return result_code;
	}

	public void setResult_code(String result_code) {
		this.result_code = result_code;
	}

	public String getResult_info() {
		return result_info;
	}

	public void setResult_info(String result_info) {
		this.result_info = result_info;
	}

}
