<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/project/">
<title>Shoping Cart</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="includes/link.html"%>
</head>
<body class="animsition">

	<!-- Header -->
	<%@ include file="includes/header.jsp"%>
	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2"> Your Cart </span>

				<div
					class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-01.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								White Shirt Pleat </a> <span class="header-cart-item-info"> 1
								x $19.00 </span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-02.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Converse All Star </a> <span class="header-cart-item-info"> 1
								x $39.00 </span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-03.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Nixon Porter Leather </a> <span class="header-cart-item-info">
								1 x $17.00 </span>
						</div>
					</li>
				</ul>

				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40">Total: $75.00</div>

					<div class="header-cart-buttons flex-w w-full">
						<a href="shoping-cart.html"
							class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							View Cart </a> <a href="shoping-cart.html"
							class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Check Out </a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- breadcrumb -->
	<!-- 	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="home" class="stext-109 cl8 hov-cl1 trans-04"> Home <i
				class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <span class="stext-109 cl4"> Shoping Cart </span>
		</div>
	</div> -->


	<!-- Shoping Cart -->
	<div class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">

				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">

					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">Product</th>
									<th class="column-2"></th>
									<th class="column-3">Price</th>
									<th class="column-4">Quantity</th>
									<th class="column-5">Total</th>
								</tr>
								<c:set var="subtotal" value="0"></c:set>
								<c:forEach var="item" items="${sessionScope.cart}">
									<c:set var="subtotal"
										value="${subtotal + item.product.getPrice() * item.quantity}"></c:set>
									<tr class="table_row">
										<td class="column-1">

											<div class="how-itemcart1">
												<img
													src="<c:out value='${pageContext.request.contextPath}/uploads/${item.product.getImage()}'/>"
													alt="IMG">
											</div>
											<form action="${pageContext.request.contextPath}/cart?action=remove&productId=${item.product.id}" method="post">
												
												<input type="submit" value="Remove">
											</form>

										</td>

										<td class="column-2">${item.product.getName()}</td>
										<td class="column-3">${item.product.getPrice()}</td>
										<td class="column-4">
											<div class="wrap-num-product flex-w m-l-auto m-r-0">
												<%-- <div
													class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
													<i class="fs-16 zmdi zmdi-minus"></i>
												</div>

												<input class="mtext-104 cl3 txt-center num-product"
													type="number" name="quantity"
													value="<c:out value='${item.quantity}'/>" id="quantity">

												<div
													class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
													<i class="fs-16 zmdi zmdi-plus"></i>
												</div> --%>
												<form action="${pageContext.request.contextPath}/cart?action=update&productId=${item.product.id}" method="post">
													<input
														type="number"  min="1" name="quantity"
														value="<c:out value='${item.quantity}'/>" id="quantity" required>
													<input type="submit" value="Update">
												</form>

											</div>
										</td>
										<td class="column-5"><c:out
												value='${item.product.getPrice() * item.quantity}' /></td>
									</tr>
								</c:forEach>

							</table>
						</div>

						<!-- 						<div
							class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<input
									class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5"
									type="text" name="coupon" placeholder="Coupon Code">

								<div
									class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
									Apply coupon</div>
							</div>

							<div
								class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
								Update
							</div>

						</div>
				 -->
					</div>
					</form>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div
						class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">Cart Totals</h4>

						<div class="flex-w flex-t bor12 p-b-13">
							<div class="size-208">
								<span class="stext-110 cl2"> Subtotal: </span>
							</div>

							<div class="size-209">
								<span class="mtext-110 cl2"> <c:out value="${subtotal}" />
								</span>
							</div>
						</div>

						<!-- 						<div class="flex-w flex-t bor12 p-t-15 p-b-30"> -->
						<!-- 							<div class="size-208 w-full-ssm"> -->
						<!-- 								<span class="stext-110 cl2"> Shipping: </span> -->
						<!-- 							</div> -->

						<!-- 							<div class="size-209 p-r-18 p-r-0-sm w-full-ssm"> -->
						<!-- 								<p class="stext-111 cl6 p-t-2">There are no shipping methods -->
						<!-- 									available. Please double check your address, or contact us if -->
						<!-- 									you need any help.</p> -->

						<!-- 								<div class="p-t-15"> -->
						<!-- 									<span class="stext-112 cl8"> Calculate Shipping </span> -->

						<!-- 									<div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9"> -->
						<!-- 										<select class="js-select2" name="time"> -->
						<!-- 											<option>Select a country...</option> -->
						<!-- 											<option>USA</option> -->
						<!-- 											<option>UK</option> -->
						<!-- 										</select> -->
						<!-- 										<div class="dropDownSelect2"></div> -->
						<!-- 									</div> -->

						<!-- 									<div class="bor8 bg0 m-b-12"> -->
						<!-- 										<input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" -->
						<!-- 											name="state" placeholder="State /  country"> -->
						<!-- 									</div> -->

						<!-- 									<div class="bor8 bg0 m-b-22"> -->
						<!-- 										<input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" -->
						<!-- 											name="postcode" placeholder="Postcode / Zip"> -->
						<!-- 									</div> -->

						<!-- 									<div class="flex-w"> -->
						<!-- 										<div -->
						<!-- 											class="flex-c-m stext-101 cl2 size-115 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer"> -->
						<!-- 											Update Totals</div> -->
						<!-- 									</div> -->

						<!-- 								</div> -->
						<!-- 							</div> -->
						<!-- 						</div> -->

						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2"> Total: </span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2"> <c:out value="${subtotal}" />
								</span>
							</div>
						</div>
						<c:if test="${sessionScope.cart.size() > 0}">
						<a href="${pageContext.request.contextPath}/cart?action=checkout"><button
								class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
								Order Now</button></a>
								</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- Footer -->
	<%@ include file="includes/footer.jsp"%>

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>