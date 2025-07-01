package com.example.aqi.dto;

public class ForecastRow {
    public String day;
    public int avg, max, min;
    public String avgClass, maxClass, minClass;
    public ForecastRow(String day, int avg, int max, int min) {
        this.day = day;
        this.avg = avg;
        this.max = max;
        this.min = min;
        this.avgClass = getAqiClass(avg);
        this.maxClass = getAqiClass(max);
        this.minClass = getAqiClass(min);
    }

    private static String getAqiClass(int value) {
        if (value <= 50) return "bg-success";
        if (value <= 100) return "bg-subtle-green";
        if (value <= 150) return "bg-warning";
        if (value <= 200) return "bg-danger";
        if (value <= 300) return "bg-purple";
        return "bg-brown";
    }
}