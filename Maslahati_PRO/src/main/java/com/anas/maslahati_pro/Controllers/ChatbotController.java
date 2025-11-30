package com.anas.maslahati_pro.Controllers;

import com.anas.maslahati_pro.Services.AIChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

@Controller
public class ChatbotController {

    @Autowired
    private AIChatService aiChatService;

    // صفحة chatbot
    @GetMapping("/chatbot")
    public String chatbotPage() {
        return "chatbot";
    }

    // API لاستقبال الرسائل
    @PostMapping("/api/chatbot")
    @ResponseBody
    public String chatWithAI(@RequestBody ChatRequest request) {
        return aiChatService.askAI(request.getMessage());
    }

    public static class ChatRequest {
        private String message;

        public String getMessage() { return message; }
        public void setMessage(String message) { this.message = message; }
    }
}
