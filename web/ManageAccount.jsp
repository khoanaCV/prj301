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
                                    <h2>Manage <b>Account</b></h2>
                                </div>
                                <div class="col-sm-6">
                                    <a href="Signup.jsp" class="btn">
                                        <button class="btn btn-success btn-block" type="button" id="btn-signup">
                                    <i class="material-icons">&#xE147;</i> <span>Add New Account</span>
                                </button>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>uID</th>
                                    <th>user</th>
                                    <th>pass</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listA}" var="o">
                                    <tr>
                                        <td>${o.id}</td>
                                        <td>${o.user}</td>
                                        <td>${o.pass}</td>
                                        <td>
                                            <a href="editAccount?user=${o.user}&pass=${o.pass}" class="edit"><i class="material-icons" title="Edit">&#xE254;</i></a>
                                            <a href="deleteAccount?id=${o.id}" class="delete"><i class="material-icons" title="Delete">&#xE872;</i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <a class="btn-dark" href="home"><button type="button" class="btn btn-primary">Back to home</button>

        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Account</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>user</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>pass</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>isSell</label>
                                <input name="price" type="text" class="form-control" required>
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