package com.gallery.gallery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gallery.mapper.GalleryMapper;

@Service
public class GalleryServiceImpl implements GalleryService {

	@Autowired
	private GalleryMapper galleryMapper;

	@Override
	@Transactional
	public List<GalleryVO> selectGalleryList() throws Exception {
		return galleryMapper.selectGalleryList();
	}

	@Override
	@Transactional
	public GalleryVO selectGalleryDetail(int gId) throws Exception {
		return galleryMapper.selectGalleryDetail(gId);
	}

	@Override
	@Transactional
	public List<GalleryVO> selectByArtist(int aId) throws Exception {
		return galleryMapper.selectByArtist(aId);
	}

	@Override
	@Transactional
	public void insert(GalleryVO vo) throws Exception {
		galleryMapper.insert(vo);
	}

	@Override
	@Transactional
	public int updateGallery(GalleryVO vo) throws Exception {
		return galleryMapper.updateGallery(vo);
	}

	@Override
	@Transactional
	public int delete(int gId) throws Exception {
		return galleryMapper.delete(gId);
	}

	@Override
	@Transactional
	public List<GalleryVO> selectListWithPaging(GalleryCriteria cri) throws Exception {
		return galleryMapper.selectListWithPaging(cri);
	}

	@Override
	@Transactional
	public int listCountCriteria(GalleryCriteria cri) throws Exception {
		return galleryMapper.countPaging(cri);
	}

	@Override
	@Transactional
	public List<GalleryVO> search(String keyword) throws Exception {
		return galleryMapper.search(keyword);
	}

	@Override
	public int countPaging(GalleryCriteria cri) throws Exception {
		return galleryMapper.countPaging(cri);
	}
}
