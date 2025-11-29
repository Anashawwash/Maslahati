package com.anas.maslahati_pro.Services;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.json.JSONObject;
import java.net.http.*;
import java.net.URI;

@Service
public class AIChatService {

    @Value("${openai.api.key}")
    private String apiKey;

    public String askAI(String message) {
        try {
            HttpClient client = HttpClient.newHttpClient();

            JSONObject content = new JSONObject()
                    .put("model", "gpt-4o-mini")
                    .put("messages", new JSONObject[] {
                            new JSONObject()
                                    .put("role", "user")
                                    .put("content", message)
                    });

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create("https://api.openai.com/v1/chat/completions"))
                    .header("Content-Type", "application/json")
                    .header("Authorization", "Bearer " + apiKey)
                    .POST(HttpRequest.BodyPublishers.ofString(content.toString()))
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            JSONObject result = new JSONObject(response.body());
            return result.getJSONArray("choices")
                    .getJSONObject(0)
                    .getJSONObject("message")
                    .getString("content");

        } catch (Exception e) {
            return " حدث خطأ أثناء الاتصال بالذكاء الاصطناعي.";
        }
    }
}
