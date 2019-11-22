package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Data
public class VideoWatchRecord {

    private Integer id;

    private Date videostarttime;//观看视频的开始时间

    private Integer videostartposition;//观看视频的开始位置

    private Date videoendtime;//观看视频的结束时间

    private Integer videoendposition;//观看视频的结束位置

    private Student student;

    private Video video;
}
