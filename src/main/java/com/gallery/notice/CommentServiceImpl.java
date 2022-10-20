package com.gallery.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gallery.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentMapper commantMapper;
	
	@Override
	public List<CommentVO> list(Integer nId) throws Exception {
		return commantMapper.list(nId);
	}

	@Override
	public void create(CommentVO cvo) throws Exception {
		commantMapper.create(cvo);
	}

	@Override
	public void update(CommentVO cvo) throws Exception {
		commantMapper.update(cvo);
	}

	@Override
	public void delete(CommentVO cvo) throws Exception {
		commantMapper.delete(cvo);
	}

	@Override
	public List<CommentVO> listPage(Map<String, Object> paramMap) throws Exception {
		return commantMapper.listPage(paramMap);
	}

	@Override
	public int count(Integer nId) throws Exception {
		return commantMapper.count(nId);
	}

	@Override
	public int getCId(Integer cId) throws Exception {
		return commantMapper.getCId(cId);
	}

	@Override
	public CommentVO selectComment(Integer cId) throws Exception {
		return commantMapper.selectComment(cId);
	}

}
