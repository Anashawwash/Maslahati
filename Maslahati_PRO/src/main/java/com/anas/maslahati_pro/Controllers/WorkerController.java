package com.anas.maslahati_pro.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WorkerController {

    @GetMapping("/worker/dashboard")
    public String workerDashboard(Model model) {


        model.addAttribute("usersCount", 42);
        model.addAttribute("rating", 4.7);

        return "worker-dashboard";
    }

}
