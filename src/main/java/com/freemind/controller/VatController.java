package com.freemind.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.freemind.model.Vat;
import com.freemind.services.VatService;

@Controller
public class VatController {

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

		return new ModelAndView("Inventory/Vat");
	}
}
