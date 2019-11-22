package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class PaperQusetion {

    private int id;

    private String context;//题目内容

    private int questionstatus;//题目状态

    private int questiontype;//题目类型

    private Course course;//维持该题目属于的课程


}
