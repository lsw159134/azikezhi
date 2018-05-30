package com.zikezhi.service;

import com.zikezhi.entity.PassiveComponents;

import java.util.List;
import java.util.Map;

/**
 * Created by Ponder on 2017/2/18.
 */
public interface PassiveComponentsService {

	int deleteByPrimaryKey(String passivecomponentsuid);

    int insert(PassiveComponents record);

    int insertSelective(PassiveComponents record);

    int updateByPrimaryKeySelective(PassiveComponents record);

    int updateByPrimaryKey(PassiveComponents record);

    List<PassiveComponents> selectByName(Map<String, Object> map);
    
    int getTotal(Map<String, Object> map);
    
    PassiveComponents queryByid(String id);
    
    List<PassiveComponents> selectByCidandSid(int cid,int sid);

	int getCidTotal(Integer cid);
}
