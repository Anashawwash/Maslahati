package com.anas.maslahati_pro.Services;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class LocationService {

    public String reverseGeocode(double lat, double lon) {
        System.out.println(lat + "," + lon);
        String url = "https://nominatim.openstreetmap.org/reverse?lat=" + lat + "&lon=" + lon + "&format=json";

        RestTemplate rest = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.set("User-Agent", "MyApp/1.0 (maslahatitest@gmail.com)");

        HttpEntity<String> entity = new HttpEntity<>(headers);
        ResponseEntity<String> response = rest.exchange(url, HttpMethod.GET, entity, String.class);

        return response.getBody();
    }
}