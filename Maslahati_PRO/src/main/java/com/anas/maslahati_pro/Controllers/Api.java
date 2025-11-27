package com.anas.maslahati_pro.Controllers;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
@RequestMapping("/api")
public class Api {

    @GetMapping("/try")
    public HashMap<String, String> greeting(@RequestParam String name) {
        HashMap<String, String> response = new HashMap<>();
        response.put("status", "success" + name + "!!");
        return response;
    }

}
