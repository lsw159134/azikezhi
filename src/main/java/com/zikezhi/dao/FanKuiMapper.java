package com.zikezhi.dao;

import java.util.List;

import com.zikezhi.entity.FanKui;

public interface FanKuiMapper {
	int insertFankui(FanKui fankui);
	List<FanKui> selectFankui();
	int fankuidele(String fankuiid);
}
