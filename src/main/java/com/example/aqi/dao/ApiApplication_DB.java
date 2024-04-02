package com.example.aqi.dao;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.aqi.entity.AirQualityData;

public interface ApiApplication_DB extends MongoRepository<AirQualityData, String> {

}