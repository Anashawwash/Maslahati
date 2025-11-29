package com.anas.maslahati_pro.Reopsitories;


import com.anas.maslahati_pro.Models.Request;
import com.anas.maslahati_pro.Models.ServiceTypes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RequestRepository extends JpaRepository<Request,Integer> {

    List<Request> findAll();
}
