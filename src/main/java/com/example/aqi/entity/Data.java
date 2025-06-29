package com.example.aqi.entity;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class Data {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private int aqi;
    private int idx;
    private String dominentpol;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "data_id") // foreign key in Attribution table
    private List<Attribution> attributions;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "city_id")
    private City city;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "iaqi_id")
    private IAQI iaqi;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "time_id")
    private Time time;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "forecast_id")
    private Forecast forecast;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "debug_id")
    private Debug debug;

    public int getAqi() {
        return aqi;
    }

    public void setAqi(int aqi) {
        this.aqi = aqi;
    }

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public List<Attribution> getAttributions() {
        return attributions;
    }

    public void setAttributions(List<Attribution> attributions) {
        this.attributions = attributions;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public String getDominentpol() {
        return dominentpol;
    }

    public void setDominentpol(String dominentpol) {
        this.dominentpol = dominentpol;
    }

    public IAQI getIaqi() {
        return iaqi;
    }

    public void setIaqi(IAQI iaqi) {
        this.iaqi = iaqi;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public Forecast getForecast() {
        return forecast;
    }

    public void setForecast(Forecast forecast) {
        this.forecast = forecast;
    }

    public Debug getDebug() {
        return debug;
    }

    public void setDebug(Debug debug) {
        this.debug = debug;
    }

}