package com.anas.maslahati_pro.Services;

import org.springframework.stereotype.Service;

@Service
public class AIChatService {

    public String askAI(String message) {
        message = message.toLowerCase();

        if(message.contains("مرحبا") || message.contains("hello")) {
            return "أهلاً بك! كيف يمكنني مساعدتك اليوم؟";
        }
        if(message.contains("كهربائي")) {
            return "بالطبع، يمكنك البحث عن كهربائي في منطقتك عبر مصلحاتي.";
        }
        if(message.contains("سباكة") || message.contains("plumber")) {
            return "نعم، لدينا سباكين موثوقين في منطقتك.";
        }
        if(message.contains("غسالة") || message.contains("washing machine")) {
            return "يمكننا ترتيب فني لتصليح الغسالة في أسرع وقت.";
        }
        if(message.contains("سعر") || message.contains("cost")) {
            return "الأسعار تختلف حسب الخدمة والموقع، يمكنك التواصل مع الفني مباشرة لمعرفة التفاصيل.";
        }


        return "لا أفهم رسالتك، حاول صياغتها بطريقة مختلفة.";
    }
}
