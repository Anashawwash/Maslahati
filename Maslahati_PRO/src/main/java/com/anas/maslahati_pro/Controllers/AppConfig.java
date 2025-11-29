package com.anas.maslahati_pro.Controllers;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;

@Configuration
public class AppConfig {

    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasename("classpath:messages"); // اسم ملفات الرسائل بدون الامتداد
        messageSource.setDefaultEncoding("UTF-8");        // مهم لترجمة العربية
        return messageSource;
    }
}
