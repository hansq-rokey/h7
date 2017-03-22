package com.ibaixiong.merchant.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.User;
import com.ibaixiong.merchant.dao.UserDao;
import com.ibaixiong.merchant.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	@Resource
	UserDao userDao;
	@Override
	public void update(User user) {
		userDao.updateByPrimaryKeySelective(user);
	}

	@Override
	public User get(long id) {
		return userDao.selectByPrimaryKey(id);
	}
	@Override
	public List<String> queryRoleNames(Long userId) {
		return userDao.queryRoleNames(userId);
	}
	@Override
	public List<String> queryPermissions(Long userId) {
		return userDao.queryPermissions(userId);
	}
	@Override
	public List<String> queryRoles(Long userId) {
		return userDao.queryRoles(userId);
	}
}
