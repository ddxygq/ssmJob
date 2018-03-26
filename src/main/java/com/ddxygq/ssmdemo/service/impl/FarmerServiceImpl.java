package com.ddxygq.ssmdemo.service.impl;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ddxygq.ssmdemo.dao.FarmerDao;
import com.ddxygq.ssmdemo.service.FarmerService;

/**
 *查询项目信息
 * @author Administrator
 *
 */
@Service
public class FarmerServiceImpl implements FarmerService{

	@Resource
	private FarmerDao farmerDao;
	//查询项目列表
	@Override
	public List<Map<String, Object>> getAllProject() {
		return farmerDao.getAllProject();  
	}
	
	//查看订单
	@Override
	public List<Map<String, Object>> lookFarmerOrders() {
		return farmerDao.lookFarmerOrders();
	}

	@Override
	public void addOrder(Map<String, String> map) {
		map.put("order_id",UUID.randomUUID().toString());
		farmerDao.addOrder(map);
	}
	
	public void updatePerson(Map<String, String> map){
		farmerDao.updatePerson(map);
	}
	
	public List<Map<String, Object>> showMyOrders(Map<String, String> map){
		return farmerDao.showMyOrders(map);
	}

	
}
