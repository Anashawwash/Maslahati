package com.anas.maslahati_pro.Services;

import org.springframework.stereotype.Service;

@Service
public class AIChatService {

    public String askAI(String message) {
        return "AI Response for: " + message;
    }
}
