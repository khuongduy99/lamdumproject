package com.springmvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springmvc.entity.BillEntity;

@Repository
public interface BillRepository extends JpaRepository<BillEntity, Long>{
	List<BillEntity> findAllByUserId(Long userId);
}
