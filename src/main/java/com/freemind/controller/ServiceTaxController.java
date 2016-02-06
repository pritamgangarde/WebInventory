package com.freemind.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@org.springframework.stereotype.Controller
public class ServiceTaxController {

	@RequestMapping(value = "/addServiceTax", method = RequestMethod.GET)
	public ModelAndView handleRequest(HttpServletRequest request,
			Model model) throws Exception {
		return new ModelAndView("Inventory/ServiceTax");
	}

}
