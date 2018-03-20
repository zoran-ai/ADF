package org.adf.application.common.mybatis.vo;

import org.adf.application.common.mybatis.entity.SysUser;

public class SecurityContext {

	private String user_id; // 用户ID

	private String username; // 用户名

	private String password; // 密码

	private String verificationCode; // 验证码

	private String token; // 令牌

	private String adminLTESkin; // AdminLTE皮肤

	private String bootstrapSkin; // Bootstrap皮肤

	private SysUser loginUser; // 登录用户

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getAdminLTESkin() {
		return adminLTESkin;
	}

	public void setAdminLTESkin(String adminLTESkin) {
		this.adminLTESkin = adminLTESkin;
	}

	public String getBootstrapSkin() {
		return bootstrapSkin;
	}

	public void setBootstrapSkin(String bootstrapSkin) {
		this.bootstrapSkin = bootstrapSkin;
	}

	public SysUser getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(SysUser loginUser) {
		this.loginUser = loginUser;
	}

}
