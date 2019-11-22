package com.onlineShop.dao;

import com.onlineShop.entity.User;

import java.util.List;

public interface UserDao {

    void addUser(User user);//添加用户(excel导入可能用不到)

    void deleteUserById(Integer id);//通过id删除用户

    void updateUserById(User user);//更新用户信息

    User findUserById(Integer id);//通过id查找用户

    User findUserByName(String name);//通过name(账户名)查找用户

    List<User> findUserByUsername(String username);//通过username(真实姓名)查找用户

    User selectByNameAndPassword(String username, String password);//通过用户名和密码查找用户

    List<User> getLists();//显示所有用户

    List<User> findUserByInput(String username);

    List<User> adminList();

    List<User> teacherList();
    void allocateRole(int userId, int roleId);
}
