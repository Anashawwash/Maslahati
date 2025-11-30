package com.anas.maslahati_pro.Services;

import com.anas.maslahati_pro.Models.Request;
import com.anas.maslahati_pro.Models.ServiceTypes;
import com.anas.maslahati_pro.Reopsitories.RequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Service
public class RequestServices {

    @Autowired
    private RequestRepository requestRepo;

    public void saveRequest(Request requset){
        requestRepo.save(requset);
    }


    public void checkDate(Request request) {
        // Convert java.util.Date to LocalDateTime
        LocalDateTime created = request.getCreatedAt().toInstant()
                .atZone(ZoneId.systemDefault())
                .toLocalDateTime();

        // Calculate days between created date and now
        long daysBetween = ChronoUnit.DAYS.between(created, LocalDateTime.now());

        // Set isNew depending on age
        request.setStatus(daysBetween <= 1);
    }

    public void updateRequests(List<Request> requests) {
        for (Request r : requests) {
            checkDate(r);
        }
    }
    public List<Request> findAll(){
        return requestRepo.findAll();
    }

    public Request findByID(Long id){
        return requestRepo.findById(id).get();
    }

    public List<Request> findAllByUserId(Long id){
        return requestRepo.findAllByUserId(id);
    }

    public void deleteRequest(Long id){
        requestRepo.deleteById(id);
    }
}
