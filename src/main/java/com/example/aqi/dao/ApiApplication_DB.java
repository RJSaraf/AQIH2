package com.example.aqi.dao;

<<<<<<< HEAD
import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.aqi.entity.AirQualityData;

public interface ApiApplication_DB extends MongoRepository<AirQualityData, String> {
=======
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.aqi.entity.AirQualityData;

public interface ApiApplication_DB extends JpaRepository<AirQualityData, Integer> {
  
>>>>>>> d061736b3d6a4be78a28ed98c5da78af4fef817a

}