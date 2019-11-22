package com.onlineShop.entity;


import lombok.Data;
import org.springframework.stereotype.Component;


import java.util.Date;
import java.util.List;

@Data
@Component
public class Course {//课程

    private int id;

    private String name;

    private String courseNum;//课程编号

    private String description;

    private Date startTime;

    private Date endTime;

    private int isdelete;

    private int hotcourse;//是否热门课程

    private List<Chapter> chapterList;
}
