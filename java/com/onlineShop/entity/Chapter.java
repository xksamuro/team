package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Data
public class Chapter {//章

    private int id;

    private String name;

    private int chapnum;//在课程中的章号

    private Course course;//维持课程

    private List<Section> sections;

    private int isdelete;

}
