package com.ibaixiong.merchant.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.DictCode;
import com.ibaixiong.entity.util.DictTypeEnum;
import com.ibaixiong.merchant.dao.DictCodeDao;
import com.ibaixiong.merchant.service.DictCodeService;

@Service
public class DictCodeServiceImpl implements DictCodeService {

	@Resource
	private DictCodeDao codeDao;
	
	@Override
	public List<DictCode> queryDictCodeList(DictTypeEnum dictType, Byte type) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("dictType", dictType.getDictType());
		map.put("type", type);
		map.put("isDisplay", true);
		return codeDao.queryDictCodeList(map);
	}

	@Override
	public List<DictCode> queryDictCodeList(Byte type) {

		return queryDictCodeList(null, type);
	}

	@Override
	public List<DictCode> queryDictCodeList() {

		return queryDictCodeList(null, null);
	}

	@Override
	public List<DictCode> queryDictCodeList(DictTypeEnum dictType) {

		return queryDictCodeList(dictType, null);
	}

	@Override
	public List<DictCode> queryDictCodeByDictType(String dictType) {
		// TODO Auto-generated method stub
		return codeDao.queryDictCodeByDictType(dictType);
	}
	
}
