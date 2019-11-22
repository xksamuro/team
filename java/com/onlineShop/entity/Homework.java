package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Data
public class Homework {//作业

    private int id;

    private String name;

    private Date createTime;//创建时间

    private Section section;//维持小节id

    private Classes classes;//维持classid

    private String filepath;//路径

}
