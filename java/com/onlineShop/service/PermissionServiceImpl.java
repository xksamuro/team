package com.onlineShop.service;

import com.onlineShop.dao.PermissionDao;
import com.onlineShop.entity.Permissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionServiceImpl implements PermissionSeervice {
    @Autowired
    private PermissionDao permissionDao;
    @Override
    public List<Permissions> findAll() {
        return permissionDao.findAll();
    }

    @Override
    public List<Permissions> findByName(String pername) {
        return permissionDao.findByName(pername);
    }

    @Override
    public Permissions findById(Integer per_id) {
        return permissionDao.findById(per_id);
    }
}
