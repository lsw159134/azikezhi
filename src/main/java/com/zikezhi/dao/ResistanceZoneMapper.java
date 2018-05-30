package com.zikezhi.dao;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Product;
import com.zikezhi.entity.QueryResistanceVo;
import com.zikezhi.entity.ResistanceResult;

public interface ResistanceZoneMapper {

	List<ResistanceResult> queryFengzhuang();
	List<ResistanceResult> queryZhuZhi(String fengzhuang);
	List<ResistanceResult> queryZhuZhiByCanshu(QueryResistanceVo queryVo);
	List<ResistanceResult> queryGonglv(QueryResistanceVo queryVo);
	List<ResistanceResult> seleResistince(Map<String, Object> map);
	int getTotal();
	List<ResistanceResult> queryResistanceList(QueryResistanceVo queryVo);
	List<ResistanceResult> queryPinpai(QueryResistanceVo queryVo);
	List<ResistanceResult> queryPinpai(String fengzhuang, String zhuzhi, String jingquedu);
	List<Product> queryResistice(Map<String, Object> map);
	long getTotalAll(Map<String, Object> map);
	void insertResistince(Product product);
	Product selectByPrimaryKey(String uid);
	void updateDianzu(Product product);
	List<Product> queryDianzuList(Map<String, Object> map);
	List<Product> queryResisticeList(Map<String, Object> map);
	List<ResistanceResult> queryBaozhuang(String encapsulation, String zhuzhi, String jingquedu,
			String manufacturer);

}
