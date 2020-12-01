package com.example.vetclinica.repos;

import com.example.vetclinica.domain.Order;
import com.example.vetclinica.domain.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepos extends CrudRepository<Order, Long> {
    List<Order> findByUserId_Id(Long id);
}
