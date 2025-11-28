package com.anas.maslahati_pro.Reopsitories;


import com.anas.maslahati_pro.Models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RestController;

@RestController
public interface UserRepository extends JpaRepository<User,Long>{

    User findByEmail(String email);
    Boolean findAllByUserName(String userName);

    User findByPhoneNumber(String phoneNumber);

}
