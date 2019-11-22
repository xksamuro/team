package com.onlineShop.entity;

public class PlanCourse {//方案对应的课程

    private int id;

    private int planId;//方案号

    private int coursenum;//课程编号

    private int stagenum;//阶段编号

    private String stagename;//阶段名称，第几阶段

    private int courseOrder;//课程排序，课程在每个阶段的排序号

    private int isdelete;//0表示删除，1表示存在

}
