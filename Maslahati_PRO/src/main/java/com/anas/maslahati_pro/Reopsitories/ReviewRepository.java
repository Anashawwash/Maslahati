package com.anas.maslahati_pro.Reopsitories;


import com.anas.maslahati_pro.Models.Review;
import com.anas.maslahati_pro.Models.ServiceTypes;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository  extends CrudRepository<Review,Long> {
    List<Review> findByRating(Integer rating);

    List<Review> findAllReviewsByReviewed(ServiceTypes serviceType);


}
