package com.anas.maslahati_pro.Models;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "Users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true )
    @NotEmpty(message = "Username name is required")
    @Size(min = 3 , max = 30,message = "Username must be between 3 and 30 characters")
    private String userName;

    @Column(unique = true )
    @NotBlank(message = "Username name is required")
    @Email(message = "the email should be valid")
    private String email;

    @NotEmpty(message="Password is required!")
    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
    private String password;

    @NotEmpty(message="PhoneNumber  is required!")
    @Size(min=10, max=10, message="Password must be between 8 and 128 characters")
    private String phoneNumber;
//user avatar
    private String avatar ="https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg";



    @NotEmpty(message="Location is required!")
    private String location;

    @Transient
    @NotEmpty(message="Confirm Password is required!")
    @Size(min=8, max=128, message="Confirm Password must be between 8 and 128 characters")
    private String confirmPas;

    private boolean craftsman = false;


//  One user can review More than one services
    @OneToMany(mappedBy = "reviewer", cascade = CascadeType.ALL)
    private List<Review> reviews = new ArrayList<>();

//    user can have more than one request
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Request> requests = new ArrayList<>();



//  One user can have More than one service
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<ServiceTypes> services = new ArrayList<>();






    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

//    -----------------Starting the methods _____________----------____________--------________
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getConfirmPas() {
        return confirmPas;
    }

    public void setConfirmPas(String confirmPas) {
        this.confirmPas = confirmPas;
    }

    public boolean isCraftsman() {
        return craftsman;
    }

    public void setCraftsman(boolean craftsman) {
        this.craftsman = craftsman;
    }
}