package com.anas.maslahati_pro.Services;


import com.anas.maslahati_pro.Models.ServiceTypes;
import com.anas.maslahati_pro.Models.User;
import com.anas.maslahati_pro.Reopsitories.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceServices {
    @Autowired
    ServiceRepository serviceRepo;

    public void saveService(ServiceTypes service){
        serviceRepo.save(service);
    }


    public List<ServiceTypes> findAllByUser(User user){
        return serviceRepo.findAllByUser(user);
    }

    public List<ServiceTypes> findAll(){
        return serviceRepo.findAll();
    }
}
