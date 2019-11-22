package com.onlineShop.entity;


import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * 视频资源的实体类
 */
@Component
@Data
public class Video {

    private Integer videoid;

    private String videotitle;//视频主题

    private String videourl;//视频路径

    private double videolength;//视频长度

    private Integer isused;//视频状态

    private Date createtime;//创建时间

    private Integer isdelete;//是否删除

    private List<VideoQuestion> videoQuestion;//对于视频所提出的问题

    private List<Notes> notes;//对于视频所记得笔记

    private List<QuestionAnswer> questionAnswerList;//对于视频所提问题的回答
}
