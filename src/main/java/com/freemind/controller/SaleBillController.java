package com.freemind.controller;

import javax.servlet.http.HttpServletRequest;

import com.freemind.model.Sale;
import com.freemind.model.SaleDetails;
import com.freemind.print.BillPrint;
import com.freemind.services.*;
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

import java.util.List;

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
	@Autowired
	CategoryService categoryService;
	@Autowired
	SaleService saleService;
	@Autowired
	SaleDetailsService saleDetailsService;
	@RequestMapping(value = "/addSaleBill", method = RequestMethod.GET)
	public ModelAndView showSaleBill(Model uiModel, ModelMap model,
									 HttpServletRequest httpServletRequest) {
		model.addAttribute("customerList", customerService.getAllCustomerList());
		model.addAttribute("categoryList", categoryService.listCategory());
		model.addAttribute("productList", productService.getAllProductList());
		model.addAttribute("vatList", vatService.getAllVatList());
		model.addAttribute("serviceTaxList",
				serviceTaxService.getAllServiceTaxList());
		model.addAttribute("unitList", unitService.getAllUnitList());
		return new ModelAndView("Sale/SaleBill");
	}

	@RequestMapping(value = "/getCustomerDetails", method = RequestMethod.GET, produces = "application/json")
	public
	@ResponseBody
	Customer getCustomerInJSON(@RequestParam("id") String id) {
		return customerService.getCustomerByMobileNo(id);

	}

	@RequestMapping(value = "/getProductDetails", method = RequestMethod.GET, produces = "application/json")
	public
	@ResponseBody
	Product getProductInJSON(@RequestParam("id") int id) {
		return productService.getProductById(id);

	}

	@RequestMapping(value = "/getProductList", method = RequestMethod.GET, produces = "application/json")
	public
	@ResponseBody
	List<Product> getProductListInJSON(@RequestParam("id") int id) {
		return productService.getProductListByCatId(id);

	}

	@RequestMapping(value = "/AddBillItem", method = RequestMethod.GET, produces = "application/json")
	public
	@ResponseBody
	SaleDetails addBillItem(@RequestParam("productId") int id, @RequestParam("customerId") int customerId , @RequestParam("quantity") int quantity, @RequestParam("salePrice") double salePrice, @RequestParam("saleOrderId") int saleOrderId) {
		Sale sale = null;
		Customer customer=customerService.getCustomerById(customerId);
		if (saleOrderId != 0) {
			sale = saleService.getSaleById(saleOrderId);
		} else {
			sale = new Sale();
			sale.setCustomer(customer);
			saleService.save(sale);
		}
		Product product = productService.getProductById(id);
		SaleDetails saleDetails = new SaleDetails();
		saleDetails.setProduct(product);
		saleDetails.setQuantity(quantity);
		saleDetails.setSaleRate(salePrice);
		saleDetails.setSale(sale);
		saleDetailsService.save(saleDetails);
		saleService.update(sale);
		return saleDetails;
	}

	@RequestMapping(value = "/saveBill", method = RequestMethod.GET, produces = "application/json")
	public
	@ResponseBody
	Sale saveBill(@RequestParam("saleOrderId") int saleOrderId,@RequestParam("totalAmount") double totalAmount,@RequestParam("netAmount") double netAmount,@RequestParam("paidAmount") double paidAmount,@RequestParam("customerId") int customerId) {
			/*Sale sale = saleService.getSaleById(saleOrderId);
		sale.*/
		Customer customer=customerService.getCustomerById(customerId);
			Sale sale =new Sale();
			sale.setId(saleOrderId);
			sale.setTotalAmount(totalAmount);
			sale.setNetAmount(netAmount);
			sale.setPaidAmount(paidAmount);
			sale.setBalanceAmount(netAmount-paidAmount);
			sale.setCustomer(customer);
			saleService.update(sale);
			return sale;
	}

	@RequestMapping(value = "/printBill", method = RequestMethod.GET, produces = "application/json")
	public
	@ResponseBody
	Sale printBill(@RequestParam("saleOrderId") int saleOrderId) {
		Sale sale = saleService.getSaleById(saleOrderId);
		new BillPrint().addBillDetails(sale);
		return sale;
	}

	@RequestMapping(value = "/deleteBillItem", method = RequestMethod.GET, produces = "application/json")
	public
	@ResponseBody
	void deleteBillItem(@RequestParam("saleDetailId") int id) {
		saleDetailsService.deleteSaleDetailsById(id);
	}

}