

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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
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
                            <h2>Edit <b>User</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editAccountSubmit" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit User Information</h4>
                               
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>Username</label>
                                    <input value="${u.user}" name="name" type="readonly" class="form-control" readonly>
                                </div>
                                <div class="form-group">
                                    <label>New password</label>
                                    <input id="pass" type="password" value="" name="pass" class="form-control" required>
                                </div>
                                 <div class="form-group">
                                    <label>Retype password</label>
                                    <input id="retype" type="password" value="" name="newpass" class="form-control" required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input id="editButton" type="submit" class="btn btn-success" value="Edit" disabled>
                                    
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <script>
            
            function checkEquality() {
                let pass = $("#pass");
                let retype = $("#retype");
                
                if (pass.val() !== retype.val()) {
                    $("#editButton").attr("disabled", true);
                    pass.addClass('is-invalid');
                    retype.addClass('is-invalid');
                } else {
                    $("#editButton").attr("disabled", false);
                    pass.removeClass('is-invalid');
                    retype.removeClass('is-invalid');
                }
                
            }
            
            window.onload = () => {
                
                let passBox = $("#pass");
                let retypeBox = $("#retype");
                
                passBox.on('keyup', checkEquality);
                retypeBox.on('keyup', checkEquality);
                console.log('it worked');
            };
        </script>

        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>