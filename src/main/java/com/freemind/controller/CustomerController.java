package com.freemind.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.freemind.model.Customer;
import com.freemind.model.Vendors;
import com.freemind.services.CustomerService;

@Controller
@RequestMapping("addCustomer")
public class CustomerController {

	@Autowired
	CustomerService customerService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView handleRequest(Model model, HttpServletRequest request) {
		model.addAttribute("customerList", customerService.getAllCustomerList());
		return new ModelAndView("Customer/Customer");
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView addCustomer(
			@ModelAttribute("Customer") @Valid Customer customer, Model uiModel,
			BindingResult bindingResult,
			RedirectAttributes redirectedAttribute,
			HttpServletRequest httpServletRequest, Locale locale) {
		customerService.save(customer);

		uiModel.addAttribute("msgType1", "1");
		uiModel.addAttribute("msg", "Customer Added Successfully!!!");

		return new ModelAndView("redirect:/showCustomer");
	}

	@RequestMapping(method = RequestMethod.GET, value = "updateCustomerDefaulter/{id}/{status}")
	public ModelAndView updateCutomerDefaulter(@PathVariable("id") Integer id,
			@PathVariable boolean defaulter, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (defaulter == true)
			customerService.updateCustomerDefaulter(id, false);
		else
			customerService.updateCustomerDefaulter(id, true);
		uiModel.addAttribute("msgType1", "1");
		uiModel.addAttribute("msg", "Customer Updated Successfully!!!");
		return new ModelAndView("redirect:/showCustomer");
	}

	@RequestMapping(method = RequestMethod.GET, value = "deleteCustomer/{id}")
	public ModelAndView deleteCustomer(@PathVariable("id") Integer id, Model uiModel,
			HttpServletRequest httpServletRequest) {
		customerService.updateCustomerActivityStatus(id, false);
		uiModel.addAttribute("msgType1", "1");
		uiModel.addAttribute("msg", "Customer Deleted Successfully!!!");
		return new ModelAndView("redirect:/showCustomer");
	}
}
