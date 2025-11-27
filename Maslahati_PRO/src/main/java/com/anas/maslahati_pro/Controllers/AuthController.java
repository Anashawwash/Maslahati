package com.anas.maslahati_pro.Controllers;

import com.anas.maslahati_pro.Models.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    @GetMapping("/login")
    public String showLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        @RequestParam String role,
                        Model model) {

        boolean validWorker = email.equals("worker@gmail.com") && password.equals("1234");
        boolean validUser = email.equals("user@gmail.com") && password.equals("1234");

        if (!validWorker && !validUser) {
            model.addAttribute("error", "Invalid email or password!");
            return "login";
        }

        if ("WORKER".equalsIgnoreCase(role)) {
            User worker = new User();
            worker.setEmail(email);

            model.addAttribute("worker", worker);
            model.addAttribute("rating", 4.7);
            model.addAttribute("usersCount", 42);
            model.addAttribute("completedOrders", 128);

            return "worker-dashboard";
        }

        if ("USER".equalsIgnoreCase(role)) {
            User user = new User();
            user.setEmail(email);

            model.addAttribute("user", user);
            return "user-dashboard";
        }

        return "login";
    }

    @GetMapping("/signup")
    public String showSignup() {
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(@RequestParam String name,
                         @RequestParam String email,
                         @RequestParam String password,
                         @RequestParam(required = false) String role,
                         Model model) {

        User newUser = new User();
        newUser.setEmail(email);



            model.addAttribute("worker", newUser);
            model.addAttribute("rating", 0);
            model.addAttribute("usersCount", 0);
            model.addAttribute("completedOrders", 0);

            return "worker-dashboard";
        }


}
