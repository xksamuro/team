package com.onlineShop.dao;

import com.onlineShop.entity.Chapter;

import java.util.List;

public interface ChapterDao {
    List<Chapter> selectChaptersByCourseId(Integer course_id);//根据课程号查询章节

}
