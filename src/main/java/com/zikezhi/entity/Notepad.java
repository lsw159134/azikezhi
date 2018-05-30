package com.zikezhi.entity;

import java.util.Date;

/**
 * 记事本
 * @author lenovo
 *
 */
public class Notepad {
	
	private int notepad_id;
	
	private String notepad_connet;
	
	private String notepad_uid;
	
	private Date notepad_date;
	
	private String name;

	public int getNotepad_id() {
		return notepad_id;
	}

	public void setNotepad_id(int notepad_id) {
		this.notepad_id = notepad_id;
	}

	public String getNotepad_connet() {
		return notepad_connet;
	}

	public void setNotepad_connet(String notepad_connet) {
		this.notepad_connet = notepad_connet;
	}

	public String getNotepad_uid() {
		return notepad_uid;
	}

	public void setNotepad_uid(String notepad_uid) {
		this.notepad_uid = notepad_uid;
	}

	public Date getNotepad_date() {
		return notepad_date;
	}

	public void setNotepad_date(Date notepad_date) {
		this.notepad_date = notepad_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
