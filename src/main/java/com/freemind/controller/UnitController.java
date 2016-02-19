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

import com.freemind.model.Unit;
import com.freemind.services.UnitService;

@Controller
public class UnitController {

	@Autowired
	UnitService unitService;

	@RequestMapping(value = "/showUnit", method = RequestMethod.GET)
	public ModelAndView handelRequest(Model uiModel, HttpServletRequest request) {
		uiModel.addAttribute("unitList", unitService.getAllUnitList());
		return new ModelAndView("Inventory/Unit");
	}

	@RequestMapping(method = RequestMethod.POST, value = "/addUnit")
	public ModelAndView addUnit(
			@ModelAttribute("addUnit") @Valid Unit unitModel,
			BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest,
			RedirectAttributes redirectedAttributes, Locale locale) {
		unitService.save(unitModel);

		uiModel.addAttribute("msgType1", "1");
		uiModel.addAttribute("msg", "Unit Added Successfully!!!");

		return new ModelAndView("redirect:/showUnit");
	}

	@RequestMapping(method = RequestMethod.GET, value = "updateUnit/{id}/{status}")
	public ModelAndView updateUnit(@PathVariable("id") Integer id,
			@PathVariable("status") boolean status, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (status == true)
			unitService.deleteUnitById(id, false);
		else
			unitService.deleteUnitById(id, true);

		uiModel.addAttribute("msgType1", "1");
		uiModel.addAttribute("msg", "Unit Updated Successfully!!!");

		return new ModelAndView("redirect:/showUnit");
	}

	@RequestMapping(method = RequestMethod.GET, value = "deleteUnit/{id}")
	public ModelAndView deleteUnit(@PathVariable("id") Integer id,
			Model uiModel, HttpServletRequest httpServletRequest) {

		unitService.deleteUnitById(id, false);

		uiModel.addAttribute("msgType1", "1");
		uiModel.addAttribute("msg", "Unit Deleted Successfully!!!");

		return new ModelAndView("redirect:/showUnit");
	}

}
