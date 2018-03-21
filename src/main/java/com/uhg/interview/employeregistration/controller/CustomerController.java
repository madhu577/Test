package com.uhg.interview.employeregistration.controller;

import java.util.List;



 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.uhg.interview.employeregistration.message.Response;
import com.uhg.interview.employeregistration.model.Customer;
import com.uhg.interview.employeregistration.repo.CustomerRepository;

@RestController
public class CustomerController {

	@Autowired
	CustomerRepository repository;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    
	@RequestMapping(value = "/postcustomer", method = RequestMethod.POST)
	public void postCustomer(@RequestBody Customer customer) {
		logger.debug("POST  /postcustomer, RequestBody "+customer.toString());
        //logger.info("This is an info message");
        //logger.warn("This is a warn message");
        try{
        	repository.save(new Customer(customer.getFirstName(), customer.getLastName()));
        }catch(Exception e){
        	logger.error("Error at  /postcustomer: "+e.getMessage());
        }
	}

	@RequestMapping("/findall")
	public Response findAll() {

		Iterable<Customer> customers = repository.findAll();

		return new Response("Done", customers);
	}

	@RequestMapping("/customer/{id}")
	public Response findCustomerById(@PathVariable("id") long id) {

		Customer customer = repository.findOne(id);

		return new Response("Done", customer);
	}

	@RequestMapping("/findbylastname")
	public Response findByLastName(@RequestParam("lastName") String lastName) {

		List<Customer> customers = repository.findByLastName(lastName);

		return new Response("Done", customers);
	}
	
	@RequestMapping(value = "/editcustomer", method = RequestMethod.POST)
	public Customer editCustomer(@RequestBody Customer customer) {
		System.out.println(customer.toString());
		repository.save(new Customer(customer.getId(), customer.getFirstName(), customer.getLastName()));
		return customer;
	}
}
