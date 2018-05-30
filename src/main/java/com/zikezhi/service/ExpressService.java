package com.zikezhi.service;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Express;

/**
 * Created by Ponder on 2017/5/23.
 */
public interface ExpressService {
    int deleteByPrimaryKey(String express);

    int insert(Express record);

    int insertSelective(Express record);

    Express selectByPrimaryKey(String express);

    int updateByPrimaryKeySelective(Express record);

    int updateByPrimaryKey(Express record);

    List<Express> selectByUseruid(Map<String, Object> map);

    List<Express> selectByAll();

	void upIndent(Express express);

	long getTotal(Map<String, Object> map);

	List<Express> selectAll(Map<String, Object> map);
	
	long getTotalAll(Map<String, Object> map);

	Express queryById(String eid);
	
	Float selectFanBySum(String uid);

	long getStatusSum();
	
	//订单总计查询
	List<String> queryByStatus();
	
	//订单每月总计查询
	List<String> queryByEdate();
	
	List<Express> sj_searchMyOrder(String suid);
	
	//查询用户订单总数
	Long user_Order(String userid);
	
	int queryByDateCount(String edate);
	
	Float queryBypriceTotal();
	
	List<Express> queryselectFanli(Map<String, Object> map);
	
	long queryselectFanliTotal(Map<String, Object> map);
	
	List<Express> queryBychengjiao();
	
	List<Express> queryByBookingOrder(Map<String, Object> map);
	
	int getBookingOrderTotal(Map<String, Object> map);

	List<Express> queryByprofit();

	Float selectByProfitSum();

	int queryByStar(String uid);
	
	//订单 详情
	Express dingdanDetail(String express);
	
	int upStatusQut();
	
	List<Express> seleOnlineExpress(Map<String,Object> map);
	
	int getOnlineExpress(Map<String,Object> map);
	
	Float queryBysuidTotal(String sid);

	List<Express> selectBeiDongByUseruid(Map<String, Object> map);

	List<Express> queryzdCountNoPay(String userUid);

	List<Express> querybdCountNoPay(String userUid);

	String selectByExpress(String out_trade_no);
	
}
