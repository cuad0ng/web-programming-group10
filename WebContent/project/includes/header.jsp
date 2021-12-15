<header>
	<!-- Header desktop -->
	<div class="container-menu-desktop">
		<!-- Topbar -->
		<div class="top-bar">
			<div class="content-topbar flex-sb-m h-full container">
				<div class="left-top-bar">Admin Email: admin@gmail.com | Admin Pass: 123</div>

				<div class="right-top-bar flex-w h-full">
					<a href="${pageContext.request.contextPath}/home" class="flex-c-m trans-04 p-lr-25"> Help & FAQs </a>
					<c:if test="${user == null}">
						<a href="login.jsp" class="flex-c-m trans-04 p-lr-25"> Login /
							Sign up </a>
					</c:if>
					<c:if test="${user != null}">
						<a href="#" class="flex-c-m trans-04 p-lr-25"> <c:out
								value="${user.getName()}" />
						</a>
						<a href="${pageContext.request.contextPath}/logout"
							class="flex-c-m trans-04 p-lr-25">Log Out</a>
					</c:if>
					<!-- <a href="#" class="flex-c-m trans-04 p-lr-25"> b</a> -->
				</div>
			</div>
		</div>

		<div class="wrap-menu-desktop">
			<nav class="limiter-menu-desktop container">

				<!-- Logo desktop -->
				<a href="${pageContext.request.contextPath}/home" class="logo"> <img
					src="images/icons/logo-hfshop.png" alt="IMG-LOGO">
				</a>

				<!-- Menu desktop -->
				<div class="menu-desktop">
					<ul class="main-menu">
						<li class="active-menu"><a href="${pageContext.request.contextPath}/home">Home</a> <!-- <ul class="sub-menu">
								<li><a href="index.html">Homepage 1</a></li>
								<li><a href="home-02.html">Homepage 2</a></li>
								<li><a href="home-03.html">Homepage 3</a></li>
							</ul></li> -->
						<li><a href="${pageContext.request.contextPath }/product">Shop</a></li>

						<!-- <li class="label1" data-label1="hot"><a
							href="shoping-cart.html">Features</a></li> -->

						<!-- <li><a href="blog.html">Blog</a></li> -->

<!-- 						<li><a href="about.html">About</a></li>

						<li><a href="contact.html">Contact</a></li> -->
					</ul>
				</div>

				<!-- Icon header -->
				<div class="wrap-icon-header flex-w flex-r-m">
					<div
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
						<i class="zmdi zmdi-search"></i>
					</div>
					<c:set var="count" value="0"></c:set>
					<c:forEach var="i" items="${sessionScope.cart}">
						<c:set var="count" value="${count + i.quantity}"></c:set>
					</c:forEach>
					<a href="${pageContext.request.contextPath}/cart"><div
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
						data-notify="${count}">


						<i class="zmdi zmdi-shopping-cart"></i>

					</div>
					</a>

				</div>

				<!-- <a href="#"
						class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti"
						data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
					</a> -->
		</div>
		</nav>
	</div>
	</div>

	<!-- Header Mobile -->
	<div class="wrap-header-mobile">
		<!-- Logo moblie -->
		<div class="logo-mobile">
			<a href="${pageContext.request.contextPath}/home"><img src="images/icons/logo-hfshop.png"
				alt="IMG-LOGO"></a>
		</div>

		<!-- Icon header -->
		<div class="wrap-icon-header flex-w flex-r-m m-r-15">
			<div
				class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
				<i class="zmdi zmdi-search"></i>
			</div>

			<div
				class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
				data-notify="2">
				<i class="zmdi zmdi-shopping-cart"></i>
			</div>

			<a href="#"
				class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti"
				data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
			</a>
		</div>

		<!-- Button show menu -->
		<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
			<span class="hamburger-box"> <span class="hamburger-inner"></span>
			</span>
		</div>
	</div>


	<!-- Menu Mobile -->
	<div class="menu-mobile">
		<ul class="topbar-mobile">
			<li>
				<div class="left-top-bar">Free shipping for standard order
					over $100</div>
			</li>

			<li>
				<div class="right-top-bar flex-w h-full">
					<a href="#" class="flex-c-m p-lr-10 trans-04"> Help & FAQs </a> <a
						href="#" class="flex-c-m p-lr-10 trans-04"> My Account </a> <a
						href="#" class="flex-c-m p-lr-10 trans-04"> Đề hình </a> <a
						href="#" class="flex-c-m p-lr-10 trans-04"> Để tên </a>
				</div>
			</li>
		</ul>

		<ul class="main-menu-m">
			<li><a href="index.html">Home</a>
				<ul class="sub-menu-m">
					<!-- <li><a href="index.html">Homepage 1</a></li>
					<li><a href="home-02.html">Homepage 2</a></li>
					<li><a href="home-03.html">Homepage 3</a></li> -->
				</ul> <span class="arrow-main-menu-m"> <i
					class="fa fa-angle-right" aria-hidden="true"></i>
			</span></li>

			<li><a href="product.html">Shop</a></li>

			<!-- <li><a href="shoping-cart.html" class="label1 rs1"
				data-label1="hot">Features</a></li>

			<li><a href="blog.html">Blog</a></li> -->

			<li><a href="about.html">About</a></li>

			<li><a href="contact.html">Contact</a></li>
		</ul>
	</div>

	<!-- Modal Search -->
	<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
		<div class="container-search-header">
			<button
				class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
				<img src="images/icons/icon-close2.png" alt="CLOSE">
			</button>

			<form action="${pageContext.request.contextPath}/search" method="get"
				class="wrap-search-header flex-w p-l-15">
				<button class="flex-c-m trans-04">
					<i class="zmdi zmdi-search"></i>
				</button>
				<input class="plh3" type="text" name="q" placeholder="Search...">
			</form>
		</div>
	</div>
</header>
