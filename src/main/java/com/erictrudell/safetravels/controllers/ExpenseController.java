package com.erictrudell.safetravels.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.erictrudell.safetravels.models.ExpenseModel;
import com.erictrudell.safetravels.services.ExpenseService;

@Controller
@RequestMapping("/expense")
public class ExpenseController {
	
	@Autowired
	private ExpenseService expenseServ;
	@PostMapping("/create")
	public String create(@Valid @ModelAttribute("expense")ExpenseModel expense,
			BindingResult result){
		if (result.hasErrors()) {
			return "index.jsp";
			
		}else {
			expenseServ.createExpense(expense);
			return "redirect:/";
		}
	}
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id,
			Model model) {
//		List<ExpenseModel> allExpenses = expenseServ.getAllExpenses();
		model.addAttribute("expense", expenseServ.getOneExpense(id));
		return"edit.jsp";
	}
	@GetMapping("/show/{id}")
	public String showMeWhatYouGot(@PathVariable("id") Long id,
			Model model) {
//		List<ExpenseModel> allExpenses = expenseServ.getAllExpenses();
		model.addAttribute("expense", expenseServ.getOneExpense(id));
		return"show.jsp";
	}
	@PutMapping("/edit/{id}")
	public String update(@Valid @ModelAttribute("expense")ExpenseModel expense,
			BindingResult result) {
		if(result.hasErrors()) {
			return"edit.jsp";
		}else {
			expenseServ.updateExpense(expense);
			return"redirect:/";
		}
	}
	@DeleteMapping("/{id}")
	public String destroy(@PathVariable("id")Long id) {
		expenseServ.deleteExpense(id);
		return"redirect:/";
	}
	
}