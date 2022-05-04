package com.instagram.kangmin.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.instagram.kangmin.service.AuthService;
import com.instagram.kangmin.web.dto.SignupRequestDto;
import com.instagram.kangmin.web.util.SigninScript;
import com.instagram.kangmin.web.util.SignupScript;

@Controller
public class controller {
	
	@Autowired
	private AuthService authService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String startPage() {
		return "index";
	}
	
	@RequestMapping(value = "/auth/signin", method = RequestMethod.GET)
	public String getSignin() {
		return "auth/signin";
	}
	@RequestMapping(value = "/auth/signup", method = RequestMethod.GET)
	public String getSignup() {
		return "auth/signup";
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String getIndex() {
		return "index";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/auth/signup", method = RequestMethod.POST, produces = "text/html; charset=utf-8")
	public String signup(SignupRequestDto signupRequestDto) {
		boolean result = authService.signup(signupRequestDto);
		SignupScript script = new SignupScript();
		script.signupScript(result);
		
		return script.signupScript(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/auth/signin", method = RequestMethod.POST, produces = "text/html; charset=utf-8")
	public String signin(String username, String password) {
		SigninScript script = new SigninScript();

		
		return script.signinScript(authService.signin(username, password));
	}
	
	
	
	
	
	
	
	
}
