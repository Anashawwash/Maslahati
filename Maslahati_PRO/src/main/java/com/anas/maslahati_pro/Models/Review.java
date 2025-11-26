package com.anas.maslahati_pro.Models;
import jakarta.persistence.*;

@Entity
@Table(name = "reviews")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    // Relationship to the User who wrote the review (e.g., Homeowner)
    @ManyToOne
    @JoinColumn(name = "reviewer_id", nullable = false)
    private User reviewer;


    // Relationship to the User who is being reviewed (e.g., Professional)
    @ManyToOne
    @JoinColumn(name = "reviewed_id")
    private ServiceTypes reviewed;

    private Integer rating;

    private String comment;
}
