package com.example.aqi.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class ForecastData {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private int avg;
    private String weekday;
    private int max;
    private int min;

    public int getAvg() {
        return avg;
    }

    public void setAvg(int avg) {
        this.avg = avg;
    }

    public String getDay() {
        return weekday;
    }

    public void setDay(String weekday) {
        this.weekday = weekday;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    @Override
    public String toString() {
        return "ForecastData [avg=" + avg + ", day=" + weekday + ", max=" + max + ", min=" + min + "]";
    }

}
