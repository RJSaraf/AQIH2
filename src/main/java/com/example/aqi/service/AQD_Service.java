package com.example.aqi.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.example.aqi.dao.ApiApplication_DB;
import com.example.aqi.entity.AirQualityData;
import com.example.aqi.entity.City;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class AQD_Service {

	@Autowired
	private RestTemplate rt;
	@Autowired
	private ObjectMapper objectMapper;
	@Autowired
	ApiApplication_DB dao;

	public AirQualityData getfeed(String cityname, String token) {
		String url = "https://api.waqi.info/feed/" + cityname + "/?token=" + token;
		System.out.println(url);
		ResponseEntity<String> response = rt.getForEntity(url, String.class);
		if (response.getStatusCode().is2xxSuccessful()) {
			String responseData = response.getBody();
			try {
				AirQualityData airQualityData = objectMapper.readValue(responseData, AirQualityData.class);
				return airQualityData;
			} catch (Exception e) {
				System.out.println("Exception occur - " + e);
				return null;
			}
		}
		return null;
	}

	public AirQualityData savefeeds(String cityname, String token) {
		String url = "https://api.waqi.info/feed/" + cityname + "/?token=" + token;
		System.out.println(url);
		ResponseEntity<String> response = rt.getForEntity(url, String.class);
		if (response.getStatusCode().is2xxSuccessful()) {
			String responseData = response.getBody();
			try {
				AirQualityData airQualityData = objectMapper.readValue(responseData, AirQualityData.class);
				dao.save(airQualityData);
				return airQualityData;
			} catch (Exception e) {
				System.out.println("Exception occur - " + e);
				return null;
			}

		}
		return null;

	}

	public List<AirQualityData> getAirQualityData() {
		return dao.findAll();
	}

}