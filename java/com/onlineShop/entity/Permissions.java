package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
@Component
@Data
public class Permissions {
    private List<Menu> menuList;

    private Integer perId;

   private String pername;

    private String perdesc;

    private Date createtime;



}