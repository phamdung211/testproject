<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>User Management</title>

        <!-- Bootstrap & Icons -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

        <!-- jQuery & Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

        <style>
            body {
                font-family: 'Open Sans', sans-serif;
                background: #f5f7fa;
                color: #404e67;
            }
            .table-wrapper {
                width: 90%;
                margin: 30px auto;
                background: #fff;
                padding: 20px;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }
            .table-title {
                margin-bottom: 15px;
            }
            .table-title h2 {
                font-size: 22px;
                margin-bottom: 10px;
            }
            table.table {
                width: 100%;
            }
            table.table th, table.table td {
                text-align: center;
                vertical-align: middle;
                padding: 10px;
                border-color: #e9e9e9;
            }
            table.table th {
                background: #f8f9fa;
            }
            .btn-custom {
                border-radius: 50px;
                padding: 6px 15px;
            }
        </style>
    </head>
    <body>
        <div class="container-lg">
            <div class="table-wrapper">
                <div class="table-title d-flex justify-content-between align-items-center">
                    <h2>User <b>Management</b></h2>
                    <a href="#addEmployeeModal" class="btn btn-success btn-custom" data-toggle="modal">
                        <i class="material-icons">&#xE147;</i> <span>Add New Account</span>
                    </a>
                </div>

                <form action="rolefilter" method="GET" class="mb-3">
                    <label for="roleFilter">Filter by Role:</label>
                    <select name="roleId" id="roleFilter" class="form-control d-inline-block w-auto ml-2">
                        <option value="">All</option>
                        <c:forEach var="role" items="${ListR}">
                            <option value="${role.id}">${role.roleName}</option>
                        </c:forEach>
                    </select>
                    <button type="submit" class="btn btn-primary ml-2">Filter</button>
                </form>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Role</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Phone</th>
                            <th>Gender</th>
                            <th>Address</th>
                            <th>Image</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${ListA}" var="o">
                            <tr>
                                <td>${o.userId}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${o.roleId == 1}">Admin</c:when>
                                        <c:when test="${o.roleId == 2}">Staff</c:when>
                                        <c:when test="${o.roleId == 3}">Tutor</c:when>
                                        <c:when test="${o.roleId == 4}">Student</c:when>
                                        <c:otherwise>Unknown</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${o.name}</td>
                                <td>${o.email}</td>
                                <td>${o.password}</td>
                                <td>${o.phone}</td>
                                <td>${o.gender}</td>
                                <td>${o.address}</td>
                                <td>${o.image}</td>
                                <td>
                                    <a href="loadaccount?uid=${o.userId}" class="edit">
                                        <i class="material-icons" title="Edit">&#xE254;</i>
                                    </a>
                                    <a href="deleteaccount?uid=${o.userId}" class="delete" onclick="return confirm('Are you sure you want to delete this account?')">
                                        <i class="material-icons" title="Delete">&#xE872;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <a href="homeadmin.jsp" class="btn btn-primary btn-custom">Back to Home</a>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addaccount" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Account</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <!--                        <div class="form-group">
                                                        <label>User ID</label>
                                                        <input name="userid" type="text" class="form-control" required>
                                                    </div>-->
                            <div class="form-group">
                                <label>Role</label>
                                <input name="role" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input name="email" type="email" class="form-control" required>
                            </div>					
                            <div class="form-group">
                                <label>Password</label>
                                <input name="pass" type="text" class="form-control" required>
                            </div>					
                            <div class="form-group">
                                <label>Phone</label>
                                <input name="phone" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Gender</label>
                                <input name="gender" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input name="address" type="text" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" >
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

    </body>
</html>
