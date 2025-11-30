package com.anas.maslahati_pro.Controllers;


import com.anas.maslahati_pro.Models.*;
import com.anas.maslahati_pro.Reopsitories.ServiceRepository;
import com.anas.maslahati_pro.Services.RequestServices;
import com.anas.maslahati_pro.Services.ReviewServices;
import com.anas.maslahati_pro.Services.ServiceServices;
import com.anas.maslahati_pro.Services.UserService;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    UserService userServ;

    @Autowired
    ServiceServices serviceServ;

    @Autowired
    RequestServices requestServ;

    @Autowired
    ReviewServices reviewServ;


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
    public String homeworker(HttpSession session, Model model) {
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
    public String homeuser(HttpSession session, Model model) {
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
    public String addservice(HttpSession session, Model model, @ModelAttribute("service") ServiceTypes servecic) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            return "redirect:/";
        }
        if (user != null && !user.isCraftsman()) {
            return "redirect:/homeuser";
        }
        model.addAttribute("worker", user);
        return "addService";
    }


    @PostMapping("/addservice")
    public String addservice(@Valid @ModelAttribute("service") ServiceTypes service, BindingResult result) {
        if (result.hasErrors()) {
            return "addService";
        } else {
            serviceServ.saveService(service);
            return "redirect:/homeworker";
        }
    }


    @GetMapping("/booking/{id}")
    public String booking(@PathVariable("id") Long id, HttpSession session, Model model, @ModelAttribute("bookingForm") Request request) {
        User user = (User) session.getAttribute("User");
        if (user != null && user.isCraftsman()) {
            return "redirect:/homeworker";
        }
        if (user == null) {
            return "redirect:/";
        }
        ServiceTypes service = serviceServ.findById(id);
        model.addAttribute("serv", service);
        model.addAttribute("User", user);
        model.addAttribute("review", reviewServ.findAllReviewsByReviewed(service));
        return "Booking";
    }

    @PostMapping("/booking")
    public String Booking(@Valid @ModelAttribute("booking") Request request, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "Booking";
        } else {
            requestServ.saveRequest(request);
            return "redirect:/homeuser";
        }
    }


    @GetMapping("/servreq")
    public String servreq(HttpSession session, Model model) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            return "redirect:/";
        }
        if (!user.isCraftsman()) {
            return "redirect:/homeuser";
        }
        List<Request> r = requestServ.findAll();
        requestServ.updateRequests(r);
        model.addAttribute("User", user);
        model.addAttribute("service", serviceServ.findAllByUser(user));
        return "ServReq";
    }


    @GetMapping("/requests/accept/{id}")
    public String AcceptRequest(@PathVariable("id") Long id, HttpSession session, Model model) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            return "redirect:/";
        }
        if (!user.isCraftsman()) {
            return "redirect:/homeuser";
        }
        System.out.println("________-------------------________________");
        Request request = requestServ.findByID(id);
        request.setInProgress(true);
        requestServ.saveRequest(request);
        return "redirect:/servreq";
    }


    @GetMapping("/myrequests")
    public String myrequests(HttpSession session, Model model) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            return "redirect:/";
        }
        if (user.isCraftsman()) {
            return "redirect:/homeworker";
        }
        model.addAttribute("User", user);
        model.addAttribute("requests", requestServ.findAllByUserId(user.getId()));
        return "MyRequest";
    }


    @GetMapping("/requests/cancel/{id}")
    public String cancelRequest(@PathVariable("id") Long id, HttpSession session, Model model) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            return "redirect:/";
        }
        if (user.isCraftsman()) {
            return "redirect:/homeworker";
        }
        requestServ.deleteRequest(id);
        return "redirect:/myrequests";
    }

    @GetMapping("/requests/add/review/{id}")
    public String reviewRequest(@ModelAttribute("newReview") Review review, @PathVariable("id") Long id, HttpSession session, Model model) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            return "redirect:/";
        }
        if (user.isCraftsman()) {
            return "redirect:/homeworker";
        }
        model.addAttribute("User", user);
        model.addAttribute("request", requestServ.findByID(id));
        return "ReviewPage";
    }

    @PostMapping("/reviews/save/{id}")
    public String saveReview(@PathVariable("id") Long id, @Valid @ModelAttribute("newReview") Review review, BindingResult result, HttpSession session, Model model) {
        User user = (User) session.getAttribute("User");
        if (result.hasErrors()) {
            return "ReviewPage";
        }
        Request request = requestServ.findByID(id);
        review.setId(null);
        ServiceTypes service = review.getReviewed();
        serviceServ.updateAverageRate(service);
        request.setDone(true);
        service.setDoneOrders(1);
        serviceServ.saveService(service);
        request.setInProgress(false);
        reviewServ.saveReview(review);
        return "redirect:/homeuser";
    }


    @GetMapping("/profile/user")
    public String profileUser(HttpSession session, Model model) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            return "redirect:/"; // إعادة توجيه إذا لم يكن مسجل الدخول
        }
        if (user.isCraftsman()) {
            return "redirect:/profile/worker"; // إعادة توجيه للصنايعي إذا كان هو من سجل الدخول
        }
        model.addAttribute("user", user); // إرسال بيانات اليوزر للصفحة
        return "user_profile"; // اسم صفحة JSP أو HTML الخاصة بالبروفايل
    }

    @GetMapping("/profile/worker")
    public String profileWorker(HttpSession session, Model model) {
        User user = (User) session.getAttribute("User");
        if (user == null) {
            return "redirect:/"; // إعادة توجيه إذا لم يكن مسجل الدخول
        }
        if (!user.isCraftsman()) {
            return "redirect:/profile/user"; // إعادة توجيه للـ User العادي
        }
        model.addAttribute("worker", user); // إرسال بيانات الصنايعي
        model.addAttribute("services", serviceServ.findAllByUser(user)); // إرسال خدماته
        return "worker_user_prufile"; // اسم صفحة JSP أو HTML الخاصة بالبروفايل
    }
}
