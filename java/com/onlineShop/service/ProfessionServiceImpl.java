package com.onlineShop.service;

import com.onlineShop.dao.ProfessionDao;
import com.onlineShop.entity.Profession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProfessionServiceImpl implements ProfessionService{

    @Autowired
    private ProfessionDao professionDao;


//    public Profession selectProfessionByName(String name){
//        return professionDao.selectProfessionByName(name);
//    }
//
//    public Profession selectProfessionByPrimaryKey(Integer id){
//        return professionDao.selectProfessionByPrimaryKey(id);
//    }
    @Transactional
    @Override
    public List<Profession> selectAllProfessions(){
        return professionDao.selectAllProfessions();
    }

//    public List<Profession> selectProfessionsByInstitution(String name){
//        return professionDao.selectProfessionsByInstitution(name);
//    }
//
//    public List<Profession> selectProfessionsByBranch(String name){
//        return professionDao.selectProfessionsByBranch(name);
//    }
//
//    public void insertProfession(Profession profession){
//        professionDao.insertProfession(profession);
//    }
//
//    public void deleteProfession(Integer id){
//        professionDao.deleteProfession(id);
//    }
//
//    public void updateProfession(Profession profession){
//        professionDao.updateProfession(profession);
//    }
}
