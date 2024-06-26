package com.example.aqi.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.example.aqi.entity.AirQualityData;
import com.example.aqi.service.AQD_Service;

@Controller
public class City_Feeds {

    @Autowired
    private AQD_Service service;


    @GetMapping("")
    public ModelAndView home() {
        ModelAndView model = new ModelAndView("home");
        return model;
    }

    @PostMapping("feeds")
    public ModelAndView getcityfeed(@RequestParam("cityname") String cityname) {
        ModelAndView model = new ModelAndView("city_feed");
        AirQualityData data = service.getfeed(cityname, "ce23c20a23107ba42e95da543b4e84862bfd5230");
            if (data == null) {
                model.addObject("message", "Unknown Station");
            } else {
                model.addObject("data", data);
                model.addObject("message",  data.getData().getCity().getName().toString());
                System.out.println("sucess");
            }
        return model;
    }
       
    
  






  /*   @GetMapping("/savecityfeeds")
    public ModelAndView home1() {
        ModelAndView model = new ModelAndView("home");
        List<AirQualityData> data = service.getAirQualityData();
        Collections.reverse(data);
        model.addObject("listOfData", data);
        return model;
    }

<<<<<<< HEAD
    @PostMapping("feeds")
    public ModelAndView putDataFromAPI(@RequestParam("cityname") String cityName) {

        ModelAndView model = new ModelAndView("city_feed");
        AirQualityData data = service.getfeed(cityName, "ce23c20a23107ba42e95da543b4e84862bfd5230");
            if (data == null) {
                model.addObject("message", "Unknown Station");
            } else {
                service.savefeeds(cityName,"ce23c20a23107ba42e95da543b4e84862bfd5230");
                model.addObject("data", data);
                model.addObject("message",  data.getData().getCity().getName().toString());
                System.out.println("sucess");
            }
=======
    @GetMapping("result")
    public ModelAndView home(@RequestParam String msg) {
        ModelAndView model = new ModelAndView("home");
        List<AirQualityData> data = service.getAirQualityData();
        Collections.reverse(data);
        model.addObject("message", msg);
        model.addObject("listofdata", data);
        return model;
    }

    @PostMapping(path = "feeds")
    public ModelAndView putDataFromAPI(@RequestParam("cityname") String cityname) {
        ModelAndView model = new ModelAndView("redirect:result");
        if (service.savefeeds(cityname, "ce23c20a23107ba42e95da543b4e84862bfd5230") == null) {
            model.addObject("msg", "Unknown Station");
        } else {
            model.addObject("msg", service.getAirQualityData().get(service.getAirQualityData().size()-1).getData().getCity().getName().toString());
            System.out.println("sucess");
        }
>>>>>>> d061736b3d6a4be78a28ed98c5da78af4fef817a
        return model;
    } */

}
