package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
@Data
public class Plan {//方案

    private Integer planId;//方案id

    private String plannum;//方案编号

    private String planname;//方案名称

    private int planstatus;//方案启用状态:0.未启用 1.启用

    private Date createtime;//创建时间

    private int isdelete;//0已删除，1为存在

    private List<Course> courseList;//维持一个课程集合


}
