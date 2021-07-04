package com.springmvc.controller;

import java.security.Principal;
import java.util.ArrayList;
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

import com.springmvc.entity.RoleEntity;
import com.springmvc.entity.UserEntity;
import com.springmvc.form.FormRegister;
import com.springmvc.repository.RoleRepository;
import com.springmvc.repository.UserRepository;
import com.springmvc.utils.EncrytedPasswordUtils;

@Controller
public class AuthenticController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private ModelMapper modelMapper;
	 
	   @RequestMapping(value = "/403", method = RequestMethod.GET)
	   public String accessDenied(Model model, Principal principal) {
	        
	       if (principal != null) {
	           model.addAttribute("message", "Hi " + principal.getName()
	                   + "<br> You do not have permission to access this page!");
	       } else {
	           model.addAttribute("msg",
	                   "You do not have permission to access this page!");
	       }
	       return "403Page";
	   }
	   
	   @RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	   public String register(Model model) {
		   model.addAttribute("register", new FormRegister());
	       return "dang-ky";
	   }
	   
	   @RequestMapping(value = { "/register" }, method = RequestMethod.POST)
	   public String addRegister(@ModelAttribute("register") @Valid FormRegister register, BindingResult bindingResult, Model model) {
		   UserEntity isExistUser = userRepository.findByUsername(register.getUsername());
		   if(isExistUser != null ) {
				bindingResult.addError(new ObjectError("name","Tên đăng nhập này đã tồn tại. Vui lòng thử tên khác"));
				
				return "dang-ky";
			}
		   
		   if (bindingResult.hasErrors() ) {
				return "dang-ky";
			}else {
				UserEntity userEntity = modelMapper.map(register, UserEntity.class);
				userEntity.setStatus("active");
				userEntity.setPassword(EncrytedPasswordUtils.encrytePassword(register.getPassword()));
				List<RoleEntity> roles = new ArrayList<RoleEntity>();
				RoleEntity roleUser = roleRepository.findByCode("user");
				roles.add(roleUser);
				userEntity.setRoles(roles);
				userRepository.save(userEntity);
				return "redirect:/?login=true";
			}
	   }
	   
}
