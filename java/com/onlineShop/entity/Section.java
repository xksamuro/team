package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class Section {//小节

    private int id;

    private String name;

    private  String sectionnum;//在章中的小节号

    private Video video;//视频

    private int videostatus;//是否能够观看

    private int isdelete;

    private StudentSource source;


}
