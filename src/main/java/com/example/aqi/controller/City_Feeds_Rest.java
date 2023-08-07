package com.example.aqi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.aqi.entity.AirQualityData;
import com.example.aqi.service.AQD_Service;

@RestController
public class City_Feeds_Rest {

    @Autowired
    private AQD_Service service;

    @GetMapping(path = "cityfeeds/{cityname}/{token}", produces = MediaType.APPLICATION_JSON_VALUE)
    public AirQualityData fetchDataFromAPI(@PathVariable("cityname") String cityname,
            @PathVariable("token") String token) {
        return service.savefeeds(cityname, token);
    }
}