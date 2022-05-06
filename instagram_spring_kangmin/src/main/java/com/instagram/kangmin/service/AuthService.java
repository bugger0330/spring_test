package com.instagram.kangmin.service;

import com.instagram.kangmin.domain.user.User;
import com.instagram.kangmin.web.dto.SignupRequestDto;


public interface AuthService {

	public boolean signup(SignupRequestDto signupRequestDto);
	public boolean signin(String username, String password);
}
