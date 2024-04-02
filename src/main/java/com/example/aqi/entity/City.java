package com.example.aqi.entity;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;


@Document
public class City {
    @Id
    private String id;
    
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
