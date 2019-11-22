package com.onlineShop.service;

import com.onlineShop.dao.ClassesDao;
import com.onlineShop.dao.PlanDao;
import com.onlineShop.dao.ProfessionDao;
import com.onlineShop.entity.Classes;
import com.onlineShop.entity.Plan;
import com.onlineShop.entity.Profession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ClassServiceImpl implements ClassService {
	@Autowired
	private ClassesDao classesDao;
	@Autowired
	private ProfessionDao professionDao;
	@Autowired
	private PlanDao planDao;

	@Override
	public List<Classes> findAllClassesByStudent(int studentId) {
		return classesDao.findAllClassesByStudent(studentId);
	}

	@Override
	public Classes findClassById(Integer id) {
		return classesDao.findClassById(id);
	}

	@Override
	public List<Classes> selectAllClasses() {

		return classesDao.selectAllClasses();//查询所有班级
	}

	@Override
	public List<Classes> selectClassesByNumName(String numName) {
		return classesDao.selectClassesByNumName(numName);
	}

	@Override
	public List<Classes> selectClassesByName(String name) {
		return classesDao.selectClassesByName(name);
	}

	@Override
	public List<Classes> selectClassesByInstitution(String instName) {
		return classesDao.selectClassesByInstitution(instName);
	}

	@Override
	public List<Classes> selectClassesByBranch(String branchName) {
		return classesDao.selectClassesByBranch(branchName);
	}

	@Override
	public List<Classes> selectClassesByProfession(String proName) {
		return classesDao.selectClassesByProfession(proName);
	}

	@Override
	public void insertClass(Classes classes) {
		classes.setIsused(1);
	    classesDao.insertClass(classes);
	}

	@Override
	public void deleteClass(int id) {
		classesDao.deleteClass(id);
	}

	@Override
	public void updateClass(Classes classes) {
		classesDao.updateClass(classes);
	}

	@Override
	public List<Profession> showProfessionList() {
		return professionDao.selectAllProfessions();
	}

	@Override
	public List<Plan> showPlanList() {
		return planDao.selectAllPlans();
	}

}
