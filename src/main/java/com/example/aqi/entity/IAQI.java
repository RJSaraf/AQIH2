package com.example.aqi.entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;



@Entity
public class IAQI {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @OneToOne(cascade = CascadeType.ALL)
    private Valuedata co;
    
    @OneToOne(cascade = CascadeType.ALL)
    private Valuedata dew;
    
    @OneToOne(cascade = CascadeType.ALL)
    private Valuedata h;
    
    @OneToOne(cascade = CascadeType.ALL)
    private Valuedata no2;
    
    @OneToOne(cascade = CascadeType.ALL)
    private Valuedata o3;
    
    @OneToOne(cascade = CascadeType.ALL)
    private Valuedata p;
    
    @OneToOne(cascade = CascadeType.ALL)
    private Valuedata pm10;
    
    @OneToOne(cascade = CascadeType.ALL)
    private Valuedata pm25;
    
    @OneToOne(cascade = CascadeType.ALL)
    private Valuedata so2;
    
    @OneToOne(cascade = CascadeType.ALL)
    private Valuedata t;
    
    @OneToOne(cascade = CascadeType.ALL)
    private Valuedata w;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Valuedata getWg() {
		return wg;
	}

	public void setWg(Valuedata wg) {
		this.wg = wg;
	}

	@OneToOne(cascade = CascadeType.ALL)
    private Valuedata wg;

	public Valuedata getCo() {
		return co;
	}

	public void setCo(Valuedata co) {
		this.co = co;
	}

	@Override
	public String toString() {
		return "IAQI [co=" + co + ", dew=" + dew + ", h=" + h + ", no2=" + no2 + ", o3=" + o3 + ", p=" + p + ", pm10="
				+ pm10 + ", pm25=" + pm25 + ", so2=" + so2 + ", t=" + t + ", w=" + w + "]";
	}

	public Valuedata getDew() {
		return dew;
	}

	public void setDew(Valuedata dew) {
		this.dew = dew;
	}

	public Valuedata getH() {
		return h;
	}

	public void setH(Valuedata h) {
		this.h = h;
	}

	public Valuedata getNo2() {
		return no2;
	}

	public void setNo2(Valuedata no2) {
		this.no2 = no2;
	}

	public Valuedata getO3() {
		return o3;
	}

	public void setO3(Valuedata o3) {
		this.o3 = o3;
	}

	public Valuedata getP() {
		return p;
	}

	public void setP(Valuedata p) {
		this.p = p;
	}

	public Valuedata getPm10() {
		return pm10;
	}

	public void setPm10(Valuedata pm10) {
		this.pm10 = pm10;
	}

	public Valuedata getPm25() {
		return pm25;
	}

	public void setPm25(Valuedata pm25) {
		this.pm25 = pm25;
	}

	public Valuedata getSo2() {
		return so2;
	}

	public void setSo2(Valuedata so2) {
		this.so2 = so2;
	}

	public Valuedata getT() {
		return t;
	}

	public void setT(Valuedata t) {
		this.t = t;
	}

	public Valuedata getW() {
		return w;
	}

	public void setW(Valuedata w) {
		this.w = w;
	}

}
