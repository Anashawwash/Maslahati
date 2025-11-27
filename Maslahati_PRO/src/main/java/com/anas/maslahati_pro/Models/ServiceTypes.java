package com.anas.maslahati_pro.Models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "ServiceType")
public class ServiceTypes{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @NotEmpty(message = "This should not left blank")
    private String name;

    @NotEmpty
    private String experienceYear= "0";

    @NotEmpty(message = "This should not left blank")
    @Size(min = 5,message = "this should by at least 5 character ")
    private String description;

    @ElementCollection
    @CollectionTable(name = "service_images", joinColumns = @JoinColumn(name = "service_id"))
    @Column(name = "image_url")
    private List<String> imageUrls = new ArrayList<>();

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;


//    more than one service will be related for more than one user
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User  user;


//    each service will have more than one request
    @OneToMany(mappedBy = "Service",cascade = CascadeType.ALL)
    private List<Request> requests = new ArrayList<>();



//each post or service would have more than one review
    @OneToMany(mappedBy = "reviewed",cascade = CascadeType.ALL)
    private List<Review> reviews =  new ArrayList<>();





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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Boolean getActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }

    private Boolean isActive = true;




}

