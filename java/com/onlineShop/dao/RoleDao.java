package com.onlineShop.dao;

import com.onlineShop.entity.Role;

import java.util.List;

public interface RoleDao {
    void addRole(Role role);
    void deleteById(Integer id);
    void updateById(Role role);
    Role findByid(Integer id);
    List<Role> findAllRole();
    void allocatePermission(Integer per_id, Integer role_id);
}
