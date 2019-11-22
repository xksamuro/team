package com.onlineShop.entity;


import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.List;

@Data
@Component
public class Branch {//部门分支

    private int id;

    private String name;

    private Institution institution;

    private List<Profession> professionsList;
}
