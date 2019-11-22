package com.onlineShop.service;

import com.onlineShop.entity.Student;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

public interface StudentService {
    Student findStudentByNameAndPassword(String name, String password);//登陆

    void addStudent(Student student);

    void deleteStudentById(Integer id);

    void updateStudentById(Student student);

    Student findStudentById(Integer id);

    List<Student> getStudentsByClass(String className);

    Student getStudentByStuName(String stuName);

    /*List<Student> getStudentsByInstitution(String instiName);

    List<Student> getStudentsByBranch(String branchName);

    List<Student> getStudentsByStartTime(Date startTime);

    List<Student> getStudentsByEndTime(Date endTime);*/

    List<Student> studentList();
}
