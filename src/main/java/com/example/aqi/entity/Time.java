package com.example.aqi.entity;

import java.time.OffsetDateTime;
import java.time.ZoneOffset;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


@Entity
public class Time {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String s;
    private String tz;
    private long v;
    private String iso;
	
	public OffsetDateTime getoffsetDateTime(){
		ZoneOffset zoneOffset = ZoneOffset.of(this.tz);
		return OffsetDateTime.now(zoneOffset);}

	public String getS() {
		return s;
	}

	public void setS(String s) {
		this.s = s;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

}