package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.io.File;
import java.util.Date;

@Component
@Data
public class StuHomeworkAnswer {

    private Integer id;

    private String answercontext;//学生作业答案

    private String filepath;//作业附件路径

    private Date commitTime;//作业答案提交时间

    private Homework homework;//维持作业id

    private Student student;//维持学生id


}
