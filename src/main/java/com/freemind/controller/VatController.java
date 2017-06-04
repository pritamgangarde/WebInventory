package com.freemind.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.freemind.model.Vat;
import com.freemind.services.VatService;

@Controller
@RequestMapping("/addVat")
public class VatController {

	@Autowired
	VatService vatService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showVat(Model uiModel, ModelMap model,
			HttpServletRequest httpServletRequest) {
		List<Vat> vatList = vatService.getAllVatList();
		uiModel.addAttribute("vatlist", vatList);
		return new ModelAndView("Inventory/Vat");
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView addVat(@ModelAttribute("addVat") @Valid Vat vatModel,
			BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest,
			RedirectAttributes redirectAttributes, Locale locale) {

		vatService.save(vatModel);
		List<Vat> vatlist = vatService.getAllVatList();
		uiModel.addAttribute("vatlist", vatlist);
		uiModel.addAttribute("msgType", "1");
		uiModel.addAttribute("msg", "Vat Added Successfully....!!!!");
		return new ModelAndView("Inventory/Vat");
	}

	@RequestMapping(value = "{id}", params = "Deletevat", method = RequestMethod.GET)
	public ModelAndView deleteVat(@PathVariable("id") Integer id,
			Model uiModel, HttpServletRequest httpServletRequest) {

		Vat godownmodel = vatService.getVatById(id);
		godownmodel.setActive(false);
		vatService.save(godownmodel);
		uiModel.addAttribute("vatlist", vatService.getAllVatList());
		uiModel.addAttribute("msgType", "1");
		uiModel.addAttribute("msg", "Vat Deleted Successfully....!!!!");
		return new ModelAndView("Inventory/Vat");

	}

}
