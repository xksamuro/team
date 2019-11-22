package com.onlineShop.controller;

import com.onlineShop.entity.Profession;
import com.onlineShop.service.ProfessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/class")
public class ProfessionHandler {
    @Autowired
    private ProfessionService professionService;

    @RequestMapping(value = "/classProfession",method = RequestMethod.GET)
    public String selectAllProfessions(Map<String,Object> map){
        List<Profession> professionList=professionService.selectAllProfessions();
        map.put("professionList",professionList);
        return "class-profession";
    }
}

