package com.onlineShop.service;

import com.onlineShop.dao.MenuDaoMapper;
import com.onlineShop.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuDaoMapper menuDaoMapper;

    @Override
    public List<Menu> getAllMenu(int userid) {
        return menuDaoMapper.selectMenuByUserId(userid);
    }
}
