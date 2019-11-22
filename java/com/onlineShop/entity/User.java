package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * 用户实体类
 */
@Component
@Data
public class User {//管理员，一张单表

    private int id;

    private String name;//用户的账户名

    private String username;//用户的真实姓名

    private String password;//登录密码

    private String phone;//手机号

    private String email;//邮箱

    private String sex;//性别

    private Integer cardnumber;//身份证号

    private Date startTime;//开始时间

    private Date endTime;//结束时间

    private Date createTime;//创建时间

    private Integer usertype;//用户类型：

    private  String education;// 学历

    private Integer isdelete;//是否删除

    private List<QuestionAnswer> questionAnswerList;

    private List<Role> roles;


}
