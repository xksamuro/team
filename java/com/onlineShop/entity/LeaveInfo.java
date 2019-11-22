package com.onlineShop.entity;
import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Data
public class LeaveInfo {//请假记录

    private int id;

    private String leavereason;//请假理由

    private Date starttime;//申请时间

    private Date endtime;//销假时间

    private Student student;//维持学生类，获得id和name

    private String opinion;//审批意见

    private Data createtime;//通过时间

    private String leavetype;//请假类型，事假or病假


}
