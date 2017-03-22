package com.ibaixiong.merchant.dao;

import java.util.List;

import com.ibaixiong.entity.User;

public interface UserDao {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<String> queryRoleNames(Long userId);
    
    /**
	 * 根据用户ID查询角色信息
	 * @param userId   用户id
	 * @return   
	 */
	List<String> queryRoles(Long userId);
	
	/**
     * 根据用户ID查询权限
     * @param userId
     * @return
     */
	List<String> queryPermissions(Long userId);
}