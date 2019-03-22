package com.chinasofti.mapping;

import org.springframework.stereotype.Repository;
import com.chinasofti.commonmapper.CommonMapper;
import com.chinasofti.entity.Bank;

@Repository
public interface BankDao extends CommonMapper<Bank> {
}
