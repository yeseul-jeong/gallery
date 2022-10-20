package com.gallery.gallery;

import java.util.List;

import com.gallery.gallery.GalleryCriteria;
import com.gallery.gallery.GalleryVO;

public interface GalleryService {
	
	public List<GalleryVO> selectGalleryList() throws Exception;

	public GalleryVO selectGalleryDetail(int gId) throws Exception;

	public List<GalleryVO> selectByArtist(int aId) throws Exception;

	public List<GalleryVO> selectListWithPaging(GalleryCriteria cri) throws Exception;

	public int countPaging(GalleryCriteria cri) throws Exception;

	public void insert(GalleryVO vo) throws Exception;

	public int updateGallery(GalleryVO vo) throws Exception;

	public int delete(int gId) throws Exception;

	public List<GalleryVO> search(String keyword) throws Exception;

	public int listCountCriteria(GalleryCriteria cri) throws Exception;
}
