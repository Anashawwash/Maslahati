package com.anas.maslahati_pro.Controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeUser {


    @GetMapping("/userhome")
    public String username(){
       return "userHome.jsp";
    }



}
