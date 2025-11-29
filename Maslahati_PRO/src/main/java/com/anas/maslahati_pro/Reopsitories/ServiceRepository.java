package com.anas.maslahati_pro.Reopsitories;


import com.anas.maslahati_pro.Models.ServiceTypes;
import com.anas.maslahati_pro.Models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ServiceRepository extends CrudRepository<ServiceTypes,String> {


    List<ServiceTypes> findAllByUser(User user);

    List<ServiceTypes> findAll();
}
