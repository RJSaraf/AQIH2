package com.example.aqi.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class Debug {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String sync;

    public String getSync() {
        return sync;
    }

    public void setSync(String sync) {
        this.sync = sync;
    }

    @Override
    public String toString() {
        return "Debug [sync=" + sync + "]";
    }
}
