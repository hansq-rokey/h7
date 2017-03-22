/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.merchant.service;

import java.util.List;

import com.ibaixiong.entity.ChannelArea;

/**
 * 
 * @author yaoweiguo
 * @email  280435353@qq.com
 * @date   2016年8月30日
 * @since  1.0.0
 */
public interface ChannelAreaService {

	List<ChannelArea> queryChannelAreas(Long merchantId);
}
