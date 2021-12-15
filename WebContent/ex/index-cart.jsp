<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<base href="${pageContext.request.contextPath}/ex/">
<meta charset="UTF-8">
<title>Cart | Học lập trình web cùng cô Mai Anh Thơ</title>
<link rel="stylesheet" href="css/cart.css">
</head>

<body>


<a href="index.jsp"><input class="home" type="submit" value="Home"></a>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:forEach var="product" items="${products}">
		<div class="player">

			<div class="imgBx">
				<img src="image/music-4.jpg">
			</div>
			<br>
			<div class="content">
				<h3>
					<c:out value='${product.description}' />
				</h3>
				<br>
				<h4>${product.priceCurrencyFormat}</h4>
			</div>
			<br>
			<form action="cart" method="post">
				<input type="hidden" name="productCode"
					value="<c:out value='${product.code}'/>"> <input
					type="submit" value="Add to Cart">
			</form>
			<audio controls>
				<source src="sound/8601/no_difference.mp3" type="audio/mp3">
			</audio>
		</div>
	</c:forEach> 



</body>

</html>