package com.example.test.mapper;

import java.util.ArrayList;
import java.util.Map;

import com.example.test.domain.CustomerVO;
import com.example.test.domain.PostVO;

public interface Test {

	
	public ArrayList<PostVO> getList();

	public void addPost(PostVO vo);

	public CustomerVO getCustomer(String id);

	public PostVO getSpecific(String vo);

	public void updataPost(PostVO vo);

	public int updatePost(Map<String,Object> vo);

	public void deletePost(PostVO vo);

	public void updateClick(String post_code);

	public void masterPick(String post_code);

	public ArrayList<CustomerVO> getMemberlist();

	public void justPick(String post_code);



}
