package com.onlineShop.service;

import com.onlineShop.entity.Permissions;

import java.util.List;

public interface PermissionSeervice {
    List<Permissions> findAll();
    List<Permissions> findByName(String pername);
    Permissions findById(Integer per_id);
}
