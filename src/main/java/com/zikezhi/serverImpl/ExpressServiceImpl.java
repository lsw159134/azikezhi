package com.zikezhi.serverImpl;

import com.zikezhi.dao.ExpressMapper;
import com.zikezhi.entity.Express;
import com.zikezhi.service.ExpressService;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Ponder on 2017/5/23.
 */
@Service("expressService")
public class ExpressServiceImpl implements ExpressService {

    @Resource
    private ExpressMapper expressMapper;

    @Override
    public int deleteByPrimaryKey(String express) {
        return expressMapper.deleteByPrimaryKey(express);
    }

    @Override
    public int insert(Express record) {
        return expressMapper.insert(record);
    }

    @Override
    public int insertSelective(Express record) {
        return expressMapper.insertSelective(record);
    }

    @Override
    public Express selectByPrimaryKey(String express) {
        return expressMapper.selectByPrimaryKey(express);
    }

    @Override
    public int updateByPrimaryKeySelective(Express record) {
        return expressMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Express record) {
        return expressMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Express> selectByUseruid(Map<String, Object> map) {
        return expressMapper.selectByUseruid(map);
    }

    @Override
    public List<Express> selectByAll() {
        return expressMapper.selectByAll();
    }

	@Override
	public void upIndent(Express express) {
		expressMapper.upIndent(express);
	}

	@Override
	public long getTotal(Map<String, Object> map) {
		return expressMapper.getTotal(map);
	}

	@Override
	public List<Express> selectAll(Map<String, Object> map) {
		return expressMapper.selectAll(map);
	}

	@Override
	public long getTotalAll(Map<String, Object> map) {
		return expressMapper.getTotalAll(map);
	}

	@Override
	public Express queryById(String eid) {
		return expressMapper.queryById(eid);
	}

	@Override
	public Float selectFanBySum(String uid) {
		return expressMapper.selectFanBySum(uid);
	}

	@Override
	public long getStatusSum() {
		return expressMapper.getStatusSum();
	}

	@Override
	public List<String> queryByStatus() {
		return expressMapper.queryByStatus();
	}

	@Override
	public List<String> queryByEdate() {
		return expressMapper.queryByEdate();
	}

	@Override
	public List<Express> sj_searchMyOrder(String suid) {
		return expressMapper.sj_searchMyOrder(suid);
	}

	@Override
	public Long user_Order(String userid) {
		return expressMapper.user_Order(userid);
	}

	@Override
	public int queryByDateCount(String edate) {
		return expressMapper.queryByDateCount(edate);
	}

	@Override
	public Float queryBypriceTotal() {
		return expressMapper.queryBypriceTotal();
	}

	@Override
	public List<Express> queryselectFanli(Map<String, Object> map) {
		return expressMapper.queryselectFanli(map);
	}

	@Override
	public long queryselectFanliTotal(Map<String, Object> map) {
		return expressMapper.queryselectFanliTotal(map);
	}

	@Override
	public List<Express> queryBychengjiao() {
		return expressMapper.queryBychengjiao();
	}

	@Override
	public List<Express> queryByBookingOrder(Map<String, Object> map) {
		return expressMapper.queryByBookingOrder(map);
	}

	@Override
	public int getBookingOrderTotal(Map<String, Object> map) {
		return expressMapper.getBookingOrderTotal(map);
	}

	@Override
	public List<Express> queryByprofit() {
		return expressMapper.queryByprofit();
	}

	@Override
	public Float selectByProfitSum() {
		return expressMapper.selectByProfitSum();
	}

	@Override
	public int queryByStar(String uid) {
		return expressMapper.queryByStar(uid);
	}

	@Override
	public Express dingdanDetail(String express) {
		return expressMapper.dingdanDetail(express);
	}

	@Override
	public int upStatusQut() {
		return expressMapper.upStatusQut();
	}

	@Override
	public List<Express> seleOnlineExpress(Map<String, Object> map) {
		return expressMapper.seleOnlineExpress(map);
	}

	@Override
	public int getOnlineExpress(Map<String, Object> map) {
		return expressMapper.getOnlineExpress(map);
	}

	@Override
	public Float queryBysuidTotal(String sid) {
		// TODO Auto-generated method stub
		return expressMapper.queryBysuidTotal(sid);
	}

	@Override
	public List<Express> selectBeiDongByUseruid(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return expressMapper.selectBeiDongByUseruid(map);
	}

	@Override
	public List<Express> queryzdCountNoPay(String userUid) {
		return expressMapper.queryzdCountNoPay(userUid);
	}

	@Override
	public List<Express> querybdCountNoPay(String userUid) {
		// TODO Auto-generated method stub
		return expressMapper.querybdCountNoPay(userUid);
	}

	@Override
	public String selectByExpress(String out_trade_no) {
		// TODO Auto-generated method stub
		return expressMapper.selectByExpress(out_trade_no);
	}


}
