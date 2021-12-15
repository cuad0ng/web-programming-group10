<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<base href="${pageContext.request.contextPath}/project/">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin | Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="manager.css">
</head>

<body>
    <div class="container admin">
        <div class="row mt-3">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 125px;" class="img-fluid " src="images/group.png" alt="">
                        </div>
                        <h1 class="text-uppercase text-muted">Users</h1>
                        <h1><c:out value="${userCount}"/></h1>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 125px;" class="img-fluid " src="images/options.png" alt="">
                        </div>
                        <h1 class="text-uppercase text-muted">Categories</h1>
                        <h1><c:out value="${categoryCount}"/></h1>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="container">
                            <img style="max-width: 125px;" class="img-fluid " src="images/package.png" alt="">
                        </div>
                        <h1 class="text-uppercase text-muted">Products</h1>
                        <h1><c:out value="${productCount}"/></h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-6">
                <a href="${pageContext.request.contextPath}/manageCategory">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="images/checklist.png" alt="">
                            </div>
                            <h1 class="text-uppercase text-muted admin">Manage Category</h1>

                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-6">
                <a href="${pageContext.request.contextPath}/manageProduct">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="images/product.png" alt="">
                            </div>
                            <h1 class="text-uppercase text-muted">Manage Product</h1>

                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</body>

</html>