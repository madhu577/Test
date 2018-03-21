package com.uhg.interview.employeregistration.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.uhg.interview.employeregistration.model.Employer;

public interface EmployerRepository extends CrudRepository<Employer, Long> {
	List<Employer> findByLastName(String lastName);
}