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
import com.uhg.interview.employeregistration.model.Employer;
import com.uhg.interview.employeregistration.repo.EmployerRepository;

@RestController
public class EmployerController {

	@Autowired
	EmployerRepository employerRepository;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    
	@RequestMapping(value = "/postemployer", method = RequestMethod.POST)
	public void postemployer(@RequestBody Employer employer) {
		logger.debug("POST  /postemployer, RequestBody "+employer.toString());
        //logger.info("This is an info message");
        //logger.warn("This is a warn message");
        try{
        	employerRepository.save(new Employer(employer.getFirstName(), employer.getLastName()));
        }catch(Exception e){
        	logger.error("Error at  /postemployer: "+e.getMessage());
        }
	}

	@RequestMapping("/findall")
	public Response findAll() {

		Iterable<Employer> employers = employerRepository.findAll();

		return new Response("Done", employers);
	}

	@RequestMapping("/employer/{id}")
	public Response findemployerById(@PathVariable("id") long id) {

		Employer employer = employerRepository.findOne(id);

		return new Response("Done", employer);
	}

	@RequestMapping("/findbylastname")
	public Response findByLastName(@RequestParam("lastName") String lastName) {

		List<Employer> employers = employerRepository.findByLastName(lastName);

		return new Response("Done", employers);
	}
	
	@RequestMapping(value = "update/employer", method = RequestMethod.POST)
	public Employer editemployer(@RequestBody Employer employer) {
		System.out.println(employer.toString());
		employerRepository.save(new Employer(employer.getId(), employer.getFirstName(), employer.getLastName()));
		return employer;
	}
}
