<%-- 
    Document   : schedulemanager
    Created on : Mar 6, 2025, 3:42:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý lịch học</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="mb-4">Quản lý lịch học</h2>

            <!-- Bộ lọc và tìm kiếm -->
            <div class="row mb-3">
                <div class="col-md-4">
                    <input type="text" class="form-control" id="searchTutor" placeholder="Tìm theo tên gia sư...">
                </div>
                <div class="col-md-4">
                    <input type="text" class="form-control" id="searchStudent" placeholder="Tìm theo tên học viên...">
                </div>
                <div class="col-md-3">
                    <select class="form-control" id="filterStatus">
                        <option value="">Tất cả trạng thái</option>
                        <option value="pending">Chờ xác nhận</option>
                        <option value="confirmed">Đã xác nhận</option>
                        <option value="completed">Đã hoàn thành</option>
                        <option value="canceled">Đã hủy</option>
                    </select>
                </div>
                <div class="col-md-1">
                    <button class="btn btn-primary">Lọc</button>
                </div>
            </div>

            <!-- Bảng danh sách lịch học -->
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Gia sư</th>
                        <th>Học viên</th>
                        <th>Ngày học</th>
                        <th>Thời gian</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${scheduleList}" var="schedule">
                    <tr>
                        <td>${schedule.id}</td>
                        <td>${schedule.tutorName}</td>
                        <td>${schedule.studentName}</td>
                        <td>${schedule.date}</td>
                        <td>${schedule.time}</td>
                        <td>
                    <c:choose>
                        <c:when test="${schedule.status == 'pending'}"><span class="badge badge-warning">Chờ xác nhận</span></c:when>
                        <c:when test="${schedule.status == 'confirmed'}"><span class="badge badge-primary">Đã xác nhận</span></c:when>
                        <c:when test="${schedule.status == 'completed'}"><span class="badge badge-success">Đã hoàn thành</span></c:when>
                        <c:when test="${schedule.status == 'canceled'}"><span class="badge badge-danger">Đã hủy</span></c:when>
                    </c:choose>
                    </td>
                    <td>
                        <a href="editSchedule?scheduleId=${schedule.id}" class="btn btn-warning btn-sm">Sửa</a>
                        <a href="cancelSchedule?scheduleId=${schedule.id}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn hủy buổi học này?')">Hủy</a>
                    </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <!-- Nút thêm lịch học -->
            <button class="btn btn-success" data-toggle="modal" data-target="#addScheduleModal">Thêm lịch học</button>
        </div>

        <!-- Modal thêm lịch học -->
        <div class="modal fade" id="addScheduleModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addSchedule" method="POST">
                        <div class="modal-header">
                            <h4 class="modal-title">Thêm lịch học</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Gia sư</label>
                                <select name="tutorId" class="form-control">
                                    <c:forEach items="${tutorList}" var="tutor">
                                        <option value="${tutor.id}">${tutor.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Học viên</label>
                                <select name="studentId" class="form-control">
                                    <c:forEach items="${studentList}" var="student">
                                        <option value="${student.id}">${student.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Ngày học</label>
                                <input type="date" name="date" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Thời gian</label>
                                <input type="time" name="time" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Trạng thái</label>
                                <select name="status" class="form-control">
                                    <option value="pending">Chờ xác nhận</option>
                                    <option value="confirmed">Đã xác nhận</option>
                                    <option value="completed">Đã hoàn thành</option>
                                    <option value="canceled">Đã hủy</option>
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

