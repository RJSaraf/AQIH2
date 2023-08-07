package com.example.aqi.entity;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Daily {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@OneToMany(cascade = CascadeType.ALL)
	private List<ForecastData> o3;

	@OneToMany(cascade = CascadeType.ALL)
	private List<ForecastData> pm10;

	@OneToMany(cascade = CascadeType.ALL)
	private List<ForecastData> pm25;

	@OneToMany(cascade = CascadeType.ALL)
	private List<ForecastData> uvi;

	public List<ForecastData> getUvi() {
		return uvi;
	}

	public void setUvi(List<ForecastData> uvi) {
		this.uvi = uvi;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<ForecastData> getO3() {
		return o3;
	}

	public void setO3(List<ForecastData> o3) {
		this.o3 = o3;
	}

	public List<ForecastData> getPm10() {
		return pm10;
	}

	public void setPm10(List<ForecastData> pm10) {
		this.pm10 = pm10;
	}

	public List<ForecastData> getPm25() {
		return pm25;
	}

	public void setPm25(List<ForecastData> pm25) {
		this.pm25 = pm25;
	}

	@Override
	public String toString() {
		return "Daily [id=" + id + ", o3=" + o3 + ", pm10=" + pm10 + ", pm25=" + pm25 + ", uvi=" + uvi + "]";
	}

}
