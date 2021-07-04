package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.entity.BillEntity;
import com.springmvc.entity.ProductEntity;
import com.springmvc.entity.UserEntity;
import com.springmvc.form.FormOrder;
import com.springmvc.model.Cart;
import com.springmvc.model.ProductModel;
import com.springmvc.repository.BillRepository;
import com.springmvc.repository.ProductRepository;
import com.springmvc.repository.UserRepository;
import com.springmvc.utils.SessionUtil;

@Controller
public class CartController {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BillRepository billRepository;
	
	@Autowired
	private ModelMapper modelMapper;
	
	@RequestMapping(value = {"/xem-gio-hang"}, method = RequestMethod.GET)
	public String getCartPage(Model model, HttpServletRequest request) {
		return "xem-gio-hang";
	}
	
	
	@RequestMapping(value = {"/them-vao-gio"}, method = RequestMethod.POST)
	  public String addToCart(Model model, HttpServletRequest request, @RequestParam(value = "id") Long id, @RequestParam(value = "qty") int qty, @RequestParam(value = "size") int size) {
		ProductEntity productEntity = productRepository.findOne(id);
	 	ProductModel product = modelMapper.map(productEntity, ProductModel.class);
	 	product.setSize(size);
	 	Cart cart = (Cart) SessionUtil.getInstance().getValue(request, "Cart");
		
			if(qty != 0) {
				if (cart == null) cart = new Cart();
				if (product != null) {
					cart.put(product, qty);
				}
			}
		SessionUtil.getInstance().putValue(request, "Cart", cart);
		cart.updateTotal();
		return "redirect:/chi-tiet-sp?code=" + productEntity.getCode(); 
	  }
	
	@RequestMapping(value = {"/cap-nhat-gio"}, method = RequestMethod.POST)
	  public String updateCart(Model model, HttpServletRequest request, @RequestParam(value = "id") Long id, @RequestParam(value = "qty") int qty, @RequestParam(value = "size") int size) {
		ProductEntity productEntity = productRepository.findOne(id);
	 	ProductModel product = modelMapper.map(productEntity, ProductModel.class);
	 	
	 	Cart cart = (Cart) SessionUtil.getInstance().getValue(request, "Cart");
		
	 	if(qty != 0) {
			if (cart == null)
				cart = new Cart();
			if (product != null) {
				cart.getProduct(product.getId()).updateQtyInCart(-cart.getProduct(product.getId()).getQtyInCart());
				cart.getProduct(product.getId()).updateSize(size);
				cart.put(product, qty);
			}
		}
		SessionUtil.getInstance().putValue(request, "Cart", cart);
		cart.updateTotal();
		return "redirect:/xem-gio-hang"; 
	  }
//	
	@RequestMapping(value = {"/xoa-khoi-gio"}, method = RequestMethod.GET)
	  public String remmoveProductInCart(Model model, HttpServletRequest request, @RequestParam(value = "id") Long id) {
		
	 	Cart cart = (Cart) SessionUtil.getInstance().getValue(request, "Cart");
		
	 	if (cart == null)
	 		cart = new Cart();
	 	cart.remove(id);
		SessionUtil.getInstance().putValue(request, "Cart", cart);
		cart.updateTotal();
		return "redirect:/xem-gio-hang"; 
	  }
//	
	@RequestMapping(value = {"/order"}, method = RequestMethod.POST)
	  public String getCheckoutPage(@ModelAttribute("order") FormOrder order) {
		BillEntity billEntity = modelMapper.map(order, BillEntity.class);
		billEntity.setId(null);
		billEntity.setStatus("process");
		billRepository.save(billEntity);
		return "redirect:/"; 
	  }
	
	@RequestMapping(value = {"/dat-hang"}, method = RequestMethod.GET)
	  public String order(Model model, HttpServletRequest request) {
		Cart cart = (Cart) SessionUtil.getInstance().getValue(request, "Cart");
		if(cart == null) {
			return "redirect:/xem-gio-hang";
		} 
		if(cart.getSize() == 0) {
			return "redirect:/xem-gio-hang";
		} 
		if(request.getUserPrincipal() != null) {
			String username = request.getUserPrincipal().getName();
			UserEntity user = userRepository.findByUsername(username);
			FormOrder form = new FormOrder();
			form.setUserId(user.getId());
			form.setFullname(user.getFullname());
			form.setPhone(user.getPhone());
			form.setTotalMoney(cart.getTotal());
			form.setAddress(user.getAddress());
			model.addAttribute("order", form);
			return "dat-hang";
		} else {
			return "redirect:/xem-gio-hang";
		}
	  }
	
	
}
