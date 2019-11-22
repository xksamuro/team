package com.onlineShop.controller;

import com.onlineShop.entity.Student;
import com.onlineShop.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/student")
public class StudentHandler {

    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/showstudent")
    public String toStudentList(Map<String, List> map){
        List<Student> studentList = studentService.studentList();
        map.put("studentList",studentList);
        System.out.println(studentList);
        return "user-stu-list";
    }

    @RequestMapping("/toAddStudent")
    public String toAddStudent(){
        return "user-stu-add";
    }

    @RequestMapping("/addStudent")
    public String addStudent(Student student){

        studentService.addStudent(student);
        return "success";
    }

    @RequestMapping(value = "/toUpdateStudent/{id}")
    public String toUpdateStudent(@PathVariable("id") Integer id, Map map){
        Student student = studentService.findStudentById(id);
        System.out.println("UserHandler.toUpdateUser"+student+id);
        map.put("studentList",student);
        return "user-stu-update";
    }

    @RequestMapping("/updateStudent/{id}")
    public String updateStudent(@PathVariable("id") Integer id, Student student){
        studentService.updateStudentById(student);
        System.out.println("updateStudent()==========================>"+student);
        return "success";
    }

    @RequestMapping("/deleteStudent")
    public String deleteStudent(Integer id){
        System.out.println("deleteStudent()==========================>"+id);
        studentService.deleteStudentById(id);
        return "user-stu-list";
    }

    @RequestMapping(value = "/selectByStuName")
    public String search(Map<String,Object> map,String stuname) {
        Student student = studentService.getStudentByStuName(stuname);
        map.put("search", student);
        return "user-stu-list";
    }


}
