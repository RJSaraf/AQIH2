package com.example.aqi.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;



@Document
public class Forecast {
    @Id
    private String id;
    @Field("daily")
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
