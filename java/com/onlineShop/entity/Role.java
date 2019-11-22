package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
@Data
public class Role {
    private int id;

    private String rolename;

    private String roledesc;

    private Date createtime;

    private List<Permissions> permissionList;

}
