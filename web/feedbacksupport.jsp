<%-- 
    Document   : feedbacksupport
    Created on : Mar 6, 2025, 3:53:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Phản hồi & Hỗ trợ</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="mb-4">Phản hồi & Hỗ trợ</h2>

            <!-- Bộ lọc trạng thái -->
            <div class="mb-3">
                <label for="statusFilter">Lọc theo trạng thái:</label>
                <select id="statusFilter" class="form-control w-25">
                    <option value="all">Tất cả</option>
                    <option value="pending">Chưa xử lý</option>
                    <option value="in_progress">Đang xử lý</option>
                    <option value="resolved">Đã xử lý</option>
                </select>
            </div>

            <!-- Danh sách phản hồi -->
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Người gửi</th>
                        <th>Email</th>
                        <th>Nội dung</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${feedbackList}" var="fb">
                    <tr data-status="${fb.status}">
                        <td>${fb.senderName}</td>
                        <td>${fb.senderEmail}</td>
                        <td>${fb.message}</td>
                        <td>
                            <span class="badge ${fb.status == 'pending' ? 'badge-warning' : (fb.status == 'in_progress' ? 'badge-primary' : 'badge-success')}">
                                ${fb.status == 'pending' ? 'Chưa xử lý' : (fb.status == 'in_progress' ? 'Đang xử lý' : 'Đã xử lý')}
                            </span>
                        </td>
                        <td>
                            <a href="replyFeedback?id=${fb.id}" class="btn btn-info btn-sm">Trả lời</a>
                            <a href="updateFeedbackStatus?id=${fb.id}&status=resolved" class="btn btn-success btn-sm">Đánh dấu đã xử lý</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <script>
            document.getElementById("statusFilter").addEventListener("change", function () {
                var status = this.value;
                var rows = document.querySelectorAll("tbody tr");

                rows.forEach(row => {
                    if (status === "all" || row.getAttribute("data-status") === status) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                });
            });
        </script>
    </body>
</html>

