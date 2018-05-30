package com.zikezhi.dao;

import com.zikezhi.entity.SupplierUser;

public interface SupplierUserMapper {
    int deleteByPrimaryKey(String supplieruseruuid);

    int insert(SupplierUser record);

    int insertSelective(SupplierUser record);

    SupplierUser selectByPrimaryKey(String supplieruseruuid);

    int updateByPrimaryKeySelective(SupplierUser record);

    int updateByPrimaryKey(SupplierUser record);
}