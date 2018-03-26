package com.ddxygq.ssmdemo.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ddxygq.ssmdemo.pojo.Invite;

@Repository
public interface InviteMapper {
	public void addInvite(Invite invite);
	
	public Map<String, Object> queryInvite(Invite invite);
}
