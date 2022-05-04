<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>instagram</title>
    <link rel="stylesheet" href="/kangmin/static/css/style.css">
    <link rel="stylesheet" href="/kangmin/static/css/auth.css">
    <script src="https://kit.fontawesome.com/ede2458143.js" crossorigin="anonymous"></script>
</head>

<body>
    <section class="container">
        <main class="m-container">
            <article class="a-container">
                <div class="l-content">
                    <img src="/kangmin/static/images/auth_main.png" class="l-content-img">
                </div>
                <div class="r-content">
                    <div class="item-box">
                        <h1 class="b-logo"><img src="/kangmin/static/images/instagram_logo.png"></h1>
                        <div class="items-group">
                            <form action="/kangmin/auth/signin" method="post" class="items-group-form">
                                <div class="input-items">
                                    <label for="username">전화번호, 사용자 이름 또는 이메일</label>
                                    <input type="text" id="username" name="username">
                                </div>
                                <div class="input-items">
                                    <label for="password">비밀번호</label>
                                    <input type="password" id="password" name="password">
                                </div>
                                <div class="input-items">
                                    <button type="submit">로그인</button>
                                </div>
                                <div class="input-items">
                                    <div class="hr-sect"><span>또는</span></div>
                                </div>
                                <div class="input-items">
                                    <a href="#" class="facebook-login">
                                        <span><i class="fa-brands fa-facebook-square"></i>Facebook으로 로그인</span>
                                    </a>
                                </div>
                                </form>
                            </div>
                            <a href="#">비밀번호를 잊으셨나요?</a>
                        </div>
	                    <div class="item-box">
	                        <div class="signup-items">
	                            <p>계정이 없으신가요? <a href="/kangmin/auth/signup">가입하기</a></p>
	                        </div>
	                    </div>
                    </div>
                    <div class="r-content-footer">

                    </div>
        
            </article>
        </main>
        <footer class="f-container">

        </footer>
    </section>
    <script src="/kangmin/static/js/auth.js"></script>
</body>

</html>