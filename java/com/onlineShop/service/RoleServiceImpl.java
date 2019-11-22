package com.onlineShop.service;

import com.onlineShop.dao.RoleDao;
import com.onlineShop.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;
    @Override
    public List<Role> roleList() {
        return roleDao.findAllRole();
    }

    @Override
    public void addrole(Role role) {
        roleDao.addRole(role);
    }

    @Override
    public void deleteRole(Integer id) {
        roleDao.deleteById(id);
    }

    @Override
    public void updateRole(Role role) {
        roleDao.updateById(role);
    }


    @Override
    public Role findByid(Integer id) {
        return roleDao.findByid(id);
    }

    @Override
    public void allocatePermission(Integer per_id, Integer role_id) {
        roleDao.allocatePermission(per_id,role_id);
    }
}
