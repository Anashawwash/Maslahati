package com.anas.maslahati_pro.Reopsitories;


import com.anas.maslahati_pro.Models.Review;
import com.anas.maslahati_pro.Models.ServiceTypes;
import com.anas.maslahati_pro.Models.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ServiceRepository extends CrudRepository<ServiceTypes,Long> {

    List<ServiceTypes> findAllByUser(User user);

    List<ServiceTypes> findAll();

    @Query("SELECT COALESCE(AVG(r.rating), 0) FROM Review r WHERE r.reviewed = :service")
    Double getAverageRate(@Param("service") ServiceTypes service);

    ServiceTypes findByid(Long id);

}
