package com.onlineShop.service;

import com.onlineShop.dao.StudentDao;
import com.onlineShop.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    public Student findStudentByNameAndPassword(String name, String password) {
        return studentDao.findUserByNameAndPassword(name,password);
    }

    @Override
    public void addStudent(Student student) {

        studentDao.addStudent(student);
    }

    @Override
    public void deleteStudentById(Integer stuid) {
        Student studentById = studentDao.findStudentById(stuid);
        studentById.setIsdelete(2);
        studentDao.updateStudentById(studentById);

    }

    @Override
    public void updateStudentById(Student student) {
        studentDao.updateStudentById(student);
    }

    @Override
    public Student findStudentById(Integer id) {
        return studentDao.findStudentById(id);
    }

    @Override
    public List<Student> getStudentsByClass(String className) {
        return studentDao.getStudentsByClass(className);
    }

    @Override
    public Student getStudentByStuName(String stuName) {
        return studentDao.getStudentByStuName(stuName);
    }

    /*@Override
    public List<Student> getStudentsByInstitution(String instiName) {
        return studentDao.getStudentsByInstitution(instiName);
    }

    @Override
    public List<Student> getStudentsByBranch(String branchName) {
        return studentDao.getStudentsByBranch(branchName);
    }

    @Override
    public List<Student> getStudentsByStartTime(Date startTime) {
        return studentDao.getStudentsByStartTime(startTime);
    }

    @Override
    public List<Student> getStudentsByEndTime(Date endTime) {
        return studentDao.getStudentsByEndTime(endTime);
    }*/

    @Override
    public List<Student> studentList() {
        return studentDao.studentList();
    }
}
