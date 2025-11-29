package com.anas.maslahati_pro.Services;


import com.anas.maslahati_pro.Models.Request;
import com.anas.maslahati_pro.Models.Review;
import com.anas.maslahati_pro.Models.ServiceTypes;
import com.anas.maslahati_pro.Models.User;
import com.anas.maslahati_pro.Reopsitories.ReviewRepository;
import com.anas.maslahati_pro.Reopsitories.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceServices {
    @Autowired
    ServiceRepository serviceRepo;

    @Autowired
    ReviewRepository reviewRepo;

    public void saveService(ServiceTypes service){
        serviceRepo.save(service);
    }


    public List<ServiceTypes> findAllByUser(User user){
        return serviceRepo.findAllByUser(user);
    }

    public List<ServiceTypes> findAll(){
        return serviceRepo.findAll();
    }

    public ServiceTypes findById(Long id){
        return serviceRepo.findByid(id);
    }

    public void getTheRangeRate(ServiceTypes service , int i){
        List<Review> reviews = reviewRepo.findAllReviewsByReviewed(service);
        if (reviews.isEmpty()) {
            service.setAvareg(i); // or null, depending on your logic
        } else {
            int totalRate = 0;
            for (Review review : reviews) {
                totalRate += review.getRating();
            }
            int average = totalRate / reviews.size();
            service.setAvareg(average);
        }
        serviceRepo.save(service);
    }

}
