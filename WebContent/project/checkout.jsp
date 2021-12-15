<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Payment Form</title>
<base href="${pageContext.request.contextPath}/project/">
<link rel="stylesheet" href="css/checkout.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
	rel="stylesheet">
</head>

<body>
	<form method="post"
		action="${pageContext.request.contextPath}/cart?action=saveOrder">
		<div class="container">
			<h1>Confirm Your Payment</h1>
			<div class="second-row">
				<div class="owner">
					<h3>Address</h3>
					<div class="input-field">
						<input type="text" name="address">
					</div>
				</div>
			</div>

			<div class="second-row">
				<div class="card-number">
					<h3>Phone Number</h3>
					<div class="input-field">
						<input type="text" name="phone">
					</div>
				</div>
			</div>



			<input type="submit" name="CONFIRM">
		</div>
	</form>
</body>

</html>