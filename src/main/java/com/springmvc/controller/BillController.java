package com.springmvc.controller;

import java.util.List;

import javax.validation.Valid;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.entity.BillEntity;
import com.springmvc.form.FormOrder;
import com.springmvc.repository.BillRepository;

@Controller
public class BillController {

	@Autowired
	private BillRepository billRepository;

	@Autowired
	private ModelMapper modelMapper;

	@RequestMapping(value = { "/admin/bill/list" }, method = RequestMethod.GET)
	public String getPageBillList(Model model, @RequestParam(required = false) String message,
			@RequestParam(required = false) String alert) {
		List<BillEntity> listBill = billRepository.findAll();
		model.addAttribute("ListBill", listBill);
		if (message != null) {
			model.addAttribute("alert", alert);
			model.addAttribute("message", message);
		}
		return "admin/bill-list";
	}

	@RequestMapping(value = { "/admin/bill/edit" }, method = RequestMethod.GET)
	public String getPageBillEdit(Model model, @RequestParam Long id) {
		BillEntity billEntity = billRepository.findOne(id);
		FormOrder form = modelMapper.map(billEntity, FormOrder.class);
		model.addAttribute("bill", form);
		return "admin/bill-edit";
	}

	@RequestMapping(value = { "/admin/bill/edit" }, method = RequestMethod.POST)
	public String editBill(@ModelAttribute("bill") @Valid FormOrder bill, BindingResult bindingResult, Model model) {
		BillEntity billEntity = billRepository.findOne(bill.getId());
		billEntity.setStatus(bill.getStatus());
		
		billRepository.save(billEntity);
		return "redirect:/admin/bill/list?message=edit&alert=success";
	}

	@RequestMapping(value = { "/admin/bill/delete" }, method = RequestMethod.GET)
	public String deleteBill(Model model, @RequestParam Long id) {
		BillEntity isExistBill = billRepository.findOne(id);
		if (isExistBill == null) {
			return "redirect:/admin/bill/list?message=delete&alert=danger";
		} else {
			try {
				billRepository.delete(id);
				return "redirect:/admin/bill/list?message=delete&alert=success";
			} catch (Exception e) {
				return "redirect:/admin/bill/list?message=delete&alert=danger";
			}
		}
	}
}
