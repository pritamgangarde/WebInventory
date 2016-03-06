package com.freemind.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.freemind.model.Customer;
import com.freemind.model.Product;
import com.freemind.services.CustomerService;
import com.freemind.services.ProductService;
import com.freemind.services.ServiceTaxService;
import com.freemind.services.UnitService;
import com.freemind.services.VatService;

@Controller
public class SaleBillController {

	@Autowired
	CustomerService customerService;
	@Autowired
	ProductService productService;
	@Autowired
	VatService vatService;
	@Autowired
	UnitService unitService;
	@Autowired
	ServiceTaxService serviceTaxService;

	@RequestMapping(value = "/addSaleBill", method = RequestMethod.GET)
	public ModelAndView showSaleBill(Model uiModel, ModelMap model,
			HttpServletRequest httpServletRequest) {
		model.addAttribute("customerList", customerService.getAllCustomerList());
		model.addAttribute("productList", productService.getAllProductList());
		model.addAttribute("vatList", vatService.getAllVatList());
		model.addAttribute("serviceTaxList",
				serviceTaxService.getAllServiceTaxList());
		model.addAttribute("unitList", unitService.getAllUnitList());
		return new ModelAndView("Sale/SaleBill");
	}

	@RequestMapping(value = "/getCustomerDetails", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody
	Customer getCustomerInJSON(@RequestParam("id") int id) {
		return customerService.getCustomerById(id);

	}

	@RequestMapping(value = "/getProductDetails", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody
	Product getProductInJSON(@RequestParam("id") int id) {
		return productService.getProductById(id);

	}
}
