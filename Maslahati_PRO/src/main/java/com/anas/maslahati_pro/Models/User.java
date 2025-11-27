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

    @Column(unique = true)
    @NotEmpty(message = "Username is required")
    @Size(min = 3, max = 30, message = "Username must be between 3 and 30 characters")
    private String userName;

    @NotBlank(message = "Email is required")
    @Email(message = "The email should be valid")
    private String email;

    @NotEmpty(message = "Password is required!")
    @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters")
    private String password;

    @NotEmpty(message = "Phone is required!")
    @Size(min = 10, max = 10, message = "Phone must be exactly 10 digits")
    private String phone;

    @NotEmpty(message = "Location is required!")
    private String location;

    @Transient
    @NotEmpty(message = "Confirm Password is required!")
    @Size(min = 8, max = 128, message = "Confirm Password must be between 8 and 128 characters")
    private String confirmPas;

    private boolean craftsman;

    // ---------------- Relations --------------------

    @OneToMany(mappedBy = "reviewer", cascade = CascadeType.ALL)
    private List<Review> reviews = new ArrayList<>();


    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<ServiceTypes> services = new ArrayList<>();

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    // ---------------- Lifecycle --------------------

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

    // ---------------- Getters & Setters ----------------

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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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
