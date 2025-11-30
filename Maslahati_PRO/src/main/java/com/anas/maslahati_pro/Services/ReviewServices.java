package com.anas.maslahati_pro.Services;


import com.anas.maslahati_pro.Models.Review;
import com.anas.maslahati_pro.Models.ServiceTypes;
import com.anas.maslahati_pro.Reopsitories.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServices {

    @Autowired
    private ReviewRepository reviewRepo;


    public void saveReview(Review review) {
        reviewRepo.save(review);
    }

    public List<Review> findAllReviewsByReviewed(ServiceTypes serviceType) {
        return reviewRepo.findAllReviewsByReviewed(serviceType);
    }

}
