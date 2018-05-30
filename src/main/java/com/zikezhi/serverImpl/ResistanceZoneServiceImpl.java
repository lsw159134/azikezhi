package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zikezhi.dao.ResistanceZoneMapper;
import com.zikezhi.entity.Product;
import com.zikezhi.entity.QueryResistanceVo;
import com.zikezhi.entity.ResistanceResult;
import com.zikezhi.service.ResistanceZoneService;

@Service("resistanceZoneService")
public class ResistanceZoneServiceImpl implements ResistanceZoneService {

	@Autowired
	private ResistanceZoneMapper resistanceZoneMapper;
	
	@Override
	public List<ResistanceResult> queryFengzhuang() {
		return resistanceZoneMapper.queryFengzhuang();
	}

	@Override
	public List<ResistanceResult> queryZhuZhi(String encapsulation) {
		return resistanceZoneMapper.queryZhuZhi(encapsulation);
	}

	@Override
	public List<ResistanceResult> queryZhuZhiByCanshu(QueryResistanceVo  queryVo) {
		return resistanceZoneMapper.queryZhuZhiByCanshu(queryVo);
	}

	@Override
	public List<ResistanceResult> queryGonglv(QueryResistanceVo queryVo) {
		return resistanceZoneMapper.queryGonglv(queryVo);
	}

	@Override
	public List<ResistanceResult> seleResistance(Map<String, Object> map) {
		return resistanceZoneMapper.seleResistince(map);
	}

	@Override
	public int getTotal() {
		return resistanceZoneMapper.getTotal();
	}

	@Override
	public List<ResistanceResult> queryResistanceList(QueryResistanceVo queryVo) {
		return resistanceZoneMapper.queryResistanceList(queryVo);
	}

	@Override
	public List<ResistanceResult> queryPinpai(QueryResistanceVo queryVo) {
		return resistanceZoneMapper.queryPinpai(queryVo);
	}

	@Override
	public List<ResistanceResult> queryPinpai(String encapsulation, String zhuzhi, String jingquedu) {
		return resistanceZoneMapper.queryPinpai(encapsulation,zhuzhi,jingquedu);
	}


	@Override
	public long getTotalAll(Map<String, Object> map) {
		return resistanceZoneMapper.getTotalAll(map);
	}

	@Override
	public List<Product> queryResistice(Map<String, Object> map) {
		return resistanceZoneMapper.queryResistice(map);
	}

	@Override
	public void insertResistance(Product product) {
		resistanceZoneMapper.insertResistince(product);
	}

	@Override
	public Product selectByPrimaryKey(String productuuid) {
		return resistanceZoneMapper.selectByPrimaryKey(productuuid);
	}

	@Override
	public void updateDianzu(Product product) {
		resistanceZoneMapper.updateDianzu(product);		
	}

	@Override
	public List<Product> queryDianzuList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return resistanceZoneMapper.queryDianzuList(map);
	}

	@Override
	public List<Product> queryResisticeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return resistanceZoneMapper.queryResisticeList(map);
	}

	@Override
	public List<ResistanceResult> queryBaozhuang(String encapsulation, String zhuzhi, String jingquedu,
			String manufacturer) {
		// TODO Auto-generated method stub
		return resistanceZoneMapper.queryBaozhuang(encapsulation,zhuzhi,jingquedu,manufacturer);
	}



}
