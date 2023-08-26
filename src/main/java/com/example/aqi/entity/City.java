package com.example.aqi.entity;

import java.util.List;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class City {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ElementCollection
    private List<Double> geo;
    
    private String name;
    private String url;
    private String location;
     
     public List<Double> getGeo() {
		return geo;
	}
	public void setGeo(List<Double> geo) {
		this.geo = geo;
	}
	public String getName() {
		return name;
	}
	@Override
	public String toString() {
		return "City [geo=" + geo + ", name=" + name + ", url=" + url + ", location=" + location + "]";
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}

}
