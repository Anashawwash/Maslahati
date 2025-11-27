package com.anas.maslahati_pro.Controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeUser {


    @GetMapping("/userhome")
    public String username(@RequestParam(required = false)Integer rate,
                           @RequestParam(required = false)String service) {
        System.out.println("______---------------____________-----------_"+rate);
       return "userHome";


    }


    @GetMapping("/love")
    public String love(){
        return "test";
    }

}
