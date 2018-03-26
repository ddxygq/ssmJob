package com.ddxygq.ssmdemo.dao;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ddxygq.ssmdemo.pojo.Invite;
import com.ddxygq.ssmdemo.pojo.Person;
import com.ddxygq.ssmdemo.pojo.Project;

@Repository
public interface WorkerMapper {
	public List<Project> queryMyInvite(Map<String,Object> map);
	public int queryInviteCount();
	public boolean updateInvite(Invite invite);	
	public List<Project> queryMyOrders(Map<String,Object> map);
	public boolean updateMyTeam(Person person);
	public boolean updateInvite1(String person_id);	
	public boolean updatePerson(String person_id);
	public String queryPersonHead(String person_id);
}
