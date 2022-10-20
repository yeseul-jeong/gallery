package com.gallery.gallery;

import java.util.Date;

import lombok.Data;

@Data
public class GalleryDetailVO {

    private int gId;
    private String gName;
    private Date regDate;
    private String thumbnail;
    private String image;
    private Date workDate;
    private String gDesc;
    private int aId;
    private String aName;
    private String aDesc;

    
}
