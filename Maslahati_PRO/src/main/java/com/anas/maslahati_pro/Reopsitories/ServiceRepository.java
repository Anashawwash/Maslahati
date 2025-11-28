package com.anas.maslahati_pro.Reopsitories;


import com.anas.maslahati_pro.Models.ServiceTypes;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceRepository extends CrudRepository<ServiceTypes,String> {

}
