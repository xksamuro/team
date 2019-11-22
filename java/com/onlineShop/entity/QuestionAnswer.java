package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;


@Component
@Data
public class QuestionAnswer {//学生老师问题回答

    private int answerid;

    private String answercontent;//回答内容

    private Date answertime;//回答时间

    private int isdelete;//是否删除
}
