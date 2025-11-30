package com.anas.maslahati_pro.Models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "Users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Username
    @Column(unique = true)
    @NotEmpty(message = "Username is required")
    @Size(min = 3, max = 30, message = "Username must be between 3 and 30 characters")
    private String userName;

    // Email
    @Column(unique = true)
    @NotBlank(message = "Email is required")
    @Email(message = "Email must be valid")
    private String email;



    @NotEmpty(message="Password is required!")
    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
    private String password;

    // Phone Number
    @Column(unique = true)
    @NotEmpty(message = "Phone number is required!")
    @Size(min = 10, max = 10, message = "Phone number must be exactly 10 digits")
    private String phoneNumber;

    // Avatar (Default)
    private String avatar = "https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg";

    // Location
    @NotEmpty(message = "Location is required!")
    private String location;


    // Confirm Password (Not saved in DB)
    @Transient
    @NotEmpty(message = "Confirm password is required!")
    @Size(min = 8, max = 128, message = "Confirm password must be between 8 and 128 characters")
    private String confirmPassword;

    // Role: USER or WORKER
    private boolean craftsman = false;

    // Relations
    @OneToMany(mappedBy = "reviewer", cascade = CascadeType.ALL)
    private List<Review> reviews = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Request> requests = new ArrayList<>();



//  One user can have More than one service
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<ServiceTypes> services = new ArrayList<>();


    public Date getUpdatedAt() {
        return updatedAt;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

//    -----------------Starting the methods _____________----------____________--------________
    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

    // Getters and Setters

    public Long getId() {
        return id;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    public List<Request> getRequests() {
        return requests;
    }

    public void setRequests(List<Request> requests) {
        this.requests = requests;
    }

    public List<ServiceTypes> getServices() {
        return services;
    }

    public void setServices(List<ServiceTypes> services) {
        this.services = services;
    }

    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public String getUserName() { return userName; }

    public void setUserName(String userName) { this.userName = userName; }

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }

    public void setPassword(String password) { this.password = password; }

    public String getPhoneNumber() { return phoneNumber; }

    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getAvatar() { return avatar; }

    public void setAvatar(String avatar) { this.avatar = avatar; }

    public String getLocation() { return location; }

    public void setLocation(String location) { this.location = location; }

    public String getConfirmPassword() { return confirmPassword; }

    public void setConfirmPassword(String confirmPassword) { this.confirmPassword = confirmPassword; }

    public boolean isCraftsman() { return craftsman; }

    public void setCraftsman(boolean craftsman) { this.craftsman = craftsman; }
}
