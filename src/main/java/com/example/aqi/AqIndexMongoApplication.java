package com.example.aqi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

@SpringBootApplication
public class AqIndexMongoApplication {

	public static void main(String[] args) {
		SpringApplication.run(AqIndexMongoApplication.class, args);
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