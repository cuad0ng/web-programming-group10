<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/survey.css">
</head>
<body>
	<div class="container">
	<div class="button">
			<a href="index.jsp"><input class="home" type="submit" value="Home"></a>
		</div>
		<div class="content">
			<div class="title">Thanks for taking our survey!</div>

			<p>Here is the information that you entered:</p>

			<label>Email:</label> <span><b>${user.email}</b></span><br> <label>First
				Name:</label> <span><b>${user.firstName}</b></span><br> <label>Last
				Name:</label> <span><b>${user.lastName}</b></span><br> <label>Heard
				From:</label> <span><b>${user.heardFrom}</b></span><br> <label>Updates:</label>
			<span><b>${user.wantsUpdates}</b></span><br>

			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<c:if test="${user.wantsUpdates == 'Yes'}">
				<label>Contact Via:</label>
				<span><b>${user.contactVia}</b></span>
			</c:if>
		</div>
	</div>
</body>
</html>