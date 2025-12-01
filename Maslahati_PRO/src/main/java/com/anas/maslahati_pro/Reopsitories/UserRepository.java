package com.anas.maslahati_pro.Reopsitories;


import com.anas.maslahati_pro.Models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RestController;

@RestController
public interface UserRepository extends JpaRepository<User,Long>{

    User findByEmail(String email);
    Boolean findAllByUserName(String userName);

    User findByPhoneNumber(String phoneNumber);

    @Query("SELECT COALESCE(AVG(r.rating), 0) " +
            "FROM Review r " +
            "WHERE r.reviewed.user = :user")
    Double getAverageRate(@Param("user") User user);

}
