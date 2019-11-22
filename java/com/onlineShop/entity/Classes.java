package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.DataTruncation;
import java.util.Date;
import java.util.List;

@Data
@Component
public class Classes {//班级

    private int id;//班级Id号

    private String numName;//班级编号

    private String name;//班级名称

    private Date startTime;//开始时间

    private Date endTime;//结束时间

    private int isused;//是否启用

    private Plan plan;//一个班级对应一种方案

    private Profession profession;

    private int professionId;

    private int planId;

}
