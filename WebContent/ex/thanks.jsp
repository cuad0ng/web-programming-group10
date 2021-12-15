<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ex/include/header.jsp"%>
<section>
	<div class="color"></div>
	<div class="color"></div>
	<div class="color"></div>
	<div class="box">
		<div class="square" style="-i: 0"></div>
		<div class="square" style="-i: 1"></div>
		<div class="square" style="-i: 2"></div>
		<div class="square" style="-i: 3"></div>
		<div class="square" style="-i: 4"></div>
		<div class="container">
			<div class="form">

				<h2>Thanks for joining our email list</h2>
				<p class="text">Here is the information that you entered</p>

				<div class="inputBox ">
					<label class="text">Email: </label> <span>${user.email}</span> <br>
					<label class="text">First Name:</label> <span>${user.firstName}</span>
					<br> <label class="text">Last Name:</label> <span>${user.lastName}</span>
					<br>
				</div>

				<div class="inputBox ">
					<p class="text">
						This email address was added to our list on <strong>${requestScope.currentDate1}</strong>
					</p>

					<p class="text">
						The first address on our list is <strong>${sessionScope.users[0].email}</strong><br>
						The second address on our list is <strong>${sessionScope.users[1].email}
						</strong>
					</p>

					<p class="text">
						For customer service, contact <strong>${initParam.custServEmail}</strong>
					</p>
				</div>
				<p class="text">
					<br>To enter another email address, click on the <strong>Back</strong>
					button in your browser or the <strong>Return</strong> button shown
					below.
				</p>
				<form action="" method="post">
					<input type="hidden" name="action" value="join">

					<div class="inputBox ">
						<input type="submit" value="Return">

					</div>


				</form>
				<div class="inputBox ">
					<a href="index.jsp"><input type="submit" value="Home"></a>
				</div>
			</div>
		</div>

		<%@ include file="/ex/include/footer.jsp"%>