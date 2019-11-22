package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Data
public class HomeworkAnswer {//作业答案

    private int id;

    private String name;

    private Date answerTime;//答案创建时间

    private Homework homework;

    private User user;//布置作业的老师

    private String filepath;

    private int answerscore;//答案分值

}
