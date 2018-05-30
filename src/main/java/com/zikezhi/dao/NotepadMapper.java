package com.zikezhi.dao;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Notepad;

public interface NotepadMapper {
	
	int insertSelective(Notepad s);
	
	int updateByPrimaryKeySelective(Notepad s);
	
	List<Notepad> queryAll(Map<String, Object> map);
	
	int deleteNotepad(int id);
}
