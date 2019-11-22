package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.DataTruncation;
import java.util.Date;
import java.util.List;

@Component
@Data
public class Paper {//试卷//与试题多对多

    private int id;

    private String name;

    private int timelength;//考试时长

    private int totalscore;//总分

    private Date startTime;

    private Date endTime;

    private int paperstatus;//试卷状态

    private Course course;//维持courseid

    private Classes classes;//维持classid

    private List<PaperQusetion> paperQusetionList;//题目list
}
