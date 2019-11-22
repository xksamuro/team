package com.onlineShop.entity;


import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.List;

@Data
@Component
public class Institution {//机构

    private int id;

    private String name;

    private List<Branch> branchList;


}
