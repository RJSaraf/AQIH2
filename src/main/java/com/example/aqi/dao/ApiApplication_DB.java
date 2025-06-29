package com.example.aqi.dao;

import com.example.aqi.entity.AirQualityData;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ApiApplication_DB extends JpaRepository<AirQualityData, Integer> {
    // This interface will automatically provide CRUD operations for AirQualityData
    // Additional custom query methods can be defined here if needed
}