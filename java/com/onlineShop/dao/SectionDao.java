package com.onlineShop.dao;

import com.onlineShop.entity.Section;

import java.util.List;

public interface SectionDao {
    List<Section> selectSectionsByChapterId(Integer chapter_id);//根据章节号查询所有小节
}
