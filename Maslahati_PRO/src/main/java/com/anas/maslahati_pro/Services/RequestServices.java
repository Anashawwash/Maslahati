package com.anas.maslahati_pro.Services;

import com.anas.maslahati_pro.Models.Request;
import com.anas.maslahati_pro.Reopsitories.RequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RequestServices {

    @Autowired
    private RequestRepository requestRepo;

    public void saveRequest(Request requset){
        requestRepo.save(requset);
    }
}
