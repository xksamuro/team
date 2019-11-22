package com.onlineShop.service;

import com.onlineShop.entity.Page;
import com.onlineShop.entity.User;

import java.util.List;

public interface IUserService {
    User login(String name);

    void addUser(User user);//添加用户(excel导入可能用不到)

    void deleteUserById(Integer id);//通过id删除用户

    void updateUser(User user);//更新用户信息

    User findUserById(Integer id);//通过id查找用户

    User findUserByName(String name);//通过name(账户名)查找用户

    List<User> findUserByUsername(String username);//通过username(真实姓名)查找用户

    User selectByNameAndPassword(String username,String password);//通过用户名和密码查找用户

    List<User> findAllUser();//显示所有用户

    List<User> adminList();

    List<User> teacherList();

    void addAdmin(User user);

    void updateAdmin(User user);

    void deleteAdminById(int userId);

    void allocateRole(int userId, int roleId);


}
