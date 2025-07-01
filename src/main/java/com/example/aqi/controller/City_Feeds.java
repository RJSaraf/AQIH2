package com.example.aqi.controller;

import com.example.aqi.dto.ForecastRow;
import com.example.aqi.entity.AirQualityData;
import com.example.aqi.service.AQD_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

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
            model.addObject("message", data.getData().getCity().getName().toString());
            model.addObject("aqiClass", getAqiClass(data.getData().getAqi()));
            model.addObject("aqiLabel", getAqiLabel(data.getData().getAqi()));

            String timeClass = "";
            int hour = data.getData().getTime().getoffsetDateTime().getHour();

            if (hour >= 5 && hour < 12) {
                timeClass = "widgetcardMorning";
            } else if (hour >= 12 && hour < 17) {
                timeClass = "widgetcardAfternoon";
            } else if (hour >= 17 && hour < 21) {
                timeClass = "widgetcardEvening";
            } else {
                timeClass = "widgetcardNight";
            }

            model.addObject("timeClass", timeClass);
            OffsetDateTime offset = data.getData().getTime().getoffsetDateTime();
            model.addObject("offset", offset);

            String greeting;
            if (hour >= 5 && hour < 12) {
                greeting = "Morning";
            } else if (hour >= 12 && hour < 17) {
                greeting = "Afternoon";
            } else if (hour >= 17 && hour < 21) {
                greeting = "Evening";
            } else {
                greeting = "Night";
            }

            model.addObject("greeting", greeting);


            List<ForecastRow> o3Rows = new ArrayList<>();
            if (data.getData().getForecast() != null && data.getData().getForecast().getDaily().getO3() != null) {
                for (var o3 : data.getData().getForecast().getDaily().getO3()) {
                    o3Rows.add(new ForecastRow(o3.getDay(), o3.getAvg(), o3.getMax(), o3.getMin()));
                }
            }
            model.addObject("o3Rows", o3Rows);
// Repeat for pm10 and pm25
            List<ForecastRow> pm10Rows = new ArrayList<>();
            if (data.getData().getForecast() != null && data.getData().getForecast().getDaily().getPm10() != null) {
                for (var pm10 : data.getData().getForecast().getDaily().getPm10()) {
                    pm10Rows.add(new ForecastRow(pm10.getDay(), pm10.getAvg(), pm10.getMax(), pm10.getMin()));
                }
            }
            model.addObject("pm10Rows", pm10Rows);

            List<ForecastRow> pm25Rows = new ArrayList<>();
            if (data.getData().getForecast() != null && data.getData().getForecast().getDaily().getPm25() != null) {
                for (var pm25 : data.getData().getForecast().getDaily().getPm25()) {
                    pm25Rows.add(new ForecastRow(pm25.getDay(), pm25.getAvg(), pm25.getMax(), pm25.getMin()));
                }
            }
            model.addObject("pm25Rows", pm25Rows);

            System.out.println("success");
        }
        return model;
    }


    private String getAqiClass(int aqi) {
        if (aqi <= 50) {
            return "bg-success";
        } else if (aqi <= 100) {
            return "bg-yellow";
        } else if (aqi <= 150) {
            return "bg-warning";
        } else if (aqi <= 200) {
            return "bg-danger";
        } else if (aqi <= 300) {
            return "bg-purple";
        } else {
            return "bg-brown";
        }
    }


    private String getAqiLabel(int aqi) {
        if (aqi <= 50) {
            return "Good";
        } else if (aqi <= 100) {
            return "Moderate";
        } else if (aqi <= 150) {
            return "Unhealthy for Sensitive Groups";
        } else if (aqi <= 200) {
            return "Unhealthy";
        } else if (aqi <= 300) {
            return "Very Unhealthy";
        } else {
            return "Hazardous";
        }
    }



  /*   @GetMapping("/savecityfeeds")
    public ModelAndView home1() {
        ModelAndView model = new ModelAndView("home");
        List<AirQualityData> data = service.getAirQualityData();
        Collections.reverse(data);
        model.addObject("listOfData", data);
        return model;
    }

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

        return model;
    } */

}
