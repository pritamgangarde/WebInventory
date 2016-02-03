package com.freemind.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UnitController {
	
	@RequestMapping(value="/addUnit", method=RequestMethod.GET)
	public ModelAndView addUnit(Model model,HttpServletRequest request){
		return new ModelAndView("Inventory/add_unit");
	}
}
