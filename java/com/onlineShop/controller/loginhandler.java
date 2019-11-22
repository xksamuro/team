package com.onlineShop.controller;


import com.onlineShop.entity.Menu;
import com.onlineShop.entity.User;
import com.onlineShop.service.MenuService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;
import java.util.Map;

@Controller
@SessionAttributes("menuList")
public class loginhandler {
    @Autowired
    private MenuService menuService;
    @RequestMapping("/")
    public String toLogin(){
        return "login";
    }
    @RequestMapping("/login")
    public String login(Map map, String username, String password) {
        Subject currentUser = SecurityUtils.getSubject();
        if (!currentUser.isAuthenticated()) {
            // 把用户名和密码封装为 UsernamePasswordToken 对象
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            // rememberme
//            token.setRememberMe(true);
            try {
                System.out.println("1. " + token.hashCode());
                // 执行登录.
                currentUser.login(token);
                Session shiroSession = currentUser.getSession();
                User user = (User) currentUser.getPrincipal();
                shiroSession.setAttribute("user",user);
                List<Menu> menuList = menuService.getAllMenu(user.getId());
                map.put("menuList",menuList);
                System.out.println(user);
            }
            // ... catch more exceptions here (maybe custom ones specific to your application?
            // 所有认证时异常的父类.
            catch (AuthenticationException ae) {
                //unexpected condition?  error?
                System.out.println("登录失败: " + ae.getMessage());
                return "login";
            }
        }
        return "index";
    }
}
