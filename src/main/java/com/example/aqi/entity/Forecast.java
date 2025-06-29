package com.example.aqi.entity;

import jakarta.persistence.*;


@Entity
public class Forecast {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "daily_id", referencedColumnName = "id")
    private Daily daily;


    public Daily getDaily() {
        return daily;
    }

    public void setDaily(Daily daily) {
        this.daily = daily;
    }

    @Override
    public String toString() {
        return "Forecast [daily=" + daily + "]";
    }

}
