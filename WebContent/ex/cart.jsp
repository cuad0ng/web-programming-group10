<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<base href="${pageContext.request.contextPath}/ex/">
    <meta charset="UTF-8">
    <title>Cart | Học lập trình web cùng cô Mai Anh Thơ</title>
    
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
    <link rel="stylesheet" href="test1.css">
</head>
<style>


input {
    margin: 20px;
    background-color: crimson;
    border: none;
    width: 150px;
    height: 40px;
    border-radius: 15px;
    color: #fff;
}

i {
    margin-right: 10px;
}

input:focus,
button:focus,
.form-control:focus {
    outline: none;
    box-shadow: none;
}

.form-control:disabled,
.form-control[readonly] {
    background-color: #fff;
}

.table tr,
.table tr td {
    vertical-align: middle;
}

.button-container {
    display: flex;
    align-items: center;
}

.button-container .form-control {
    max-width: 80px;
    text-align: center;
    display: inline-block;
    margin: 0px 5px;
}

#myTable .form-control {
    width: auto;
    display: inline-block;
}

.cart-qty-plus,
.cart-qty-minus {
    width: 38px;
    height: 38px;
    background-color: #fff;
    border: 1px solid #ced4da;
    border-radius: .25rem;
}

.cart-qty-plus:hover,
.cart-qty-minus:hover {
    background-color: #5161ce;
    color: #fff;
}

.img-prdct {
    width: 50px;
    height: 50px;
    background-color: #5161ce;
    border-radius: 4px;
}

.img-prdct img {
    width: 100%;
}

thead tr {
    background-color: #343A40;
    color: white;
}

.img-prdct {
    width: 100px !important;
    height: 100px !important;
}

.cart-qty-plus {
    background-color: #00a5e8;
    color: white;
    font-weight: 600;
}

.cart-qty-minus {
    background-color: #00a5e8;
    color: white;
    font-weight: 600;
}

h2 {
    background: #16a085;
    padding: 10px 0px;
    font-weight: 600;
    color: #fff;
}

	
</style>
<body>
    
    <div class="container-fluid mt-5">

        <h2 class="mb-5 text-center">Your Cart</h2>

        <div class="row justify-content-center">
        <form action="" method="post">
  						<input type="hidden" name="action" value="shop">
  						<input type="submit" value="Continue Shopping">
					</form>
        
            <div class="col-md-8">
                <div class="table-responsive">
                	<p><b>To change the quantity</b>, enter the new quantity and click on the Update button.</p>
                    <table id="myTable" class="table">
                        <thead>
                            <tr>

                                <th>Description</th>
                                <th>Quantity</th>
                                

                                <th>Price</th>
                                <th class="text-right">
                                    <span id="amount" class="amount">Amount</span>
                                </th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
						<c:forEach var="item" items="${cart.items}">
                            <tr>
                                <td>
                                    <p><c:out value='${item.product.description}'/></p>
                                </td>

                                <td>
                                    <div class="button-container">
                                        <!-- <button class="cart-qty-plus" type="button" value="+">+</button> -->
                                             <form action="cart" method="post">
        									<input type="hidden" name="productCode" value="<c:out value='${item.product.code}'/>">
                                        	<input type="text" name="quantity"  id="quantity" class="qty form-control" value="<c:out value='${item.quantity}'/>" />
                                        <input type="submit" value="Update" style="width:80px;">
                                        <!-- <button class="cart-qty-minus" type="button" value="-">-</button> -->
                                    </form>
                                    </div>
                                </td>
                                
                                <td>
                                	${item.product.priceCurrencyFormat}
                                    <!-- <input type="text" value="72" class="price form-control" disabled> -->
                                </td>
                                <td align="right">
                                	${item.totalCurrencyFormat}
                                <!-- <td align="right">$ <span id="amount" class="amount">0</span> -->
                                </td>
                                <td>
                                	<form action="" method="post">
        								<input type="hidden" name="productCode" value="<c:out value='${item.product.code}'/>">
        								<input type="hidden" name="quantity" value="0">
                                		<input type="submit" value="Remove" style="width:80px;">
                                	</form>
                                </td>
                            </tr>
                            <!---- add more tr  ---------->

                            <!---- add more tr  ---------->
                            </c:forEach>
                        </tbody>
                        <!-- <tfoot>
                            <tr>
                                <td colspan="4"></td>
                                <td align="right">
                                    <strong>TOTAL = $  <span id="total" class="total">0</span>
                             </strong>
                                </td>
                            </tr>
                        </tfoot> -->
                        
                    </table>
                    

					<form action="" method="post">
  						<input type="hidden" name="action" value="checkout">
  						<input type="submit" value="Checkout">
					</form>
					<a href="index.jsp"><input type="submit" value="Home"></a>
                </div>
            </div>
        </div>
    </div>
    <script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js'></script>
    
</body>

</html>