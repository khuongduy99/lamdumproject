package com.springmvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springmvc.entity.BrandEntity;

@Repository
public interface BrandRepository extends JpaRepository<BrandEntity, Long>{
	BrandEntity findByCode(String code);
	List<BrandEntity> findAllByStatus(String status);
}
