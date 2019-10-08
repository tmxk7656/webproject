package com.example.test.service;

import org.springframework.stereotype.Service;

import com.example.test.domain.CustomerVO;
import com.example.test.mapper.Test;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class loginServiceImplement implements loginService {

	Test mapper;
	@Override
	public CustomerVO getCustomer(String id) {
		
		return mapper.getCustomer(id);
	}

}
