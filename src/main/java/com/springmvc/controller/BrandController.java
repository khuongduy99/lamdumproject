package com.springmvc.controller;

import java.util.List;

import javax.validation.Valid;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.entity.BrandEntity;
import com.springmvc.form.FormBrand;
import com.springmvc.repository.BrandRepository;
import com.springmvc.utils.WebUtils;

@Controller
public class BrandController {
	
	@Autowired
	private BrandRepository brandRepository;
	
	@Autowired
	private ModelMapper modelMapper;
	
	   @RequestMapping(value = { "/admin/brand/list" }, method = RequestMethod.GET)
	   public String getPageBrandList(Model model, @RequestParam(required = false) String message, @RequestParam(required = false) String alert) {
		   List<BrandEntity> listBrand = brandRepository.findAll();
		   model.addAttribute("ListBrand", listBrand);
		   if(message != null) {
			   model.addAttribute("alert", alert);
			   model.addAttribute("message", message);
		   }
	       return "admin/brand-list";
	   }
	   
	   @RequestMapping(value = { "/admin/brand/add" }, method = RequestMethod.GET)
	   public String getPageBrandAdd(Model model) {
		   model.addAttribute("brand", new FormBrand());
	       return "admin/brand-add";
	   }
	   
	   @RequestMapping(value = { "/admin/brand/edit" }, method = RequestMethod.GET)
	   public String getPageBrandEdit(Model model, @RequestParam Long id) {
		   BrandEntity brandEntity = brandRepository.findOne(id);
		   FormBrand form = modelMapper.map(brandEntity, FormBrand.class);
		   model.addAttribute("brand", form);
	       return "admin/brand-edit";
	   }
	   
	   @RequestMapping(value = { "/admin/brand/add" }, method = RequestMethod.POST)
	   public String addBrand(@ModelAttribute("brand") @Valid FormBrand brand, BindingResult bindingResult, Model model) {
		   String code = WebUtils.formatCode(brand.getName());
		   BrandEntity isExistBrand = brandRepository.findByCode(code);
		   if(isExistBrand != null) {
			   	model.addAttribute("error", "Tên này đã tồn tại. Vui lòng thử tên khác");
				return "admin/brand-add";
			}
		   
		   if (bindingResult.hasErrors() ) {
				return "admin/brand-add";
			}else {
				BrandEntity brandEntity = modelMapper.map(brand, BrandEntity.class);
				brandEntity.setCode(WebUtils.formatCode(brandEntity.getName()));
				brandEntity.setStatus("active");
				brandRepository.save(brandEntity);
				return "redirect:/admin/brand/list?message=add&alert=success";
			}
	   }
	   
	   @RequestMapping(value = { "/admin/brand/edit" }, method = RequestMethod.POST)
	   public String editBrand(@ModelAttribute("brand") @Valid FormBrand brand, BindingResult bindingResult, Model model) {
		   String code = WebUtils.formatCode(brand.getName());
		   BrandEntity oldBrand = brandRepository.findOne(brand.getId());
		   BrandEntity isExistBrand = brandRepository.findByCode(code);
		   if(isExistBrand != null && !isExistBrand.getCode().equals(oldBrand.getCode()) ) {
				bindingResult.addError(new ObjectError("name","Tên này đã tồn tại. Vui lòng thử tên khác"));
				return "admin/brand-edit";
			}
		   
		   if (bindingResult.hasErrors() ) {
				return "admin/brand-edit";
			}else {
				BrandEntity brandEntity = modelMapper.map(brand, BrandEntity.class);
				brandEntity.setCode(code);
				brandRepository.save(brandEntity);
				return "redirect:/admin/brand/list?message=edit&alert=success";
			}
	   }
	   
	   @RequestMapping(value = { "/admin/brand/delete" }, method = RequestMethod.GET)
	   public String deleteBrand(Model model, @RequestParam Long id) {
		   BrandEntity isExistBrand = brandRepository.findOne(id);
		   if(isExistBrand == null) {
			   return "redirect:/admin/brand/list?message=delete&alert=danger";
			} else {
				try {
					brandRepository.delete(id);
					return "redirect:/admin/brand/list?message=delete&alert=success";
				} catch (Exception e) {
					return "redirect:/admin/brand/list?message=delete&alert=danger";
				}
			}
	   }
}
