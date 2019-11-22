package com.onlineShop.entity;


import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.List;


@Component
@Data
public class Profession { //专业

    private int id;

    private String name;

    private int branchId;//维持一个分支

    private int professionstatus;//是否启用

    private List<Classes> classesList;

}
