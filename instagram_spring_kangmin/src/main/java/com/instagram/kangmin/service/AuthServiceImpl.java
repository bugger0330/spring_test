package com.instagram.kangmin.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.instagram.kangmin.auth.CheckId;
import com.instagram.kangmin.domain.user.User;
import com.instagram.kangmin.domain.user.UserRepository;
import com.instagram.kangmin.web.dto.SignupRequestDto;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private CheckId checkId;
	

	
	
	@Override
	public boolean signup(SignupRequestDto signupRequestDto) {
		int result = userRepository.signup(signupRequestDto.toEntity());
		return result != 0 ? true : false; // result != 0 과 같은것
	}


	@Override
	public boolean signin(String username, String password) {
		User user = checkId.checkUserId(username);
		if(BCrypt.checkpw(password, user.getPassword())) {
				
				return true;
			}
		return true;
	}





}
