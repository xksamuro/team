package com.onlineShop.dao;

import com.onlineShop.entity.Institution;

import java.util.List;

public interface InstitutionDao {
    List<Institution> findAll();//查询所有的机构
    void addInstitution(Institution institution);//添加新的机构
    void updateInstitution(Institution institution);//修改机构
    Institution findByName(String name);//根据机构名称查找
    void deleteById(int id);//根据id删除机构
}
