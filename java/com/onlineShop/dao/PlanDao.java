package com.onlineShop.dao;

import com.onlineShop.entity.Plan;

import java.util.List;

public interface PlanDao {

    Plan selectByClassId(Integer classId);

    List<Plan> selectAllPlans();
}
