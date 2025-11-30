package com.anas.maslahati_pro.Controllers;

import com.anas.maslahati_pro.Services.AIChatService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/chatbot")
public class AIChatController {

    private final AIChatService aiChatService;

    public AIChatController(AIChatService aiChatService) {
        this.aiChatService = aiChatService;
    }

    @PostMapping
    public ChatResponse chat(@RequestBody ChatRequest request) {
        String reply = aiChatService.askAI(request.getMessage());
        return new ChatResponse(reply);
    }

    public static class ChatRequest {
        private String message;
        public String getMessage() { return message; }
        public void setMessage(String message) { this.message = message; }
    }

    public static class ChatResponse {
        private String reply;
        public ChatResponse(String reply) { this.reply = reply; }
        public String getReply() { return reply; }
        public void setReply(String reply) { this.reply = reply; }
    }
}
