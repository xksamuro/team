package com.onlineShop.dao;

import com.onlineShop.entity.Profession;

import java.util.List;

public interface ProfessionDao {
    Profession selectProfessionByName(String name);//根据专业名查找专业

    Profession selectProfessionByPrimaryKey(Integer id);//根据专业id查找专业

    List<Profession> selectAllProfessions();

    List<Profession> selectProfessionsByInstitution(String name);//根据机构名查找专业

    List<Profession> selectProfessionsByBranch(String name);//根据分支名查找专业

    void insertProfession(Profession profession);//添加专业

    void deleteProfession(Integer id);//删除专业

    void updateProfession(Profession profession);//更新专业






}
