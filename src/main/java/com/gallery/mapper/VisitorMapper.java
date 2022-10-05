package com.gallery.mapper;

import java.util.List;

import com.gallery.notice.SearchCriteria;
import com.gallery.visitor.Criteria;
import com.gallery.visitor.VisitorVO;


public interface VisitorMapper {
	
	public void write(VisitorVO vo) throws Exception;

	public VisitorVO read(Integer vId) throws Exception;

	public void update(VisitorVO vo) throws Exception;

	public void delete(Integer vId) throws Exception;

	public List<VisitorVO> selectlist(Criteria cri) throws Exception;
	
	public int listCount(Criteria cri) throws Exception;
	
	public void noticeHit (int nId) throws Exception;
	
}
