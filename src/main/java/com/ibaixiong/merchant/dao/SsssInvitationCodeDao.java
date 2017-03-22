package com.ibaixiong.merchant.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibaixiong.entity.SsssInvitationCode;

public interface SsssInvitationCodeDao {
	int deleteByPrimaryKey(Long id);

	Long insert(SsssInvitationCode record);

	SsssInvitationCode selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(SsssInvitationCode record);

	List<SsssInvitationCode> getSsssInvitationCodeList(@Param("ssssId") Long ssssId, @Param("status") Byte status);

	int updateInvitationCodeStatusByIdAnd4SId(@Param("status") Byte status, @Param("id") Long id, @Param("ssssId") Long ssssId);

}