package com.zikezhi.serverImpl;

import com.zikezhi.dao.PassiveComponentsMapper;
import com.zikezhi.entity.PassiveComponents;
import com.zikezhi.service.PassiveComponentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Ponder on 2017/2/18.
 */


@Service("passiveComponentsService")
public class PassiveComponentsServiceImpl implements PassiveComponentsService {

    @Autowired
    private PassiveComponentsMapper passiveComponentsMapper;

    @Override
    public int deleteByPrimaryKey(String passivecomponentsuid) {
        return passiveComponentsMapper.deleteByPrimaryKey(passivecomponentsuid);
    }

    @Override
    public int insert(PassiveComponents record) {
        return passiveComponentsMapper.insert(record);
    }

    @Override
    public int insertSelective(PassiveComponents record) {
        return passiveComponentsMapper.insertSelective(record);
    }

    @Override
    public int updateByPrimaryKeySelective(PassiveComponents record) {
        return passiveComponentsMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(PassiveComponents record) {
        return passiveComponentsMapper.updateByPrimaryKey(record);
    }

	@Override
	public List<PassiveComponents> selectByName(Map<String, Object> map) {
		return passiveComponentsMapper.selectByName(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return passiveComponentsMapper.getTotal(map);
	}

	@Override
	public PassiveComponents queryByid(String id) {
		return passiveComponentsMapper.queryByid(id);
	}

	@Override
	public List<PassiveComponents> selectByCidandSid(int cid, int sid) {
		return passiveComponentsMapper.selectByCidandSid(cid, sid);
	}

	@Override
	public int getCidTotal(Integer cid) {
		// TODO Auto-generated method stub
		return passiveComponentsMapper.getCidTotal(cid);
	}
}
