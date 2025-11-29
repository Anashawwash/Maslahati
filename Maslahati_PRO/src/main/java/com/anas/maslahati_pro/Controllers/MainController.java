package com.anas.maslahati_pro.Controllers;


import com.anas.maslahati_pro.Models.LoginUser;
import com.anas.maslahati_pro.Models.Request;
import com.anas.maslahati_pro.Models.ServiceTypes;
import com.anas.maslahati_pro.Models.User;
import com.anas.maslahati_pro.Reopsitories.ServiceRepository;
import com.anas.maslahati_pro.Services.RequestServices;
import com.anas.maslahati_pro.Services.ServiceServices;
import com.anas.maslahati_pro.Services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {

    @Autowired
    UserService userServ;

    @Autowired
    ServiceServices serviceServ;

    @Autowired
    RequestServices  requestServ;



    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/")
    public String index(HttpSession session) {
        User user = (User) session.getAttribute("User");
        if (user != null && user.isCraftsman()) {
            return "redirect:/homeworker";
        }
        if (user != null && !user.isCraftsman()) {
            return "redirect:homeuser";
        }
        return "index";
    }


    @GetMapping("/signup")
    public String login(@RequestParam(required = false) String t,
                        @ModelAttribute("newUser") User newuser,
                        HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user != null && user.isCraftsman()) {
            return "redirect:/homeworker";
        }
        if (user != null && !user.isCraftsman()) {
            return "redirect:/homeuser";
        }
        if (t == null) {
            return "redirect:/#shoce";
        }
        if (t.equals("true")) {
            model.addAttribute("type", true);
            return "signup";
        }
        if (t.equals("false")) {
            model.addAttribute("type", false);
            return "signup";
        }
        return "index";
    }


    @PostMapping("/signup")
    public String signup(@Valid @ModelAttribute("newUser") User user, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "signup";
        } else {
            if (userServ.NewUserVal(result, user) != user) {
                return "signup";
            } else {
                session.setAttribute("User", user);
                if (user.isCraftsman()) {
                    return "redirect:/homeworker";
                } else {
                    return "redirect:/homeuser";
                }
            }
        }
    }


    @GetMapping("/homeworker")
    public String homeworker(HttpSession session ,Model model) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            return "redirect:/";
        }
        if (user != null && !user.isCraftsman()) {
            return "redirect:/homeuser";
        }
        model.addAttribute("worker", user);
        int many = serviceServ.findAllByUser(user).size();
        model.addAttribute("many", many);
        return "worker_dashboard";
    }


    @GetMapping("/homeuser")
    public String homeuser(HttpSession session,Model model) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            return "redirect:/";
        }
        if (user != null && user.isCraftsman()) {
            return "redirect:/homeworker";
        }
        model.addAttribute("User", user);
        model.addAttribute("many", serviceServ.findAll().size());
        model.addAttribute("service", serviceServ.findAll());
        return "userHome";
    }


    @GetMapping("/login")
    public String login(HttpSession session, @ModelAttribute("newUser") LoginUser newuser) {
        User user = (User) session.getAttribute("user");
        if (user != null && user.isCraftsman()) {
            return "redirect:/homeworker";
        }
        if (user != null && !user.isCraftsman()) {
            return "redirect:/homeuser";
        }
        return "login";
    }


    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newUser") LoginUser newuser, BindingResult result
            , HttpSession session) {
        if (result.hasErrors()) {
            return "login";
        } else {
            User user = userServ.LoginVal(result, newuser);
            if (user == null) {
                return "login";
            } else {
                session.setAttribute("User", user);
                if (user.isCraftsman()) {
                    return "redirect:/homeworker";
                }
                return "redirect:/homeuser";
            }

        }

    }



    @GetMapping("/addservice")
    public String addservice(HttpSession session ,Model model,@ModelAttribute("service")ServiceTypes servecic ) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            return "redirect:/";
        }
        if (user != null  && !user.isCraftsman()) {
            return "redirect:/homeuser";
        }
        model.addAttribute("worker", user);
        return "addService";
    }


    @PostMapping("/addservice")
    public String addservice(@Valid @ModelAttribute("service") ServiceTypes service, BindingResult result){
        if (result.hasErrors()) {
            return "addService";
        }
        else {
            serviceServ.saveService(service);
            return "redirect:/homeworker";
        }
    }


    @GetMapping("/booking/{id}")
    public String booking(@PathVariable("id") Long id, HttpSession session , Model model , @ModelAttribute("bookingForm")Request request) {
        User user = (User) session.getAttribute("User");
        if (user != null && user.isCraftsman()) {
            return "redirect:/homeworker";
        }
        if (user == null ) {
            return "redirect:/";
        }
        model.addAttribute("serv",serviceServ.findById(id));
        model.addAttribute("User",user);
        return "Booking";
    }

    @PostMapping("/booking")
    public String Booking(@Valid @ModelAttribute("booking") Request request,BindingResult result,HttpSession session) {
        if (result.hasErrors()) {
            return "Booking";
        }
        else {
            requestServ.saveRequest(request);
            return "redirect:/homeuser";
        }
    }
}
