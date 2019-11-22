package com.onlineShop.service;

import com.onlineShop.entity.Menu;

import java.util.List;

public interface MenuService {
    List<Menu> getAllMenu(int userid);
}
