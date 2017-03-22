package com.ibaixiong.merchant.dao;

import org.apache.ibatis.annotations.Param;

import com.ibaixiong.entity.VerificationCode;

public interface VerificationCodeDao {
    int deleteByPrimaryKey(Long id);

    int insert(VerificationCode record);

    int insertSelective(VerificationCode record);

    VerificationCode selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(VerificationCode record);

    int updateByPrimaryKey(VerificationCode record);
    
    /**
     * 根据用户查询验证码
     * @param name   手机号码/邮箱
     * @return
     */
    VerificationCode selectByName(@Param("name")String name,@Param("type")Byte type);
    
	/**
	 * 删除之前的短信验证码
	 * @param name
	 * @param type
	 * @param code
	 * @return
	 */
	int remove(@Param("name")String name,@Param("type")Byte type,@Param("code") String code);
    
    
}