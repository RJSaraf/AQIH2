package com.example.aqi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

@SpringBootApplication
public class AqIndexH2Application {

	public static void main(String[] args) {
		SpringApplication.run(AqIndexH2Application.class, args);
	}
@Bean
	RestTemplate restTamplate() {
		return new RestTemplate();
	}
	
	@Bean
	ObjectMapper objectMapper() {
		return new ObjectMapper();
	}
}