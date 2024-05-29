package com.alim.ecommerce.repository;

import com.alim.ecommerce.model.User;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserRepository extends JpaRepository<Long, User>{
}
