package com.anas.maslahati_pro.Reopsitories;


import com.anas.maslahati_pro.Models.Request;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RequestRepository extends JpaRepository<Request,Integer> {

}
