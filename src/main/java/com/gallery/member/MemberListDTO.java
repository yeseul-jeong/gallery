package com.gallery.member;

import java.util.Date;

import lombok.Data;

// 필요한지 검토하고 안 쓰면 지우기

@Data
public class MemberListDTO {
	
	private int mNo;
	private String mId;
	private String mName;
	private String email;
	private Date regDate;
	private int mLevel;

}
