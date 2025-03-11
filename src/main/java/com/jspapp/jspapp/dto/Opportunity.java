package com.jspapp.jspapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Opportunity {
	private int id;
	private double value;
	private String name;
	private int accountId;
	private String stage;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date closingDate;
	private double probability;
	private int assignedTo;
	private int createdAt;

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getStage() {
		return stage;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}

	public Date getClosingDate() {
		return closingDate;
	}

	public void setClosingDate(Date closingDate) {
		this.closingDate = closingDate;
	}

	public double getProbability() {
		return probability;
	}

	public void setProbability(double probability) {
		this.probability = probability;
	}

	public int getAssignedTo() {
		return assignedTo;
	}

	public void setAssignedTo(int assignedTo) {
		this.assignedTo = assignedTo;
	}

	public int getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(int createdAt) {
		this.createdAt = createdAt;
	}
}
