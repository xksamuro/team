package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;
@Component
@Data
public class Action {

    private Integer id;

    private String actionname;

    private String actioncode;

    private String actionurl;

    private Date createtime;

    private String actiondesc;

}