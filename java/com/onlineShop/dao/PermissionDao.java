package com.onlineShop.dao;

import com.onlineShop.entity.Permissions;

import java.util.List;

public interface PermissionDao {
    List<Permissions> findAll();
    List<Permissions> findByName(String pername);
    Permissions findById(Integer per_id);
}
