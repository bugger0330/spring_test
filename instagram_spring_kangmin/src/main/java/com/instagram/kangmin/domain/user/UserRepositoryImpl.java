 package com.instagram.kangmin.domain.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class UserRepositoryImpl implements UserRepository {

	@Autowired //=객체 자동 주입 servlet-context.xml 의 id="sqlSessionTemplate" 객체가 주입된다
	private SqlSession session;
	
	

	private final String NAME_SPACE = "com.instagram.app.domain.user.UserRepository.";
	
	@Override
	public int signup(User user) {
		
		return session.insert(NAME_SPACE + "signup", user);
	}

	@Override
	public User signin(String username) {
		
		return session.selectOne(NAME_SPACE + "signin", username);
	}


}
