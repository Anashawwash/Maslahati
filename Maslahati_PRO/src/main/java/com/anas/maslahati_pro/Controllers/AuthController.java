package com.anas.maslahati_pro.Controllers;

import com.anas.maslahati_pro.Models.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@SessionAttributes({"user", "worker"})
public class AuthController {

    private Map<String, User> users = new HashMap<>();

    // ------------------- LOGIN -----------------------
    @GetMapping("/login")
    public String showLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        @RequestParam String role,
                        Model model) {

        User user = users.get(email);

        if (user == null || !user.getPassword().equals(password) ||
                (role.equalsIgnoreCase("WORKER") != user.isCraftsman())) {
            model.addAttribute("error", "Invalid email or password!");
            return "login";
        }

        if (user.isCraftsman()) {
            model.addAttribute("worker", user);
            model.addAttribute("rating", 0);
            model.addAttribute("usersCount", 0);
            model.addAttribute("completedOrders", 0);
            return "worker-dashboard";
        } else {
            model.addAttribute("user", user);
            return "userHome";
        }
    }

    // ------------------- SIGNUP -----------------------
    @GetMapping("/signup")
    public String showSignup() {
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(@RequestParam String username,
                         @RequestParam String email,
                         @RequestParam String phone,
                         @RequestParam String location,
                         @RequestParam String password,
                         @RequestParam String confirmPassword,
                         @RequestParam String role,
                         Model model) {

        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match!");
            return "signup";
        }

        if (users.containsKey(email)) {
            model.addAttribute("error", "Email already exists!");
            return "signup";
        }

        User newUser = new User();
        newUser.setUserName(username);
        newUser.setEmail(email);
        newUser.setPhone(phone);
        newUser.setLocation(location);
        newUser.setPassword(password);
        newUser.setCraftsman(role.equalsIgnoreCase("WORKER"));

        users.put(email, newUser);

        if (newUser.isCraftsman()) {
            model.addAttribute("worker", newUser);
            model.addAttribute("rating", 0);
            model.addAttribute("usersCount", 0);
            model.addAttribute("completedOrders", 0);
            return "worker-dashboard";
        } else {
            model.addAttribute("user", newUser);
            return "userHome";
        }
    }

    // ------------------- DASHBOARDS -----------------------
    @GetMapping("/worker-dashboard")
    public String workerDashboard() {
        return "worker-dashboard";
    }

    @GetMapping("/userHome")
    public String userHome() {
        return "userHome";
    }
}
