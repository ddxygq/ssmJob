package com.ddxygq.ssmdemo.service;

import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ddxygq.ssmdemo.dao.InviteMapper;
import com.ddxygq.ssmdemo.pojo.Invite;

@Service
@Transactional
public class InviteService {
	
	@Resource
	InviteMapper inviteMapper;
	
	public void addInvite(Invite invite){
		invite.setInvite_id(UUID.randomUUID().toString());
		inviteMapper.addInvite(invite);
	}
	
	public Map<String, Object> queryInvite(Invite invite){
		return inviteMapper.queryInvite(invite);
	}
}
