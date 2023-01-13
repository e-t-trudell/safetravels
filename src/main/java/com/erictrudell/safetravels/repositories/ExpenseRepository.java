package com.erictrudell.safetravels.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.erictrudell.safetravels.models.ExpenseModel;

public interface ExpenseRepository extends CrudRepository<ExpenseModel, Long>{
//	create / update
	List<ExpenseModel> save(String e);
//	read one / all
	ExpenseModel getOne(Long id);
	List<ExpenseModel> findAll();
}
