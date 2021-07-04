package com.springmvc.authentication;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.springmvc.entity.RoleEntity;
import com.springmvc.entity.UserEntity;
import com.springmvc.repository.UserRepository;
 
@Service
public class MyUserDetailsService implements UserDetailsService {
 
	 @Autowired
	    private UserRepository userDAO;
	 
	    @Override
	    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	        UserEntity user = userDAO.findByUsername(username);
	 
	        if (user == null) {
	            throw new UsernameNotFoundException("Tài khoản hoặc mật khẩu không đúng");
	        }
	         
	        // [USER,ADMIN,..]
	        List<String> roles = new ArrayList<String>();
	        for(RoleEntity role : user.getRoles()) {
	        	roles.add(role.getCode());
	        }
	         
	        List<GrantedAuthority> grantList= new ArrayList<GrantedAuthority>();
	        if(roles!= null)  {
	            for(String role: roles)  {
	                // ROLE_USER, ROLE_ADMIN,..
	                GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + role.toUpperCase());
	                grantList.add(authority);
	            }
	        }        
	         
	        UserDetails userDetails = (UserDetails) new User(user.getUsername(), //
	        		user.getPassword(),grantList);
	       
	        return userDetails;
	    }
     
}