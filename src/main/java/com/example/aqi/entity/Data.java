package com.example.aqi.entity;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Data {
	@Id
	private String id;

	private int aqi;
	private int idx;
	private String dominentpol;

	private List<Attribution> attributions;

	private City city;

	private IAQI iaqi;

	private Time time;

	private Forecast forecast;

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
