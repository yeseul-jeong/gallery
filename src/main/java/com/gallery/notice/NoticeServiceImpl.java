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
	public void write(NoticeVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		noticeMapper.write(vo);

		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest);
		int size = list.size();
		for (int i = 0; i < size; i++) {
			noticeMapper.insertFile(list.get(i));
		}
	}

	@Override
	public NoticeVO read(int nId) throws Exception {
			noticeMapper.noticeHit(nId);
		return noticeMapper.read(nId);
	}

	@Override
	public void delete(int nId) throws Exception {
		noticeMapper.delete(nId);
	}

	@Override
	public List<NoticeVO> list(SearchCriteria scri) throws Exception {
		return  noticeMapper.selectNoticelist(scri);
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
		List<Map<String, Object>> fileList = fileUtils.parseUpdateFileInfo(vo, files, fileNames, mpRequest);
		System.out.println("Filelist info = "+fileList); /* null */
		Map<String, Object> tempMap = null;
		int size = fileList.size();
		for (int i = 0; i < size; i++) {
			tempMap = fileList.get(i);
			if (tempMap.get("IS_NEW").equals("Y")) {
				noticeMapper.insertFile(tempMap);
			} else {
				noticeMapper.updateFile(tempMap);
			}
		}
	}
	
	/* 수정 필요 */
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		noticeMapper.updateFile(map);
	}


}