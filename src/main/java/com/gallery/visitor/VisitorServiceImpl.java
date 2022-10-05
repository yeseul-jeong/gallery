package com.gallery.visitor;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gallery.mapper.VisitorMapper;

@Service
public class VisitorServiceImpl implements VisitorService {
	

	@Autowired
	private VisitorMapper visitorMapper;
	
	
	/* 수정 */


	@Override
	public void write(VisitorVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		visitorMapper.write(vo);
	}

	@Override
	public VisitorVO read(Integer vId) throws Exception {
		return visitorMapper.read(vId);
	}

	@Override
	public void update(VisitorVO vo) throws Exception {
		visitorMapper.update(vo);
	}

	@Override
	public List<VisitorVO> list(Criteria cri) throws Exception {
		return visitorMapper.selectlist(cri);
	}

	@Override
	public int listCount(Criteria cri) throws Exception {
		return visitorMapper.listCount(cri);
	}

	@Override
	public void delete(Integer vId) throws Exception {
		visitorMapper.delete(vId);	
	}

}