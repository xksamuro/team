package com.onlineShop.dao;

import com.onlineShop.entity.Classes;
import com.onlineShop.entity.Course;

import java.util.List;

public interface CourseDao {

    List<Course> selectCoursesByClassId(int class_id);//根据班级号查询所有课程
}
