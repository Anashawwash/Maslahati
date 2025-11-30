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
        String url = "https://nominatim.openstreetmap.org/reverse?lat=" + lat +
                "&lon=" + lon + "&format=json";

        RestTemplate rest = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.add("User-Agent", "MaslahatiApp/1.0 (maslahatitest@gmail.com)");
        headers.add("Accept-Language", "en");
        headers.add("Referer", "http://localhost:8080");
        headers.add("Accept", "application/json");           

        HttpEntity<String> entity = new HttpEntity<>(headers);

        return rest.exchange(url, HttpMethod.GET, entity, String.class).getBody();
    }
}
