package com.onlineShop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.onlineShop.entity.Permissions;
import com.onlineShop.entity.Role;
import com.onlineShop.service.PermissionSeervice;
import com.onlineShop.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@SessionAttributes("roleList")
@RequestMapping("/permission")
public class RoleHandler {
    @Autowired
    private RoleService roleService;
    @Autowired
    private PermissionSeervice permissionSeervice;
    @RequestMapping("/role")
    public String toRoleList(Map map, @RequestParam(defaultValue="1",required=true,value="pageNo") int pageNo, @RequestParam(defaultValue="4",required=true,value="pageSize") int pageSize){
        PageHelper.startPage(pageNo, pageSize);
        List<Role> roleList = roleService.roleList();
        PageInfo<Role> pageInfo =new PageInfo<>(roleList);
        map.put("roleList",pageInfo);
        return "permission-role-list";
    }
    @RequestMapping("/toAddrole")
    public String toAddrole(){
        return "role-add";
    }
    @RequestMapping("/addrole")
    public String addrole(Role role){
      role.setCreatetime(new Date());
    roleService.addrole(role);
    return "redirect:permission-role-list";
    }
    @RequestMapping("/deleterole/{id}")
    public String deleterole(@PathVariable("id")Integer id){
        roleService.deleteRole(id);
        return "redirect:permission-role-list";
    }
    @RequestMapping("/toupdaterole/{id}")
    public String toUpdate(@PathVariable("id") Integer id, Map map){
        Role role = roleService.findByid(id);
        map.put("role",role);
        return "role-update";
    }
    @RequestMapping(value="/updaterole",produces = "text/html;charset=UTF-8")
    public String update( Role role){
        role.setId(role.getId());
        System.out.println(new Date());
        System.out.println(role);
        roleService.updateRole(role);
        return "redirect:/permission/role";
    }
    @RequestMapping("/tosetpermissions/{role_id}")
    public String toSetPermission(@PathVariable("role_id") Integer role_id ,Map map) {
        Role role1 = roleService.findByid(role_id);
        List<Permissions> permissionList = permissionSeervice.findAll();
        for (Permissions per:permissionList) {
            System.out.println(per);
        }
        map.put("role1", role1);
        map.put("permissionList", permissionList);
        map.put("role_id", role_id);
        return "role-allocatepermission";
    }
    @RequestMapping(value="/setpermissions",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String allocateRole(Integer role_id, Integer per_id){
        System.out.println("UserHandler.allocateRole"+role_id+"---"+per_id);
        roleService.allocatePermission(role_id,per_id);
        return "分配成功";
    }
}
