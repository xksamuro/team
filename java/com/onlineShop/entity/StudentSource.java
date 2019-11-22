package com.onlineShop.entity;


import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class StudentSource {//章节资料

    private int id;

    private String name;//资源名称

    private String path;//资源路径

    private String type;//资源类型
}
