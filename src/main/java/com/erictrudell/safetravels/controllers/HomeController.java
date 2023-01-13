package com.erictrudell.safetravels.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.erictrudell.safetravels.models.ExpenseModel;
import com.erictrudell.safetravels.services.ExpenseService;

@Controller
public class HomeController {
	
	@Autowired
	private ExpenseService expenseServ;
	@GetMapping("/")
	public String land(@ModelAttribute("expense") ExpenseModel expense,
			Model model) {
		List<ExpenseModel> allExpenses = expenseServ.getAllExpenses();
		model.addAttribute("allExpenses", allExpenses);
		return "index.jsp";
		
	}
}
