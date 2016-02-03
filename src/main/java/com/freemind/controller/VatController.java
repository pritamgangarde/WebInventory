package com.freemind.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class VatController {
	@RequestMapping(value = "/addVat", method = RequestMethod.GET)
	public ModelAndView godown(Model model, HttpServletRequest request) {
		return new ModelAndView("Inventory/addVat");
	}
}
