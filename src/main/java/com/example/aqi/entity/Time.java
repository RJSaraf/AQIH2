package com.example.aqi.entity;

import java.time.OffsetDateTime;
import java.time.ZoneOffset;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;


@Document
public class Time {
    @Id
    private String id;
    
    private String s;
    private String tz;
    private long v;
    private String iso;

	public String getS() {
		return s;
	}

	public void setS(String s) {
		this.s = s;
	}

	public String getTz() {
		return tz;
	}

	public void setTz(String tz) {
		this.tz = tz;
	}

	public long getV() {
		return v;
	}

	public void setV(long v) {
		this.v = v;
	}

	public String getIso() {
		return iso;
	}

	public void setIso(String iso) {
		this.iso = iso;
	}

	@Override
	public String toString() {
		return "Time [s=" + s + ", tz=" + tz + ", v=" + v + ", iso=" + iso + "]";
	}

	public OffsetDateTime getoffsetDateTime(){
		ZoneOffset zoneOffset = ZoneOffset.of(this.tz);
		return OffsetDateTime.now(zoneOffset);}

}