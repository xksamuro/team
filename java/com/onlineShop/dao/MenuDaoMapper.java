package com.onlineShop.dao;

import com.onlineShop.entity.Action;
import com.onlineShop.entity.Menu;

import java.util.List;

public interface MenuDaoMapper {
    List<Menu> selectMenuByUserId(int id);
    List<Action> selectActionByMenuId(int MenuId);
}
