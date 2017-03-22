package com.ibaixiong.merchant.dao;

import java.util.List;

import com.ibaixiong.entity.SsssInvitationCodeProduct;

public interface SsssInvitationCodeProductDao {
	int insert(SsssInvitationCodeProduct record);

	SsssInvitationCodeProduct selectByPrimaryKey(Long id);
	
	List<SsssInvitationCodeProduct> selectByInvitationCodeId(Long invitationCodeId);

}