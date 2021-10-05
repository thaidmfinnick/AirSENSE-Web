package com.vti.dto;


public class PositionDto {
	
	private short id;
	
	private String name;
	
	public PositionDto(short id, String name) {
	
		this.id = id;
		this.name = name;
	}

	public short getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setId(short id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
