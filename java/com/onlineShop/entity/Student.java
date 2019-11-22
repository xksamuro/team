package com.onlineShop.entity;


import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * 学生的实体类
 */
@Component
@Data
public class Student {

    private  int id;

    private int strnum;//学生编号

    private  String  name;//登录名

    private String password;// 登录密码

    private String stuname;//学生真实姓名

    private String phone;//手机号

    private String email;//邮箱

    private int sex;//性别

    private Date startTime;//开始时间

    private Date endTime;//结束时间

    private int isused;//是否使用

    private String imageurl;//头像图片路径

    private String  cardnumber;//身份证号

    private  Date birthday;//生日

    private  Date createTime;//建号时间

    private Date lasttime;//最后登陆时间

    private String studentschool;//学生所在学校

    private String studentcollege;//学生专业

    private String englishLevel;// 英语等级

    private int isdelete;//是否删除

    private List<Classes> classesList;//所在班级

    private List<VideoQuestion> videoQuestionList;//所提问题

    private List<Notes> notesList;//所记笔记

    private List<QuestionAnswer> questionAnswerList;// 所回答的问题

   private List<Homework> homeworkList;//家庭作业

    private List<HomeworkAnswer> homeworkAnswerList;//家庭作业答案

}
