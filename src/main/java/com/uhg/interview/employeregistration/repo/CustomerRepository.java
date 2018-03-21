package com.uhg.interview.employeregistration.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.uhg.interview.employeregistration.model.Customer;

public interface CustomerRepository extends CrudRepository<Customer, Long> {
	List<Customer> findByLastName(String lastName);
}