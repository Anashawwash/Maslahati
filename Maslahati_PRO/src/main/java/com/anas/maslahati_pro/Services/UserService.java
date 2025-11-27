package com.anas.maslahati_pro.Services;

import com.anas.maslahati_pro.Models.User;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    private List<User> users = new ArrayList<>();

    // ------------------ Signup ------------------
    public String registerUser(User user) {
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            return "Passwords do not match!";
        }

        for (User u : users) {
            if (u.getEmail().equalsIgnoreCase(user.getEmail())) {
                return "Email already exists!";
            }
        }

        users.add(user);

        return "SUCCESS";
    }

    // ------------------ Login ------------------
    public User loginUser(String email, String password, String role) {
        for (User u : users) {
            if (u.getEmail().equalsIgnoreCase(email)
                    && u.getPassword().equals(password)) {

                boolean isWorker = "WORKER".equalsIgnoreCase(role);

                if (isWorker && u.isCraftsman()) {
                    return u; // Worker
                }

                if (!isWorker && !u.isCraftsman()) {
                    return u; // User
                }
            }
        }

        return null;
    }

    public List<User> getAllUsers() {
        return users;
    }
}
