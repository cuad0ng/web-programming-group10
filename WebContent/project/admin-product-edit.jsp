
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.request.contextPath}/project/">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap CRUD Data Table for Database with Modal Form</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="css/manage.css" rel="stylesheet" type="text/css" />
<style>
img {
	width: 200px;
	height: 120px;
}
</style>
<body>
	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							Edit <b>Product</b>
						</h2>
					</div>
					<div class="col-sm-6"></div>
				</div>
			</div>
		</div>
		<div id="editEmployeeModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="${pageContext.request.contextPath}/manageProduct?action=editProduct&pid=${product.id}" method="post" enctype="multipart/form-data">
						<div class="modal-header">
							<h4 class="modal-title">Edit Product</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>ID</label> <input value="${product.id}" name="id"
									type="text" class="form-control" readonly required>
							</div>
							<div class="form-group">
								<label>Name</label> <input value="${product.name}" name="name"
									type="text" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Image</label> <input  name="image"
									type="file" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Price</label> <input value="${product.price}" name="price"
									type="text" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Quantity</label>
								<input value="${product.quantity}" name="quantity" type="text" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Description</label>
								<textarea name="description" class="form-control" required>${product.description}</textarea>
							</div>
							<div class="form-group">
								<label>Category</label> <select name="category_id"
									class="form-select" aria-label="Default select example">
									<c:forEach var="c" items="${categories}">
									<option value="${c.id}">${c.title}</option>
								</c:forEach>
								</select>
							</div>

						</div>
						<div class="modal-footer">
							<input type="submit" class="btn btn-success" value="Edit">
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>

	<script>
		$(document).ready(function() {
			// Activate tooltip
			$('[data-toggle="tooltip"]').tooltip();

			// Select/Deselect checkboxes
			var checkbox = $('table tbody input[type="checkbox"]');
			$("#selectAll").click(function() {
				if (this.checked) {
					checkbox.each(function() {
						this.checked = true;
					});
				} else {
					checkbox.each(function() {
						this.checked = false;
					});
				}
			});
			checkbox.click(function() {
				if (!this.checked) {
					$("#selectAll").prop("checked", false);
				}
			});
		});
	</script>
</body>
</html>