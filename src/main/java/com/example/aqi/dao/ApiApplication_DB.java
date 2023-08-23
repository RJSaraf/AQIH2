package com.example.aqi.dao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.aqi.entity.AirQualityData;

public interface ApiApplication_DB extends JpaRepository<AirQualityData, Integer> {
  

}