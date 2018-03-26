package com.ddxygq.ssmdemo.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


@Repository
public interface OrdersMapper {
	public List<Map<String, Object>> queryOrders(Map<String, Object> map);
	
	public List<Map<String, Object>> orderWorker(Map<String, String> map);
	
	public List<Map<String, Object>> canorder(Map<String, Object> map);
	
	// 确认是否申请过了
	public Map<String, Object> sureOrder(Map<String, String> map);
	
	public void askOrder(Map<String, String> map);
	
	public int canorderCount(String person_id);
	
	public int myOrdersCount(String person_id);
}
