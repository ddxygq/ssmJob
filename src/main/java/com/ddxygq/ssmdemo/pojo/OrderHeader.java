package com.ddxygq.ssmdemo.pojo;

public class OrderHeader {
	private String orderHeader_id;
	private String person_id;
	private String order_id;
	private String header_flag;
	public OrderHeader(String orderHeader_id, String person_id, String order_id, String header_flag) {
		this.orderHeader_id = orderHeader_id;
		this.person_id = person_id;
		this.order_id = order_id;
		this.header_flag = header_flag;
	}
	public String getOrderHeader_id() {
		return orderHeader_id;
	}
	public void setOrderHeader_id(String orderHeader_id) {
		this.orderHeader_id = orderHeader_id;
	}
	public String getPerson_id() {
		return person_id;
	}
	public void setPerson_id(String person_id) {
		this.person_id = person_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getHeader_flag() {
		return header_flag;
	}
	public void setHeader_flag(String header_flag) {
		this.header_flag = header_flag;
	}
	
	
	
	
}
