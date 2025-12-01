package com.anas.maslahati_pro.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

//    // ------------------ Login ------------------
//    @GetMapping("/login")
//    public String showLoginPage() {
//        return "login";
//    }
//
//    @PostMapping("/login")
//    public String loginUser(
//            @RequestParam String email,
//            @RequestParam String password,
//            @RequestParam String role,
//            Model model
//    ) {
//        boolean validWorker = email.equals("worker@gmail.com") && password.equals("1234");
//        boolean validUser = email.equals("user@gmail.com") && password.equals("1234");
//
//        if (!validWorker && !validUser) {
//            model.addAttribute("error", "Invalid email or password!");
//            return "login";
//        }
//
//        // Worker
//        if ("WORKER".equalsIgnoreCase(role)) {
//            User worker = new User();
//            worker.setUserName("Worker Example");
//            worker.setEmail(email);
//            worker.setCraftsman(true);
//
//            model.addAttribute("worker", worker);
//            model.addAttribute("rating", 4.7);
//            model.addAttribute("usersCount", 42);
//            model.addAttribute("completedOrders", 128);
//
//            return "worker_dashboard";
//        }
//
//        // User
//        if ("USER".equalsIgnoreCase(role)) {
//            User user = new User();
//            user.setUserName("User Example");
//            user.setEmail(email);
//            user.setCraftsman(false);
//
//            model.addAttribute("user", user);
//            return "worker_dashboard";
//        }
//
//        return "login";
//    }
//
//    // ------------------ Signup ------------------
//    @GetMapping("/signup")
//    public String showSignupPage() {
//        return "signup";
//    }
//
//    @PostMapping("/signup")
//    public String signupUser(
//            @RequestParam String userName,
//            @RequestParam String email,
//            @RequestParam String phoneNumber,
//            @RequestParam String location,
//            @RequestParam String password,
//            @RequestParam String confirmPassword,
//            @RequestParam String role,
//            Model model
//    ) {
//        if (!password.equals(confirmPassword)) {
//            model.addAttribute("error", "Passwords do not match!");
//            return "signup";
//        }
//
//        User newUser = new User();
//        newUser.setUserName(userName);
//        newUser.setEmail(email);
//        newUser.setPhoneNumber(phoneNumber);
//        newUser.setLocation(location);
//        newUser.setPassword(password);
//
//        boolean isWorker = "WORKER".equalsIgnoreCase(role);
//        newUser.setCraftsman(isWorker);
//
//        if (isWorker) {
//            model.addAttribute("worker", newUser);
//            model.addAttribute("rating", 0);
//            model.addAttribute("usersCount", 0);
//            model.addAttribute("completedOrders", 0);
//            return "worker_dashboard";
//        } else {
//            model.addAttribute("user", newUser);
//            return "worker_dashboard";
//        }
//    }
//
//    // ------------------ Extra Pages ------------------
//    @GetMapping("/homepage")
//    public String homepage() {
//        return "index";
//    }
//
//    @GetMapping("/user/profile")
//    public String profile() {
//        return "user_profile";
//    }
//
//    @GetMapping("/register/choice")
//    public String choice() {
//        return "register-choice";
//    }






//    i heat this file you
//    I love this project

//    i heat this file you
//    I love this project

//    i heat this file you
//    I love this project

}
