package com.example.vetclinica.repos;

import com.example.vetclinica.domain.Employee;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface EmployeeRepos extends CrudRepository<Employee, Long> {

    List<Employee> findByPosition(String position);

}
