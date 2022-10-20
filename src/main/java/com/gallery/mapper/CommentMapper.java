package com.gallery.mapper;

import java.util.List;
import java.util.Map;

import com.gallery.notice.CommentCriteria;
import com.gallery.notice.CommentVO;

public interface CommentMapper {
	
	public List<CommentVO> list(Integer nId) throws Exception;
	
	public void create(CommentVO cvo) throws Exception;
	
	public void update(CommentVO cvo) throws Exception;

	public void delete(CommentVO cvo) throws Exception;
	
	public List<CommentVO> listPage(Map<String, Object> paramMap)throws Exception;
	
	public int count(Integer nId) throws Exception;
	
	public int getCId(Integer cId) throws Exception;
	
	public CommentVO selectComment(Integer cId) throws Exception;
	
	/*
	 * //testcode public void addAttach(String fullName)throws Exception;
	 * 
	 * public List<String> getAttach(Integer rno) throws Exception;
	 * 
	 * public void deleteAttach(Integer rno) throws Exception;
	 */
	
}
