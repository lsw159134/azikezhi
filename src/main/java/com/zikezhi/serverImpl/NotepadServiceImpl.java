package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.NotepadMapper;
import com.zikezhi.entity.Notepad;
import com.zikezhi.service.NotepadService;

@Service("notepadService")
public class NotepadServiceImpl implements NotepadService {

	@Autowired
	private NotepadMapper notepadMapper;
	
	@Override
	public int insertSelective(Notepad s) {
		// TODO Auto-generated method stub
		return notepadMapper.insertSelective(s);
	}

	@Override
	public int updateByPrimaryKeySelective(Notepad s) {
		// TODO Auto-generated method stub
		return notepadMapper.updateByPrimaryKeySelective(s);
	}

	@Override
	public List<Notepad> queryAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return notepadMapper.queryAll(map);
	}

	@Override
	public int deleteNotepad(int id) {
		// TODO Auto-generated method stub
		return notepadMapper.deleteNotepad(id);
	}

}
