package com.example.aqi.entity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;

@Entity
public class Data {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private int aqi;
	private int idx;
	private String dominentpol;

	@OneToMany(cascade = CascadeType.ALL)
	private List<Attribution> attributions;

	@OneToOne(cascade = CascadeType.ALL)
	private City city;

	@OneToOne(cascade = CascadeType.ALL)
	private IAQI iaqi;

	@OneToOne(cascade = CascadeType.ALL)
	private Time time;

	@OneToOne(cascade = CascadeType.ALL)
	private Forecast forecast;

	@OneToOne(cascade = CascadeType.ALL)
	private Debug debug;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

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
