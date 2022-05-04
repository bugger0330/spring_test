package com.instagram.kangmin.web.util;

public class SignupScript {
	
	public String signupScript(boolean result) {
		StringBuilder script = new StringBuilder();
		
		if(result) {
			script.append("<script>");
			script.append("alert(\"회원가입 완료.\");");
			script.append("location.replace(\"/kangmin/auth/signin\");"); // replace 히스토리가 삭제되서 뒤로가기가 안된다
			script.append("</script>");
		}else {
			script.append("<script>");
			script.append("alert(\"회원가입 실패.\");");
			script.append("history.back();"); // == location.href 히스토리가 살이있어서 뒤로가기가 가능하다
			script.append("</script>");
		}
		System.out.println("스크립트 완성 : " + script);
		return script.toString();
	}

}
