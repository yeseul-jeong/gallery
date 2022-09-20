package com.gallery.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gallery.mapper.NoticeMapper;
import com.gallery.util.FileUtils;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private FileUtils fileUtils;

	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public void write(NoticeVO vo, MultipartHttpServletRequest communityRequest) throws Exception {
		noticeMapper.write(vo);

		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(vo, communityRequest);
		int size = list.size();
		for (int i = 0; i < size; i++) {
			noticeMapper.insertFile(list.get(i));
		}
	}

	@Override
	public NoticeVO read(Integer nId) throws Exception {
		return noticeMapper.read(nId);
	}

	@Override
	public void update(NoticeVO vo) throws Exception {
		noticeMapper.update(vo);
	}

	@Override
	public void delete(Integer nId) throws Exception {
		noticeMapper.delete(nId);
	}

	@Override
	public List<NoticeVO> list(SearchCriteria scri) throws Exception {
		return  noticeMapper.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return  noticeMapper.listCount(scri);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int nId) throws Exception {
		return noticeMapper.selectFileList(nId);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return noticeMapper.selectFileInfo(map);
	}

	@Override
	public void update(NoticeVO vo, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest)
			throws Exception {
		noticeMapper.update(vo);

		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(vo, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for (int i = 0; i < size; i++) {
			tempMap = list.get(i);
			if (tempMap.get("IS_NEW").equals("Y")) {
				noticeMapper.insertFile(tempMap);
			} else {
				noticeMapper.updateFile(tempMap);
			}

		}
	}

	@Override
	public List<NoticeVO> adminList(SearchCriteria scri) throws Exception {
		return noticeMapper.adminList(scri);
	}

	@Override
	public int adminListCount(SearchCriteria scri) throws Exception {
		return noticeMapper.adminListCount(scri);
	}
}