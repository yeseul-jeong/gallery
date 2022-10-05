package com.gallery.member;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MemberDTO {
	
	private int mNo;
	private String mId;
	private String pw;
	private String mName;
	private String phone;
	private String email;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	private int mLevel;
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getmLevel() {
		return mLevel;
	}
	public void setmLevel(int mLevel) {
		this.mLevel = mLevel;
	}
	@Override
	public String toString() {
		return "MemberDTO [mNo=" + mNo + ", mId=" + mId + ", pw=" + pw + ", mName=" + mName + ", phone=" + phone
				+ ", email=" + email + ", regDate=" + regDate + ", mLevel=" + mLevel + "]";
	}
	
	
	
	
}
