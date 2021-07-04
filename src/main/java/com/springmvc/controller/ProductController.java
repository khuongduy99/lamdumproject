package com.springmvc.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.entity.BrandEntity;
import com.springmvc.entity.ProductEntity;
import com.springmvc.form.FormProduct;
import com.springmvc.model.ImageModel;
import com.springmvc.repository.BrandRepository;
import com.springmvc.repository.ProductRepository;
import com.springmvc.utils.WebUtils;

@Controller
public class ProductController {
	@Autowired
	private BrandRepository brandRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private ModelMapper modelMapper;
	
	   @RequestMapping(value = { "/admin/product/list" }, method = RequestMethod.GET)
	   public String getPageProductList(Model model, @RequestParam(required = false) String message, @RequestParam(required = false) String alert) {
		   List<ProductEntity> listProduct = productRepository.findAll();
		   model.addAttribute("ListProduct", listProduct);
		   if(message != null) {
			   model.addAttribute("alert", alert);
			   model.addAttribute("message", message);
		   }
		   
	       return "admin/product-list";
	   }
	   
	   @RequestMapping(value = { "/admin/product/add" }, method = RequestMethod.GET)
	   public String getPageProductList(HttpServletRequest request, Model model) {
		   model.addAttribute("product", new FormProduct());
		   List<BrandEntity> listBrand = brandRepository.findAllByStatus("active");
		   model.addAttribute("ListBrand", listBrand);
		   
		   
	       return "admin/product-add";
	   }
	   
	   
	   @RequestMapping(value = {"/admin/product/images"})
		  @ResponseBody
		  public List<ImageModel> getImages(Model model, HttpServletRequest request, @RequestParam(value = "start") int start) {
	   String root = request.getServletContext().getRealPath("/WEB-INF/resources/images/products/shoe");
	   File directoryPath = new File(root);
	   List<ImageModel> listImage = new ArrayList<ImageModel>();
		File files[] = directoryPath.listFiles();
		int id = 0;
		int length = start + 18;
		int totalImage = files.length;
		int totalPage = (int) Math.ceil((double) totalImage / 18);
		if(length > files.length) {
			for(int i = start; i < files.length; i++) {
				File file = files[i];
				listImage.add(new ImageModel(id, file.getName(), "/images/products/shoe/" + file.getName(),totalImage, totalPage) );
			}
		} else {
			for(int i = start; i < length; i++) {
				File file = files[i];
				listImage.add(new ImageModel(id, file.getName(), "/images/products/shoe/" + file.getName(), totalImage, totalPage));
			}
		}
		
		return listImage;
		  }
	   
	   @RequestMapping(value = { "/admin/product/edit" }, method = RequestMethod.GET)
	   public String getPageBrandEdit(Model model, @RequestParam Long id) {
		   ProductEntity productEntity = productRepository.findOne(id);
		   FormProduct form = modelMapper.map(productEntity, FormProduct.class);
		   if(productEntity.isMale()) form.setGender("male");
		   if(!productEntity.isMale()) form.setGender("female");
		   String [] images = new String[4];
		   for(int i = 0; i < images.length; i++) {
			   images[i] = "/images/default-image.jpg";
		   }
		   
		   String [] imagesFormDB = productEntity.getImages().split("delimiter99image");
		   for(int i = 0; i < imagesFormDB.length; i++) {
			   images[i] = imagesFormDB[i];
		   }
		   form.setImages(images);
		   model.addAttribute("product", form);
		   List<BrandEntity> listBrand = brandRepository.findAllByStatus("active");
		   model.addAttribute("ListBrand", listBrand);
	       return "admin/product-edit";
	   }
	   
	   @RequestMapping(value = { "/admin/product/add" }, method = RequestMethod.POST)
	   public String addProduct(@ModelAttribute("product") @Valid FormProduct product, BindingResult bindingResult, Model model) {
		   String code = WebUtils.formatCode(product.getName());
		   ProductEntity isExistProduct = productRepository.findByCode(code);
		   if(isExistProduct != null) {
			   	model.addAttribute("error", "Tên này đã tồn tại. Vui lòng thử tên khác");
			   	List<BrandEntity> listBrand = brandRepository.findAllByStatus("active");
				model.addAttribute("ListBrand", listBrand);
				return "admin/product-add";
			}
		   
		   if(product.getSale() > product.getPrice()) {
			   	model.addAttribute("error", "Giá khuyến mãi phải nhỏ hơn giá niêm yết");
			   	List<BrandEntity> listBrand = brandRepository.findAllByStatus("active");
				model.addAttribute("ListBrand", listBrand);
				return "admin/product-add";
			}
		   
		   if (bindingResult.hasErrors() ) {
			   List<BrandEntity> listBrand = brandRepository.findAllByStatus("active");
			   model.addAttribute("ListBrand", listBrand);
				return "admin/product-add";
			}else {
				ProductEntity productEntity = modelMapper.map(product, ProductEntity.class);
				if(product.getGender().equals("male")) {
					productEntity.setMale(true);
				} else {
					productEntity.setMale(false);
				}
				String images = "";
				for(String url : product.getImages()) {
					if(url != null && !url.equals("")) {
						images += url + "delimiter99image";
					}
				}
				productEntity.setImages(images);
				productEntity.setCode(WebUtils.formatCode(productEntity.getName()));
				productEntity.setStatus("active");
				productRepository.save(productEntity);
				return "redirect:/admin/product/list?message=add&alert=success";
			}
	   }
	   
	   @RequestMapping(value = { "/admin/product/edit" }, method = RequestMethod.POST)
	   public String editProduct(@ModelAttribute("brand") @Valid FormProduct product, BindingResult bindingResult, Model model) {
		   String code = WebUtils.formatCode(product.getName());
		   ProductEntity oldProduct = productRepository.findOne(product.getId());
		   ProductEntity isExistProduct = productRepository.findByCode(code);
		   if(isExistProduct != null && !isExistProduct.getCode().equals(oldProduct.getCode()) ) {
				bindingResult.addError(new ObjectError("name","Tên này đã tồn tại. Vui lòng thử tên khác"));
				List<BrandEntity> listBrand = brandRepository.findAllByStatus("active");
				model.addAttribute("ListBrand", listBrand);
				return "admin/product-edit";
			}
		   
		   if(product.getSale() > product.getPrice()) {
			   	model.addAttribute("error", "Giá khuyến mãi phải nhỏ hơn giá niêm yết");
			   	List<BrandEntity> listBrand = brandRepository.findAllByStatus("active");
				model.addAttribute("ListBrand", listBrand);
				return "admin/product-edit";
			}
		   
		   if (bindingResult.hasErrors() ) {
			    List<BrandEntity> listBrand = brandRepository.findAllByStatus("active");
				model.addAttribute("ListBrand", listBrand);
				return "admin/product-edit";
			}else {
				ProductEntity productEntity = modelMapper.map(product, ProductEntity.class);
				String images = "";
				for(String url : product.getImages()) {
					if(url != null && !url.equals("")) {
						images += url + "delimiter99image";
					}
				}
				productEntity.setImages(images);
				productEntity.setCode(code);
				if(product.getGender().equals("male")) {
					productEntity.setMale(true);
				} else {
					productEntity.setMale(false);
				}
				productRepository.save(productEntity);
				return "redirect:/admin/product/list?message=edit&alert=success";
			}
	   }
	   
	   @RequestMapping(value = { "/admin/product/delete" }, method = RequestMethod.GET)
	   public String deleteProduct(Model model, @RequestParam Long id) {
		   ProductEntity isExistProduct = productRepository.findOne(id);
		   if(isExistProduct == null) {
			   return "redirect:/admin/product/list?message=delete&alert=danger";
			} else {
				try {
					productRepository.delete(id);
					return "redirect:/admin/product/list?message=delete&alert=success";
				} catch (Exception e) {
					return "redirect:/admin/product/list?message=delete&alert=danger";
				}
			}
	   }
}
