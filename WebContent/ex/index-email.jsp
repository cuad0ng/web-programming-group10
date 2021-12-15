<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ex/include/header.jsp"%>
<section>
	<div class="color"></div>
	<div class="color"></div>
	<div class="color"></div>
	<div class="box">
		<div class="square" style="--i: 0"></div>
		<div class="square" style="--i: 1"></div>
		<div class="square" style="--i: 2"></div>
		<div class="square" style="--i: 3"></div>
		<div class="square" style="--i: 4"></div>
		<div class="container">
			<div class="form">

				<h2>Join our email list</h2>
				<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
				<c:if test="${message != null}">
					<p style="color: 	#DC143C;">
						<i>${message}</i>
					</p>
				</c:if>
				<form action="emailList" method="post">
					<input type="hidden" name="action" value="add">
					<div class="inputBox ">
						<input type="email" name="email" value="${user.email}"
							placeholder="Email ">
					</div>
					<div class="inputBox ">
						<input type="text" name="firstName" value="${user.firstName}"
							placeholder="First Name">
					</div>
					<div class="inputBox ">
						<input type="text" name="lastName" value="${user.lastName}"
							placeholder="Last Name">
					</div>
					<div class="inputBox ">
						<input type="submit" value="Join">

					</div>

					<p class="text">To join our email list, enter your name and
						email address above.</p>
					
				</form>
				<div class="inputBox ">
						<a href="index.jsp"><input type="submit" value="Home"></a>
					</div>
			</div>
		</div>


		<%@ include file="/ex/include/footer.jsp"%>