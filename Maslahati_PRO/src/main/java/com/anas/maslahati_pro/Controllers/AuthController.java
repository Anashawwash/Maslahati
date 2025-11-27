package com.anas.maslahati_pro.Controllers;

import com.anas.maslahati_pro.Models.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {

    @GetMapping("/login")
    public String login(HttpSession session){
        User user = (User) session.getAttribute("user");
        if  (user != null && user.isCraftsman()) {
            return "redirect:/crafthome";
        }
        if (user != null && !user.isCraftsman()) {
            return "redirect:/userhome";
        }
        return "login";
    }

    @GetMapping("/signup")
    public String signup(HttpSession session){
        User user = (User) session.getAttribute("user");
        if  (user != null && user.isCraftsman()) {
            return "redirect:/crafthome";
        }
        if (user != null && !user.isCraftsman()) {
            return "redirect:/userhome";
        }
       return "signup";
    }
}