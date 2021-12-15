<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/project/">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/64d58efce2.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/alert.css">
<title>Sign in & Sign up Form</title>
</head>

<body>

	<div class="container">

		<div class="forms-container">

			<div class="signin-signup">
				<c:if test="${message != null}">
					<div class="alert danger-alert">

						<h3>
							<c:out value="${message}" />
						</h3>

					</div>
				</c:if>
				<form action="${pageContext.request.contextPath}/login" method="post" class="sign-in-form">
					<h2 class="title">Sign in</h2>
					<div class="input-field">
						<i class="fas fa-envelope"></i> <input name="email" type="text"
							placeholder="Email" required/>
					</div>
					<div class="input-field">
						<i class="fas fa-lock"></i> <input name="password" type="password"
							placeholder="Password" required/>
					</div>
					<input type="submit" value="Login" class="btn solid" />
<!-- 					<p class="social-text">Or Sign in with social platforms</p>
					<div class="social-media">
						<a href="#" class="social-icon"> <i class="fab fa-facebook-f"></i>
						</a> <a href="#" class="social-icon"> <i class="fab fa-twitter"></i>
						</a> <a href="#" class="social-icon"> <i class="fab fa-google"></i>
						</a> <a href="#" class="social-icon"> <i
							class="fab fa-linkedin-in"></i>
						</a>
					</div> -->
				</form>
				<form action="${pageContext.request.contextPath}/register" class="sign-up-form">
					<h2 class="title">Sign up</h2>
					 <div class="input-field">
						<i class="fas fa-user"></i> <input type="text"
							placeholder="Name" name="name" required/>
					</div>
					<div class="input-field">
						<i class="fas fa-envelope"></i> <input type="email"
							placeholder="Email" name="email" required/>
					</div>
					<div class="input-field">
						<i class="fas fa-lock"></i> <input type="password"
							placeholder="Password" name="password" required/>
					</div>
					<input type="submit" class="btn" value="Sign up" />
<!-- 					<p class="social-text">Or Sign up with social platforms</p>
					<div class="social-media">
						<a href="#" class="social-icon"> <i class="fab fa-facebook-f"></i>
						</a> <a href="#" class="social-icon"> <i class="fab fa-twitter"></i>
						</a> <a href="#" class="social-icon"> <i class="fab fa-google"></i>
						</a> <a href="#" class="social-icon"> <i
							class="fab fa-linkedin-in"></i>
						</a>
					</div> -->
				</form>
			</div>
		</div>

		<div class="panels-container">
			<div class="panel left-panel">
				<div class="content">
					<h3>New here ?</h3>
					<p>Become a member to receive many voucher</p>
					<button class="btn transparent" id="sign-up-btn">Sign up</button>
				</div>
				<img src="img/log.svg" class="image" alt="" />
			</div>
			<div class="panel right-panel">
				<div class="content">
					<h3>One of us ?</h3>
					<p>Many promotions are waiting for you</p>
					<button class="btn transparent" id="sign-in-btn">Sign in</button>
				</div>
				<img src="img/register.svg" class="image" alt="" />
			</div>
		</div>
	</div>

	<script>
    const sign_in_btn = document.querySelector("#sign-in-btn");
    const sign_up_btn = document.querySelector("#sign-up-btn");
    const container = document.querySelector(".container");

    sign_up_btn.addEventListener("click", () => {
      container.classList.add("sign-up-mode");
    });

    sign_in_btn.addEventListener("click", () => {
      container.classList.remove("sign-up-mode");
    });
    </script>
</body>

</html>