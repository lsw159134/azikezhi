package com.zikezhi.entity;

import java.util.Date;

public class Replay {
	private int replayid;
	
	private String replaycontent;
	
	private String replayuseruid;
	
	private Date replayTime;
	
	private int replay_materialid;
	
	private UserInfo user;

	public int getReplayid() {
		return replayid;
	}

	public void setReplayid(int replayid) {
		this.replayid = replayid;
	}

	public String getReplaycontent() {
		return replaycontent;
	}

	public void setReplaycontent(String replaycontent) {
		this.replaycontent = replaycontent;
	}

	public String getReplayuseruid() {
		return replayuseruid;
	}

	public void setReplayuseruid(String replayuseruid) {
		this.replayuseruid = replayuseruid;
	}

	public Date getReplayTime() {
		return replayTime;
	}

	public void setReplayTime(Date replayTime) {
		this.replayTime = replayTime;
	}

	public int getReplay_materialid() {
		return replay_materialid;
	}

	public void setReplay_materialid(int replay_materialid) {
		this.replay_materialid = replay_materialid;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}
	
	
}
