package com.example.aqi.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Attribution {
    @Id
    private String id;
    
    private String url;
    private String name;
    private String logo;
    
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLogo() {
		return logo;
	}
	@Override
	public String toString() {
		return "Attribution [url=" + url + ", name=" + name + ", logo=" + logo + "]";
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
}
