package com.gallery.notice;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class NoticeVO {
	
	private Integer nId;
	private String mId;
	private String title;
	private String content;
	private Date regDate;
}
