package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.MaterialMapper;
import com.zikezhi.entity.Material;
import com.zikezhi.service.MaterialService;

@Service("materialService")
public class MaterialServiceImpl implements MaterialService {
	
	@Autowired
	private MaterialMapper materialMapper;

	@Override
	public int insertMaterial(Material m) {
		return materialMapper.insertMaterial(m);
	}

	@Override
	public int updateMaterial(Material m) {
		return materialMapper.updateMaterial(m);
	}

	@Override
	public List<Material> queryAll(Map<String, Object> map) {
		return materialMapper.queryAll(map);
	}

	@Override
	public int deletematerial(String id) {
		return materialMapper.deletematerial(id);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return materialMapper.getTotal(map);
	}

	@Override
	public int updateMaterialAll(Material m) {
		return materialMapper.updateMaterialAll(m);
	}

	@Override
	public Material queryByID(int material_id) {
		return materialMapper.queryByID(material_id);
	}

	@Override
	public List<Material> queryByRAND() {
		return materialMapper.queryByRAND();
	}

	@Override
	public List<Material> queryByDesc() {
		return materialMapper.queryByDesc();
	}

	@Override
	public List<Material> queryByWen(Map<String, Object> map) {
		return materialMapper.queryByWen(map);
	}

	@Override
	public int getTotalWen(Map<String, Object> map) {
		return materialMapper.getTotalWen(map);
	}

	@Override
	public Material selectTiwen(int id) {
		// TODO Auto-generated method stub
		return materialMapper.selectTiwen(id);
	}

	@Override
	public List<Material> selectTiwenlimit() {
		// TODO Auto-generated method stub
		return materialMapper.selectTiwenlimit();
	}

	@Override
	public List<Material> UserselectTiwen(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return materialMapper.UserselectTiwen(map);
	}

}
