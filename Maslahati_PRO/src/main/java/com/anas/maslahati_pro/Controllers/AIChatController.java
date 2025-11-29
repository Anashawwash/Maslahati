package com.anas.maslahati_pro.Controllers;

import com.anas.maslahati_pro.Services.AIChatService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/chat")
public class AIChatController {

    private final AIChatService aiChatService;

    public AIChatController(AIChatService aiChatService) {
        this.aiChatService = aiChatService;
    }

    @PostMapping
    public String chat(@RequestParam String message) {
        return aiChatService.askAI(message);
    }
}
