package com.onlineShop.service;

import com.onlineShop.entity.Role;

import java.util.List;

public interface RoleService {

    List<Role> roleList();

    void addrole(Role role);

    void deleteRole(Integer id);

    void updateRole(Role role);

    Role findByid(Integer id);

    void allocatePermission(Integer per_id, Integer role_id);
}
