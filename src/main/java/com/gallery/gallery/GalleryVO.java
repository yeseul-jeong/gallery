package com.gallery.gallery;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

public class GalleryVO {
	
	private int gId;
	private String gName;
	private String gDesc;
	private String thumbnail;
	private String image;
	private Date regDate;
	private Date workDate;
	private int aId;
	
	// 작가 설명
	private String aName;
    private String aDesc;
    
	private MultipartFile uploadfile;

	public int getgId() {
		return gId;
	}

	public void setgId(int gId) {
		this.gId = gId;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public String getgDesc() {
		return gDesc;
	}

	public void setgDesc(String gDesc) {
		this.gDesc = gDesc;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getWorkDate() {
		return workDate;
	}

	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}

	public int getaId() {
		return aId;
	}

	public void setaId(int aId) {
		this.aId = aId;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaDesc() {
		return aDesc;
	}

	public void setaDesc(String aDesc) {
		this.aDesc = aDesc;
	}

	public MultipartFile getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}

	@Override
	public String toString() {
		return "GalleryVO [gId=" + gId + ", gName=" + gName + ", gDesc=" + gDesc + ", thumbnail=" + thumbnail
				+ ", image=" + image + ", regDate=" + regDate + ", workDate=" + workDate + ", aId=" + aId + ", aName="
				+ aName + ", aDesc=" + aDesc + ", uploadfile=" + uploadfile + "]";
	}
	
	
	
}
