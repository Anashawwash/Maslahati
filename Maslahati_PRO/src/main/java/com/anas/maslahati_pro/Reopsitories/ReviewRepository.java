package com.anas.maslahati_pro.Reopsitories;


import com.anas.maslahati_pro.Models.Review;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository  extends CrudRepository<Review,String> {
    List<Review> findByRating(Integer rating);




}
