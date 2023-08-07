package com.example.aqi.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.aqi.entity.AirQualityData;

public interface ApiApplication_DB extends JpaRepository<AirQualityData, Integer> {

}