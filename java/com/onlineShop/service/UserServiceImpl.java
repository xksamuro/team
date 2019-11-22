
package com.onlineShop.service;

import com.onlineShop.dao.UserDao;
import com.onlineShop.entity.Page;
import com.onlineShop.entity.User;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User login(String name) {
        return userDao.findUserByName(name);
    }

    @Override
    public void addUser(User user) {
        userDao.addUser(user);
    }

    @Override
    public void deleteUserById(Integer id) {
        userDao.deleteUserById(id);
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUserById(user);
    }


    @Override
    public User findUserById(Integer id) {
        return userDao.findUserById(id);
    }

    @Override
    public User findUserByName(String name) {
        return userDao.findUserByName(name);
    }

    @Override
    public List<User> findUserByUsername(String username) {
        return userDao.findUserByUsername(username);
    }

    @Override
    public User selectByNameAndPassword(String username, String password) {
        return userDao.selectByNameAndPassword(username,password);
    }

    @Override
    public List<User> findAllUser() {
        return userDao.getLists();
    }

    @Override
    public List<User> adminList() {
        return userDao.adminList();
    }


    @Override
    public List<User> teacherList() {
        return userDao.teacherList();
    }


    /*@Cacheable(value="user")
    public List<User> getLists() {
        System.out.println("打印语句则没有走缓存");
        return userDao.getLists();
    }*/

    /*@Cacheable(value="user")
    public List<User> getLists() {
        System.out.println("打印语句则没有走缓存");
        return userDao.getLists();
    }*/

    @Override
    public void addAdmin(User user) {
        user.setUsertype(1);
        String hashAlgorithmName = "MD5";
        Object credentials = user.getPassword();
        String s = credentials.toString();
        Object salt = ByteSource.Util.bytes(user.getName());
        int hashIterations = 1024;
        Object result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
        String s1 = result.toString();
        Timestamp times = new Timestamp(System.currentTimeMillis());
        user.setCreateTime(times);
        user.setPassword(s1);
        userDao.addUser(user);

    }


    @Override
    public void updateAdmin(User user) {
        userDao.updateUserById(user);
    }

    @Override
    public void deleteAdminById(int userId) {
        User userById = userDao.findUserById(userId);
        userById.setIsdelete(2);
        userDao.updateUserById(userById);
    }

    @Override
    public void allocateRole(int userId, int roleId) {
        userDao.allocateRole(userId,roleId);
    }
    

}

