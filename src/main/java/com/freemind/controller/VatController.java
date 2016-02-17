package com.freemind.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
<<<<<<< HEAD
=======
import org.springframework.ui.ModelMap;
>>>>>>> 2d7dd553bc0987c4a8df8fdf3cdbca3b48c606af
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
<<<<<<< HEAD
=======
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;
>>>>>>> 2d7dd553bc0987c4a8df8fdf3cdbca3b48c606af

import com.freemind.model.Vat;
import com.freemind.services.VatService;

@Controller
@RequestMapping("/addVat")
public class VatController {
<<<<<<< HEAD

	@Autowired
	VatService vatService;

	@RequestMapping(value = "/addVat", method = RequestMethod.GET)
	public ModelAndView godown(Model model, HttpServletRequest request) {
		List<Vat> listVat = vatService.getAllVatList();
		model.addAttribute("listVat", listVat);
		return new ModelAndView("Inventory/Vat");
	}

	@RequestMapping(value = "/saveVat", method = RequestMethod.POST)
	public ModelAndView saveVat(@ModelAttribute("addVat") @Valid Vat vatModel,
			BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest,
			RedirectAttributes redirectAttributes, Locale locale) {
		vatService.save(vatModel);

		List<Vat> listVat = vatService.getAllVatList();
		uiModel.addAttribute("listVat", listVat);

=======
	@Autowired
	VatService vatservice;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showVat(Model uiModel, ModelMap model,
			HttpServletRequest httpServletRequest) {
		List<Vat> vatList = vatservice.getAllVatList();
		uiModel.addAttribute("vatlist", vatList);
		return new ModelAndView("Inventory/Vat");
	}
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView addVat(
			@ModelAttribute("addVat") @Valid Vat vatModel,	
			BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest,
			RedirectAttributes redirectAttributes, Locale locale) {

		vatservice.save(vatModel);
		List<Vat> addCategorylist = vatservice.getAllVatList();
		uiModel.addAttribute("vatlist", addCategorylist);
		uiModel.addAttribute("msgType", "1");
		uiModel.addAttribute("msg", "Vat Added Successfully....!!!!");
>>>>>>> 2d7dd553bc0987c4a8df8fdf3cdbca3b48c606af
		return new ModelAndView("Inventory/Vat");
	}
	
	@RequestMapping(value = "{id}", params = "Deletevat", method = RequestMethod.GET)
	public ModelAndView deleteVat(@PathVariable("id") Integer id,
			Model uiModel, HttpServletRequest httpServletRequest) {
		
		Vat godownmodel =  vatservice.getVatById(id);
		godownmodel.setActive(false);
		vatservice.save(godownmodel);
		uiModel.addAttribute("vatlist", vatservice.getAllVatList());
		uiModel.addAttribute("msgType", "1");
		uiModel.addAttribute("msg", "Vat Deleted Successfully....!!!!");
		return new ModelAndView("Inventory/Vat");

	}

}
