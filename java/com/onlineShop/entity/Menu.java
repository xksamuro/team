package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
@Data
public class Menu {
    private int id;
    private  String menuname;
    private String menudesc;
    private Date createtime;
    private String menuurl;
    private Integer fathermenuid;
    private String actionids;
    private List<Action> actionList;

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", menuname='" + menuname + '\'' +
                ", menudesc='" + menudesc + '\'' +
                ", createtime=" + createtime +
                ", menuurl='" + menuurl + '\'' +
                ", actionList=" + actionList +
                '}';
    }
}
