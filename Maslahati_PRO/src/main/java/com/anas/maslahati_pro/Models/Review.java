package com.anas.maslahati_pro.Models;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "reviews")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    // Relationship to the User who wrote the review
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User reviewer;


    // Relationship to the Service that being reviewed (e.g., Professional)
    @ManyToOne
    @JoinColumn(name = "reviewed_id")
    private ServiceTypes reviewed;

    @NotNull(message = "Rating is required")
    @Min(value = 1, message = "Rating must be at least 1")
    @Max(value = 5, message = "Rating cannot be more than 5")
    private Integer rating;


    @NotEmpty(message = "Comment is required!")
    private String comment;


//    ______---------------____________Methods___________




    public User getReviewer() {
        return reviewer;
    }

    public void setReviewer(User reviewer) {
        this.reviewer = reviewer;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }



    public ServiceTypes getReviewed() {
        return reviewed;
    }

    public void setReviewed(ServiceTypes reviewed) {
        this.reviewed = reviewed;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
