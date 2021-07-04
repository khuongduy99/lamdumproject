package com.springmvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.springmvc.entity.ProductEntity;

@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, Long>{
	ProductEntity findByCode(String code);
	List<ProductEntity> findAllByBrandIdAndStatus(Long brandId, String status);
	
	
	@Query(value = "SELECT * FROM product WHERE sale != 0 AND status = ?1 LIMIT ?2 ", nativeQuery = true)
	List<ProductEntity> findAllProductSaleByStatusAndLimit(String status, int limit);
	
	@Query(value = "SELECT * FROM product WHERE status = ?1 LIMIT ?2 ", nativeQuery = true)
	List<ProductEntity> findAllByStatusAndLimit(String status, int limit);
	
	@Query(value = "SELECT * FROM product WHERE sale != 0 AND status = ?1 ", nativeQuery = true)
	List<ProductEntity> findAllProductSaleByStatus(String status);
	
	List<ProductEntity> findAllByIsMaleAndBrandIdAndStatus(boolean gender, Long brandId, String status);
	
	List<ProductEntity> findAllByIsMaleAndStatus(boolean gender, String status);
}
