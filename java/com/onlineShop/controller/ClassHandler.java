package com.onlineShop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.onlineShop.entity.Classes;
import com.onlineShop.entity.Plan;
import com.onlineShop.entity.Profession;
import com.onlineShop.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/class")
public class ClassHandler {
	@Autowired
	private ClassService classService;
	@RequestMapping(value = "/classList")
	public String showClassList(@RequestParam(defaultValue="1",required=true,value="pageNo") int pageNo,
                                @RequestParam (defaultValue="4",required=true,value="pageSize") int pageSize,
                                Map<String,Object> map) {
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<Classes> classList = classService.selectAllClasses();
        PageInfo<Classes> pageInfo=new PageInfo<>(classList);
        map.put("classList", pageInfo);
//		List<Classes> classList = classService.selectAllClasses();
//		map.put("classList",classList);
		return "class-list";
	}

	@RequestMapping(value = "/toAddClass")
	public String toAddClass(Map map){
        List<Profession> professionList = classService.showProfessionList();
        List<Plan> planList = classService.showPlanList();
        map.put("professionList",professionList);
        map.put("planList",planList);
		return "class-list-add";
	}

	@RequestMapping(value = "/addClass",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String addClass(Classes clazz,String timeStart,String timeEnd,String professionName,String planName){
		clazz.setStartTime(Date.valueOf(timeStart));
		clazz.setEndTime(Date.valueOf(timeEnd));
        clazz.setProfessionId(Integer.valueOf(professionName));
        clazz.setPlanId(Integer.valueOf(planName));
		classService.insertClass(clazz);
        System.out.println(clazz);
		return "success";
	}

    @RequestMapping(value = "/selectByName")
    public String search(Map<String,Object> map,String className,@RequestParam(defaultValue="1",required=true,value="pageNo") int pageNo,
                         @RequestParam (defaultValue="4",required=true,value="pageSize") int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Classes> classList = classService.selectClassesByName(className);
        PageInfo<Classes> pageInfo=new PageInfo<>(classList);
        map.put("classList", pageInfo);
        return "class-list";
    }

    @RequestMapping(value = "/toEditClass/{classId}")
    public String findById(@PathVariable("classId") int id,Map map) {
        Classes classes = classService.findClassById(id);
        List<Profession> professionList = classService.showProfessionList();
        List<Plan> planList = classService.showPlanList();
        map.put("professionList",professionList);
        map.put("planList",planList);
        map.put("classList", classes);
        return "class-list-edit";
    }

    @RequestMapping(value = "/classEditReturn")
    @ResponseBody
    public String classEditReturn(Classes clazz,String timeStart,String timeEnd,String professionName,String planName) {
        clazz.setStartTime(Date.valueOf(timeStart));
        clazz.setEndTime(Date.valueOf(timeEnd));
        clazz.setProfessionId(Integer.valueOf(professionName));
        clazz.setPlanId(Integer.valueOf(planName));
        classService.updateClass(clazz);
        System.out.println(clazz);
        return "success";
    }

    @RequestMapping(value = "/classDelete/{classId}")
    public String classDelete(@RequestParam(defaultValue="1",required=true,value="pageNo") int pageNo,
                              @RequestParam (defaultValue="4",required=true,value="pageSize") int pageSize,
                              @PathVariable("classId") int id,Map map) {
        classService.deleteClass(id);
//        return "redirect:class-list";
        PageHelper.startPage(pageNo, pageSize);
        List<Classes> classList = classService.selectAllClasses();
        PageInfo<Classes> pageInfo=new PageInfo<>(classList);
        map.put("classList", pageInfo);
        return "class-list";
    }







}
