package com.example.aqi.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Valuedata {
    @Id
    private String id;
    
    private double v;
    

	public double getV() {
		return v;
	}

	public void setV(double v) {
		this.v = v;
	}

	@Override
	public String toString() {
		return "Value [v=" + v + "]";
	}

}
