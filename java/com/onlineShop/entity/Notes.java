package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Data
public class Notes {//笔记,一张单表

    private int noteid;

    private String notecontent;//笔记内容

    private int isdelete;//是否删除

    private Date notetime;//记笔记时间

    private int studentid;
}
