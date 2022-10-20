package com.gallery.gallery;

import lombok.Data;

@Data
public class AttachImageVO {
	/* 경로 */
	private String uploadPath;
	
	/* uuid */
	private String uuid;
	
	/* 파일 이름 */
	private String fileName;
	
	/* 갤러리 id */
	private int gId;
}
