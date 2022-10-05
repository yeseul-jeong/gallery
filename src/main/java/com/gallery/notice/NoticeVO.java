package com.gallery.notice;

import java.util.Date;

public class NoticeVO {
	
	private Integer nId;
	private String mId;
	private String title;
	private String content;
	private Date regDate;
	private int hit;
	
	public Integer getnId() {
		return nId;
	}
	public void setnId(Integer nId) {
		this.nId = nId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [nId=" + nId + ", mId=" + mId + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + ", hit=" + hit + "]";
	}
	
	
	
	
}
