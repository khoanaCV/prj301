

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
                <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
                <link href="css/manager.css" rel="stylesheet" type="text/css" />
                <style>
                    img {
                        width: 200px;
                        height: 120px;
                    }
                </style>

                <body>
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="table-title bg-dark">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h2>Manage <b>Product</b></h2>
                                    </div>
                                    <div class="col-sm-6">
                                        <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Image</th>
                                        <th>Price</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listP}" var="o">
                                        <tr>
                                            <td>${o.id}</td>
                                            <td>${o.name}</td>
                                            <td>
                                                <img src="${o.image}">
                                            </td>
                                            <td>${o.price} $</td>
                                            <td>
                                                <a href="loadProduct?pid=${o.id}" class="edit"><i class="material-icons" title="Edit">&#xE254;</i></a>
                                                <a href="delete?pid=${o.id}" class="delete"><i class="material-icons" title="Delete">&#xE872;</i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <a href="home"><button type="button" class="btn btn-primary">Back to home</button></a>

                    </div>
                    <!-- Edit Modal HTML -->
                    <div id="addEmployeeModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="add" method="post">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Add Product</h4>
       
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input name="name" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Image</label>
                                            <input name="image" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Price</label>
                                            <input name="price" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Title</label>
                                            <textarea name="title" class="form-control" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Description</label>
                                            <textarea name="description" class="form-control" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Category</label>
                                            <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listCC}" var="o">
                                        <option value="${o.cid}">${o.cname}</option>
                                    </c:forEach>
                                </select>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                        <input type="submit" class="btn btn-success" value="Add">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>


                    <script src="js/manager.js" type="text/javascript"></script>
                </body>

            </html>