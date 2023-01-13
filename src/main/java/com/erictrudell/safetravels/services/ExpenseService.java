package com.erictrudell.safetravels.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erictrudell.safetravels.models.ExpenseModel;
import com.erictrudell.safetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	
	@Autowired
	private ExpenseRepository expenseRepo;
	
	public ExpenseModel getOneExpense(Long id){
		return expenseRepo.getOne(id);
	}
	public List<ExpenseModel> getAllExpenses(){
		return expenseRepo.findAll();
	}
	public ExpenseModel createExpense(ExpenseModel e) {
		return expenseRepo.save(e);
	}
	public ExpenseModel updateExpense(ExpenseModel e) {
		return expenseRepo.save(e);
	}
	public void deleteExpense(Long id) {
		expenseRepo.deleteById(id);
	}
}
