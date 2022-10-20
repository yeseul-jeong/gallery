package com.gallery.notice;

import java.util.Date;
import java.util.List;
import java.util.Map;
import lombok.Data;

public class CommentVO {


	private Integer cId;
	private Integer nId;

	private String mId;
	private String content;
	private Date regDate;
	
	public Integer getcId() {
		return cId;
	}
	public void setcId(Integer cId) {
		this.cId = cId;
	}
	
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
		return "CommentVO [cId=" + cId + ", nId=" + nId + ", mId=" + mId + ", content=" + content + ", regDate="
				+ regDate + "]";
	}
	
	
	/*
	 * 
	 * public CommentVO(Number rno,String mId,String content,Date regDate) {
	 * this.rno = rno; this.mId = mId; this.content = content; this.regDate =
	 * regDate; }
	 * 
	 * public CommentVO(String mId,String pid,String content,Date regDate) {
	 * this.mId = mId; this.pid = pid; this.content = content; this.regDate =
	 * regDate; }
	 * 
	 * public CommentVO(String mId,String content,Date regDate) { this.mId = mId;
	 * this.content = content; this.regDate = regDate; }//pid없음
	 * 
	 * public CommentVO(MemberDTO memberDTO,String content,Date regDate) { this.mId
	 * = memberDTO.getmId(); this.content = content; this.regDate = regDate; }
	 * 
	 * public CommentVO(String mId,String content) { this.mId = mId; this.content =
	 * content; }
	 */
	

	/*
	 * public boolean equals(Object o) { if(o instanceof CommentVO) { CommentVO c =
	 * (CommentVO)o; return rno == c.rno; } return false; }
	 */


	/*
	 * public void validate(Map<String, Boolean> errors) { if (content == null ||
	 * content.trim().isEmpty()) { errors.put(content, Boolean.TRUE); } }
	 */

}
