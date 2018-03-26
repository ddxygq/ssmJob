package com.ddxygq.ssmdemo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ddxygq.ssmdemo.dao.AdminMapper;
import com.ddxygq.ssmdemo.pojo.Person;

@Service
@Transactional
public class AdminService {

	@Resource
	AdminMapper adminMapper;

	public Map<String, Object> getAllPerson(int currentPage, int pageSize) {
		Map<String, Integer> pageMap = new HashMap<String, Integer>();
		int start = currentPage * pageSize - pageSize;
		pageMap.put("start", start);
		pageMap.put("pageSize", pageSize);
		List<Person> list = adminMapper.getAllPerson(pageMap);
		int total = adminMapper.getAllPersonCount();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", total);
		return map;

	}

	public Map<String, Object> queryForFammer(int startrow, int pagesize, String person_role) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if (person_role != null) {
			paramMap.put("person_role", person_role);
		}
		List<Person> list = adminMapper.queryForFammer(paramMap);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", 10);
		return map;

	}

	public Map<String, Object> queryForHead(int startrow, int pagesize, String person_role) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if (person_role != null) {
			paramMap.put("person_role", person_role);
		}
		List<Person> list = adminMapper.queryForHead(paramMap);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", 10);
		return map;

	}

	public Map<String, Object> queryForWorker(int startrow, int pagesize, String person_role) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if (person_role != null) {
			paramMap.put("person_role", person_role);
		}
		List<Person> list = adminMapper.queryForWorker(paramMap);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", 10);
		return map;

	}

	public boolean updatePwd(String person_id) {

		adminMapper.updatePwd(person_id);
		return true;

	}

	public Map<String, Object> queryForFlag(int startrow, int pagesize) {

		List<Person> list = adminMapper.queryForFlag();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", 10);
		return map;

	}

	public Map<String, Object> queryForFlag2(int startrow, int pagesize) {

		List<Person> list = adminMapper.queryForFlag2();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", 10);
		return map;

	}

	public boolean updateFlag(String person_id) {

		adminMapper.updateFlag(person_id);
		return true;
	}

	public Map<String, Object> queryForLike(int startrow, int pagesize, String person_account) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if (person_account != null) {
			paramMap.put("person_account", person_account);
		}
		List<Person> list = adminMapper.queryForWorker(paramMap);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", 10);
		return map;

	}
}
