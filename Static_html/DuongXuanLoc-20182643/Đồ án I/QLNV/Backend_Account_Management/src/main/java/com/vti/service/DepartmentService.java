package com.vti.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vti.entity.Department;
import com.vti.repository.IDepartmentRepository;

@Service
public class DepartmentService implements IDepartmentService{
	
	@Autowired
	private IDepartmentRepository departmentRepository;

	
	@Override
	public List<Department> getAllDepartment() {
		// TODO Auto-generated method stub
		return departmentRepository.findAll();
	}


	@Override
	public Department findByName(String name) {
		// TODO Auto-generated method stub
		return departmentRepository.findByName(name);
	}
}
