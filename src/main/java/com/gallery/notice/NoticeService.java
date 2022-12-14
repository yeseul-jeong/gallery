package com.gallery.notice;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface NoticeService {

  public void write(NoticeVO vo, MultipartHttpServletRequest communityRequest) throws Exception;

  public NoticeVO read(int nId) throws Exception;
  
  public void update(NoticeVO vo) throws Exception;

  public void update(NoticeVO vo, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;

  public void delete(int nId) throws Exception;

  
  public List<NoticeVO> list(SearchCriteria scri) throws Exception;
  
  public int listCount(SearchCriteria scri) throws Exception;
  
  /* 수정 */
  
  public List<Map<String, Object>> selectFileList(int nId) throws Exception;
  
  public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
  
  public void updateFile(Map<String, Object> map) throws Exception;

}
