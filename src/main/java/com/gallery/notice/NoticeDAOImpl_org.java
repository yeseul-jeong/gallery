package com.gallery.notice;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl_org implements NoticeDAO_org {

	@Inject
	private SqlSession session;

	private static String namespace = "com.gallery.mapper.NoticeMapper";

	@Override
	public void write(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public NoticeVO read(Integer nId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Integer nId) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<NoticeVO> selectNoticelist(SearchCriteria scri) throws Exception {
		return session.selectList(namespace+".selectNoticelist", scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Map<String, Object>> selectFileList(Integer nId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<NoticeVO> adminList(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminListCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
