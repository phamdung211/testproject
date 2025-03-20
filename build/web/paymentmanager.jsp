<%-- 
    Document   : paymentmanager
    Created on : Mar 6, 2025, 3:44:23 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý thanh toán</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="mb-4">Quản lý thanh toán</h2>

            <!-- Bộ lọc và tìm kiếm -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <input type="text" class="form-control" id="searchStudent" placeholder="Tìm theo tên học viên...">
                </div>
                <div class="col-md-4">
                    <select class="form-control" id="filterStatus">
                        <option value="">Tất cả trạng thái</option>
                        <option value="pending">Chưa thanh toán</option>
                        <option value="paid">Đã thanh toán</option>
                        <option value="refunded">Hoàn tiền</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-primary">Lọc</button>
                </div>
            </div>

            <!-- Bảng danh sách thanh toán -->
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Học viên</th>
                        <th>Khóa học</th>
                        <th>Số tiền</th>
                        <th>Phương thức</th>
                        <th>Ngày thanh toán</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${paymentList}" var="payment">
                    <tr>
                        <td>${payment.id}</td>
                        <td>${payment.studentName}</td>
                        <td>${payment.courseName}</td>
                        <td>${payment.amount} VNĐ</td>
                        <td>${payment.method}</td>
                        <td>${payment.date}</td>
                        <td>
                    <c:choose>
                        <c:when test="${payment.status == 'pending'}"><span class="badge badge-warning">Chưa thanh toán</span></c:when>
                        <c:when test="${payment.status == 'paid'}"><span class="badge badge-success">Đã thanh toán</span></c:when>
                        <c:when test="${payment.status == 'refunded'}"><span class="badge badge-danger">Hoàn tiền</span></c:when>
                    </c:choose>
                    </td>
                    <td>
                        <a href="editPayment?paymentId=${payment.id}" class="btn btn-warning btn-sm">Sửa</a>
                        <a href="refundPayment?paymentId=${payment.id}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn hoàn tiền giao dịch này?')">Hoàn tiền</a>
                    </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <!-- Nút thêm thanh toán -->
            <button class="btn btn-success" data-toggle="modal" data-target="#addPaymentModal">Thêm thanh toán</button>
        </div>

        <!-- Modal thêm thanh toán -->
        <div class="modal fade" id="addPaymentModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addPayment" method="POST">
                        <div class="modal-header">
                            <h4 class="modal-title">Thêm thanh toán</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Học viên</label>
                                <select name="studentId" class="form-control">
                                    <c:forEach items="${studentList}" var="student">
                                        <option value="${student.id}">${student.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Khóa học</label>
                                <select name="courseId" class="form-control">
                                    <c:forEach items="${courseList}" var="course">
                                        <option value="${course.id}">${course.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Số tiền</label>
                                <input type="number" name="amount" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Phương thức thanh toán</label>
                                <select name="method" class="form-control">
                                    <option value="bank_transfer">Chuyển khoản ngân hàng</option>
                                    <option value="paypal">PayPal</option>
                                    <option value="credit_card">Thẻ tín dụng</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Trạng thái</label>
                                <select name="status" class="form-control">
                                    <option value="pending">Chưa thanh toán</option>
                                    <option value="paid">Đã thanh toán</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-success">Thêm</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </body>
</html>

