package com.ibaixiong.merchant.util;

public enum CodeTypeEnum {
	
	/**
	 * 注册为1
	 */
	REGISTER((byte)1),
	/**
	 * 密码找回 2
	 */
	FIND_PASSWORD((byte)2),
	/**
	 * 查看银行卡号 2
	 */
	LOOK_BANK((byte)3);
	
	private Byte code;

	public Byte getCode() {
		return code;
	}

	public void setCode(Byte code) {
		this.code = code;
	}

	private CodeTypeEnum(Byte code) {
		this.code = code;
	}
	
	
}
