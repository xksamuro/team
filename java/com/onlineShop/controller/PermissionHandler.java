package com.onlineShop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.onlineShop.entity.Permissions;
import com.onlineShop.service.PermissionSeervice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class PermissionHandler {
    @Autowired
    private PermissionSeervice permissionSeervice;
    @RequestMapping("/permissionlist")
    public String toRoleList(Map map, @RequestParam(defaultValue="1",required=true,value="pageNo") int pageNo, @RequestParam(defaultValue="4",required=true,value="pageSize") int pageSize){
        PageHelper.startPage(pageNo, pageSize);
        List<Permissions> permissionList = permissionSeervice.findAll();
        PageInfo<Permissions> pageInfo =new PageInfo<>(permissionList);
        map.put("permissionList",pageInfo);
        return "permission-list";
    }
    @RequestMapping("/searchpermission")
    public String search(String name,Map map){
        List<Permissions> permissionList = permissionSeervice.findByName(name);
        PageInfo<Permissions> pageInfo =new PageInfo<>(permissionList);
        map.put("permissionList",pageInfo);
        return "permission-list";
    }
}
