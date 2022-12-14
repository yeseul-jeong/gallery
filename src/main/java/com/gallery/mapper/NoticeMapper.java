package com.gallery.mapper;

import java.util.List;
import java.util.Map;

import com.gallery.notice.NoticeVO;
import com.gallery.notice.SearchCriteria;


public interface NoticeMapper {
	
	public void write(NoticeVO vo) throws Exception;

	public NoticeVO read(int nId) throws Exception;

	public void update(NoticeVO vo) throws Exception;

	public void delete(Integer nId) throws Exception;

	public List<NoticeVO> selectNoticelist(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public void insertFile(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectFileList(int nId) throws Exception;
	
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	public void updateFile(Map<String, Object> map) throws Exception;
	
	public void noticeHit (int nId) throws Exception;
	
}
