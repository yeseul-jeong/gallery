package com.gallery.visitor;

import java.util.Date;

public class VisitorVO {
	
	private Integer vId;
	private String mId;
	private String content;
	private Date regDate;
	
	public Integer getvId() {
		return vId;
	}
	public void setvId(Integer vId) {
		this.vId = vId;
	}
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
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
	
	@Override
	public String toString() {
		return "VisitorVO [vId=" + vId + ", mId=" + mId + ", content=" + content + ", regDate=" + regDate + "]";
	}

	
	
}
