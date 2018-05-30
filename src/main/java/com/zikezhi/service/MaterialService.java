package com.zikezhi.service;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Material;

public interface MaterialService {

	int insertMaterial(Material m);
	
	int updateMaterial(Material m);
	
	List<Material> queryAll(Map<String,Object> map);
	
	int deletematerial(String id);
	
	int getTotal(Map<String,Object> map);
	
	int updateMaterialAll(Material m);

	Material queryByID(int material_id);
	
	List<Material> queryByRAND();
	
	List<Material> queryByDesc();
	
	List<Material> queryByWen(Map<String,Object> map);
	
	int getTotalWen(Map<String,Object> map);
	
	Material selectTiwen(int id);
	
	List<Material> selectTiwenlimit();
	
	List<Material> UserselectTiwen(Map<String,Object> map);
}
