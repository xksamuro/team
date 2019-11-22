package com.onlineShop.controller;

import com.onlineShop.entity.Role;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.onlineShop.service.IUserService;
import com.onlineShop.entity.User;
import com.onlineShop.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserHandler {

    @Autowired
    private IUserService userService;
    @Autowired
    private RoleService roleService;
    @RequestMapping(value = "/userList")
    public String findAllUsers(Model model){
        List<User> userList=userService.findAllUser();
        model.addAttribute("userList",userList);
        return "user-admin-list";
    }

    @RequestMapping(value = "/toUpdateUser/{id}")
    public String toUpdateUser(@PathVariable("id") Integer id, Map map){
        User user = userService.findUserById(id);
        System.out.println("UserHandler.toUpdateUser"+user+id);
        map.put("adminList",user);
        return "user-admin-update";
    }

    @RequestMapping(value = "/updateUser/{id}")
    public String updateUser(@PathVariable("id") Integer id,User user){
        userService.updateUser(user);
        System.out.println("updateUser()==========================>"+user);
        return "success";
    }

    @RequestMapping("/deleteUser")
    public String deleteUser(Integer id){
        System.out.println("deleteUser()==========================>"+id);
        userService.deleteUserById(id);
        return "user-admin-list";
    }

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }
    @RequestMapping("/loginUser")
    public String loginUser(Model model,String name,String password){
        System.out.println("student name and password is=======>"+name+","+password);
        User user=userService.selectByNameAndPassword(name, password);
        System.out.println("user=======>"+user);
        model.addAttribute("user",user);
        return "usermanagement-admin";
    }

   /* @RequestMapping("/admin")
    public String toRoleList(Map map, @RequestParam(defaultValue="1",required=true,value="pageNo") int pageNo, @RequestParam(defaultValue="4",required=true,value="pageSize") int pageSize){
        PageHelper.startPage(pageNo, pageSize);
        List<User> adminList = userService.adminList();
        PageInfo<User> pageInfo =new PageInfo<>(adminList);
        map.put("adminList",pageInfo);
        return "user-admin-list";
    }*/

    @RequestMapping("/admin")
    public String toAdminList(Map<String,List> map){
        List<User> adminList = userService.adminList();
        map.put("adminList",adminList);
        System.out.println(adminList);
        return "user-admin-list";
    }

    @RequestMapping("/teacher")
    public String toTeacherList(Map<String,List> map){
        List<User> teacherList = userService.teacherList();
        map.put("teacherList",teacherList);
        System.out.println(teacherList);
        return "user-tec-list";
    }

    @RequestMapping("/toAddAdmin")
    public String toAddAdmin(){
        return "user-admin-add";
    }

    @RequestMapping("/addAdmin")
    public String addAdmin(User user){
        user.setCreateTime(new Date());
        System.out.println(user.getCreateTime());
        System.out.println("UserHandler.addAdmin"+user);
        userService.addAdmin(user);
        return "success";
    }

    @RequestMapping(value = "/selectByName")
    public String search(Map<String,Object> map,String name) {
        User user = userService.findUserByName(name);
        map.put("searchList", user);
        return "user-admin-list";
    }
    @RequestMapping("/toallocateRole/{userId}")
    public String toAllocateRole(@PathVariable("userId") Integer userId, Map map){
        User user = userService.findUserById(userId);
        System.out.println(userId);
        List<Role> roleList = roleService.roleList();
        System.out.println(user);
        map.put("user2",user);
        map.put("roleList",roleList);
        map.put("id",userId);
        return "user-admin-allocateRole";
    }
    @RequestMapping(value = "/setrole",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String allocateRole(Integer userId, Integer roleId){
        System.out.println("UserHandler.allocateRole"+userId+"---"+roleId);
        userService.allocateRole(userId,roleId);
        return "分配成功";
    }
}
