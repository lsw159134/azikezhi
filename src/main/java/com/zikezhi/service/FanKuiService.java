package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.FanKui;

public interface FanKuiService {
	int insertFankui(FanKui fankui);
	List<FanKui> selectFankui();
	int fankuidele(String fankuiid);
}
