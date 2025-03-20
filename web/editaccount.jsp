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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
                            <h2>Edit <b>Account</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form name="editForm" action="editaccount" method="post" onsubmit="return validateForm()">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Account</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>User ID</label>
                                    <input value="${detail.userId}" name="uid" type="text" class="form-control" required readonly="">
                                </div>
                                <div class="form-group">
                                    <label>Role</label>
                                    <input value="${detail.roleId}" name="role" type="text" class="form-control" required >
                                </div>
                                <div class="form-group">
                                    <label>name</label>
                                    <input value="${detail.name}" name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>email</label>
                                    <input id="pass" value="${detail.email}" name="email" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>pass</label>
                                    <input value="${detail.password}" name="pass" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>phone</label>
                                    <input value="${detail.phone}" name="phone" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>gender</label>
                                    <input value="${detail.gender}" name="gender" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>address</label>
                                    <input value="${detail.address}" name="address" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>image</label>
                                    <input value="${detail.image}" name="image" type="text" class="form-control" >
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
    </body>
    <script>
        function validateForm() {
            var role = document.forms["editForm"]["role"].value;
            var name = document.forms["editForm"]["name"].value;
            var email = document.forms["editForm"]["email"].value;
            var pass = document.forms["editForm"]["pass"].value;
            var phone = document.forms["editForm"]["phone"].value;

            // Kiểm tra Role (chỉ được nhập 1,2,3,4)
            if (!/^[1-4]$/.test(role)) {
                alert("Role chỉ được nhập 1, 2, 3 hoặc 4");
                return false;
            }

            // Kiểm tra Name (phải bắt đầu bằng ký tự)
            if (!/^[A-Za-z].*/.test(name)) {
                alert("Tên phải bắt đầu bằng ký tự chữ cái");
                return false;
            }

            // Kiểm tra Email (phải có đuôi @gmail.com)
            if (!/^[a-zA-Z0-9._%+-]+@gmail\.com$/.test(email)) {
                alert("Email phải có đuôi @gmail.com");
                return false;
            }

            // Kiểm tra Password (độ dài lớn hơn 6)
            var pass = document.getElementById("pass").value.trim();
            if (pass.length <= 6) {
                alert("Mật khẩu phải có độ dài lớn hơn 6 ký tự");
                return false;
            }

            // Kiểm tra Phone (phải có đúng 10 số)
            if (!/^\d{10}$/.test(phone)) {
                alert("Số điện thoại phải có đúng 10 chữ số");
                return false;
            }

            return true; // Nếu tất cả đều hợp lệ, form sẽ được gửi đi
        }
    </script>

    <script>console.log("Mật khẩu nhập vào:", pass);
        console.log("Độ dài mật khẩu:", pass.length);</script>
</html>