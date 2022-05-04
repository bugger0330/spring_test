package com.instagram.kangmin.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.instagram.kangmin.domain.user.User;
import com.instagram.kangmin.domain.user.UserRepository;

@Service
public class CheckIdImpl implements CheckId {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public User checkUserId(String username) {
		
		return userRepository.signin(username);
	}

}
