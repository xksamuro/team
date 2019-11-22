package com.onlineShop.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
@Data
public class VideoQuestion {//视频问题

    private Integer questionid;

    private String questioncontent;//问题内容

    private Date questiontime;//提问时间

    private Integer studentid;

    private Integer videoId;

    private List<QuestionAnswer> questionAnswerList;//对于问题的答案
}
