package com.anas.maslahati_pro.Controllers;

import com.anas.maslahati_pro.Services.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/location")
@CrossOrigin(origins = "*")
public class LocationController {


    @Autowired
    private LocationService locationService;

    @GetMapping("/reverse")
    public String reverse(@RequestParam double lat, @RequestParam double lon) {
        System.out.println(lat + "," + lon );
        return locationService.reverseGeocode(lat, lon);
    }
}