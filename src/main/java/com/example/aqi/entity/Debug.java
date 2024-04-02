package com.example.aqi.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;


@Document
public class Debug {
    @Id
    private String id;
    
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
