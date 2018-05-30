package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.QuoteMapper;
import com.zikezhi.entity.Quote;
import com.zikezhi.service.QuoteService;

@Service("quoteService")
public class QuoteServiceImpl implements QuoteService {

	@Autowired
	private QuoteMapper quoteMapper;
	
	@Override
	public int insertSelective(Quote q) {
		// TODO Auto-generated method stub
		return quoteMapper.insertSelective(q);
	}

	@Override
	public int updateByPrimaryKeySelective(Quote q) {
		// TODO Auto-generated method stub
		return quoteMapper.updateByPrimaryKeySelective(q);
	}

	@Override
	public List<Quote> queryByUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return quoteMapper.queryByUser(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return quoteMapper.getTotal(map);
	}

	@Override
	public List<Quote> queryAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return quoteMapper.queryAll(map);
	}

}
