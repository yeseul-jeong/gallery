package com.gallery.visitor;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface VisitorService {

  public void write(VisitorVO vo, MultipartHttpServletRequest mpRequest) throws Exception;

  public VisitorVO read(Integer vId) throws Exception;

  public void update(VisitorVO vo) throws Exception;

  public void delete(Integer vId) throws Exception;

  
  public List<VisitorVO> list(Criteria cri) throws Exception;
  
  public int listCount(Criteria cri) throws Exception;
  
  /* 수정 */
	/*
	 * public void update(VisitorVO vo, MultipartHttpServletRequest mpRequest)
	 * throws Exception;
	 * 
	 * public List<VisitorVO> adminList(Criteria cri) throws Exception;
	 * 
	 * public int adminListCount(Criteria cri) throws Exception;
	 */
}
