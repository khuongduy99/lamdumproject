package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.entity.BillEntity;
import com.springmvc.entity.BrandEntity;
import com.springmvc.entity.ProductEntity;
import com.springmvc.entity.UserEntity;
import com.springmvc.repository.BillRepository;
import com.springmvc.repository.BrandRepository;
import com.springmvc.repository.ProductRepository;
import com.springmvc.repository.UserRepository;

@Controller
public class BaseController {
	@Autowired
	private BrandRepository brandRepository;

	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private BillRepository billRepository;
	
	@Autowired
	private UserRepository userRepository;

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String home(Model model, @RequestParam(required = false) String login) {
		List<ProductEntity> listProductSale = productRepository.findAllProductSaleByStatusAndLimit("active", 10);
		model.addAttribute("ListProductSale", listProductSale);

		List<ProductEntity> listProductHot = productRepository.findAllByStatusAndLimit("active", 10);
		model.addAttribute("ListProductHot", listProductHot);
		if (login != null) {
			model.addAttribute("login", login);
		}

		return "index";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(Model model) {
		return "/admin/index";
	}
	
	@RequestMapping(value = "/don-hang", method = RequestMethod.GET)
	public String getListBillPage(Model model, HttpServletRequest request) {
		if(request.getUserPrincipal() != null) {
			UserEntity user = userRepository.findByUsername(request.getUserPrincipal().getName());
			List<BillEntity> listBill = billRepository.findAllByUserId(user.getId());
			model.addAttribute("ListBill", listBill);
			return "don-hang";
		} else {
			return "redirect:/";
			
		}
	}

	@RequestMapping(value = { "/chi-tiet-sp" }, method = RequestMethod.GET)
	public String getDetailProduct(Model model, @RequestParam String code) {
		ProductEntity product = productRepository.findByCode(code);
		String[] images = product.getImages().split("delimiter99image");
		model.addAttribute("images", images);
		model.addAttribute("product", product);
		return "chi-tiet-san-pham";
	}

	@RequestMapping(value = { "/phan-loai" }, method = RequestMethod.GET)
	public String getStoreProduct(Model model, @RequestParam(required = false) Boolean gender,
			@RequestParam(required = false) Long brandId) {
		List<BrandEntity> listBrand = brandRepository.findAll();
		model.addAttribute("ListBrand", listBrand);

		if (gender != null && brandId != null) {
			BrandEntity brandEntity = brandRepository.findOne(brandId);
			String title = "";
			if (gender == true) {
				title = "GIÀY " + brandEntity.getName() + " NAM";

			} else {
				title = "GIÀY " + brandEntity.getName() + " NỮ";
			}
			model.addAttribute("TitleProduct", title);
			List<ProductEntity> listProduct = productRepository.findAllByIsMaleAndBrandIdAndStatus(gender, brandId,
					"active");
			model.addAttribute("ListProduct", listProduct);
			return "san-pham";
		}

		if (gender != null) {
			if (gender == true) {
				model.addAttribute("TitleProduct", "GIÀY NAM");
			} else {
				model.addAttribute("TitleProduct", "GIÀY NỮ");
			}
			List<ProductEntity> listProduct = productRepository.findAllByIsMaleAndStatus(gender, "active");
			model.addAttribute("ListProduct", listProduct);
			return "san-pham";
		}

		if (brandId != null) {
			BrandEntity brandEntity = brandRepository.findOne(brandId);
			model.addAttribute("TitleProduct", "GIÀY " + brandEntity.getName());
			List<ProductEntity> listProduct = productRepository.findAllByBrandIdAndStatus(brandId, "active");
			model.addAttribute("ListProduct", listProduct);
			return "san-pham";
		}
		if (gender == null && brandId == null) {
			model.addAttribute("TitleProduct", "GIÀY ĐANG KHUYẾN MÃI");
			List<ProductEntity> listProduct = productRepository.findAllProductSaleByStatus("active");
			model.addAttribute("ListProduct", listProduct);
		}
		return "san-pham";
	}

}
