package com.example.test.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.example.test.domain.CustomerVO;
import com.example.test.domain.PostVO;
import com.example.test.mapper.Test;

import lombok.AllArgsConstructor;
@Service
@AllArgsConstructor
public class PostServiceImplement implements PostService {
	
	Test mapper;
	@Override
	public ArrayList<PostVO> getList() {
	
		return mapper.getList();
	}
	@Override
	public void addPost(PostVO vo) {
		
		mapper.addPost(vo);
	
	}
	@Override
	public PostVO getSpecific(String vo) {
		// TODO Auto-generated method stub
		return mapper.getSpecific(vo);
	}
	@Override
	public int updatePost(Map<String,Object> vo) {
		// TODO Auto-generated method stub
		return mapper.updatePost(vo);
		
		
	}
	@Override
	public void deletePost(PostVO vo) {
		// TODO Auto-generated method stub
		mapper.deletePost(vo);
		
	}
	@Override
	public void updateClick(String post_code) {
		
		mapper.updateClick(post_code);
		
	}
	@Override
	public void masterPick(String post_code) {
		
		mapper.masterPick(post_code);
		
	}
	@Override
	public ArrayList<CustomerVO> getMemberlist() {
		
		return mapper.getMemberlist();
	}
	@Override
	public void justPick(String post_code) {
		
		mapper.justPick(post_code);
		

	}

}
