package com.anas.maslahati_pro.Services;

import com.anas.maslahati_pro.Models.LoginUser;
import com.anas.maslahati_pro.Models.User;
import com.anas.maslahati_pro.Reopsitories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepo;

    // ------------------ Signup ------------------
    public User NewUserVal(BindingResult result, User user){
        if (userRepo.findByEmail(user.getEmail()) != null){
            result.rejectValue("email","Error","the Email or UserName is taken");
            result.rejectValue("userName","Error","the Email or UserName is taken");
            return null;
        }
        if(!user.getPassword().equals(user.getConfirmPassword())){
            result.rejectValue("confirmPassword","Error","the Password did not match");
            return null;
        }
        if (userRepo.findByPhoneNumber(user.getPhoneNumber()) != null){
            result.rejectValue("phoneNumber","Error","the Phone number is already taken");
            return null;
        }
        try{
            String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
            user.setPassword(hashed);
            userRepo.save(user);
        } catch (DataIntegrityViolationException e) {
            result.rejectValue("userName","Error","the Email or UserName is taken");
            result.rejectValue("email","Error","the Email or UserName is taken");
            return null;
        }
        return user;
    }

    // ------------------ Login ------------------

    public User LoginVal(BindingResult result, LoginUser loginUser){
        User user = userRepo.findByEmail(loginUser.getLoginEmail());
        if (user == null){
            result.rejectValue("loginEmail","Error","this Email is not exist");
            return null;
        }
        else{
            if (!BCrypt.checkpw(loginUser.getConfirm(), user.getPassword())) {
                result.rejectValue("confirm","Error","the Password or Email are invalid ");
                return null;
            }
        }
        return user;
    }




}
