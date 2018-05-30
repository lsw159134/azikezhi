package com.zikezhi.entity;

import java.util.Date;
/**
 * 留言
 * @author lenovo
 *
 */
public class Message {
	
	private int message_id;
	
	private String message_content;
	
	private Date message_time;
	
	private String message_uid;

	public int getMessage_id() {
		return message_id;
	}

	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public Date getMessage_time() {
		return message_time;
	}

	public void setMessage_time(Date message_time) {
		this.message_time = message_time;
	}

	public String getMessage_uid() {
		return message_uid;
	}

	public void setMessage_uid(String message_uid) {
		this.message_uid = message_uid;
	}
	
}
