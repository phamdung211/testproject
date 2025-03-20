<%-- 
    Document   : home.jsp
    Created on : Feb 13, 2025, 12:52:36 AM
    Author     : Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="model.User" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Filter Panel</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/footer.css">
        <link rel="stylesheet" type="text/css" href="FilterPanel.css">
        <script>
            function toggleDropdown(id) {
                var dropdown = document.getElementById(id);
                dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
            }
            function selectOption(id, value) {
                document.getElementById(id).innerHTML = value + " &#9662;";
                toggleDropdown(id + "-list");
            }
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container mt-4">
            <h1 class="text-center">Chào mừng, <%= user.getName() %>!</h1>
            <div class="text-center mb-3">
                <a href="logout" class="btn btn-danger">Đăng xuất</a>
            </div>
        </div>
        <div class="container filter-panel-all">
            <div class='filter-panel'>
                <div class="filter-item">
                    <label for="language">I want to learn</label>
                    <select id="language" class="form-select">
                        <option>Russian</option>
                    </select>
                </div>
                <div class="filter-item">
                    <label for="price">Price per lesson</label>
                    <select id="price" class="form-select">
                        <option>$3 – $40+</option>
                    </select>
                </div>
                <div class="filter-item">
                    <label>Sort by</label>
                    <div class="sort-dropdown">
                        <button id="sort-button" onclick="toggleDropdown('sort-button-list')" class="btn btn-secondary">Sort by: Our top picks &#9662;</button>
                        <ul id="sort-button-list" class="dropdown-list list-unstyled" style="display: none;">
                            <li onclick="selectOption('sort-button', 'Our top picks')">Our top picks</li>
                            <li onclick="selectOption('sort-button', 'Popularity')">Popularity</li>
                            <li onclick="selectOption('sort-button', 'Price: highest first')">Price: highest first</li>
                            <li onclick="selectOption('sort-button', 'Price: lowest first')">Price: lowest first</li>
                            <li onclick="selectOption('sort-button', 'Number of reviews')">Number of reviews</li>
                            <li onclick="selectOption('sort-button', 'Best rating')">Best rating</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="container steps-container">
            <c:forEach var="step" items="${steps}">
                <div class="step-card text-center">
                    <div class="step-badge">Step ${step.id}</div>
                    <img src="${step.image}" alt="Step ${step.id}" class="step-image img-fluid" />
                    <h3 class="step-title">${step.title}</h3>
                    <p class="step-description">${step.description}</p>
                </div>
            </c:forEach>
        </div>
        <div class="container text-container">
            <h1 class="title text-center">Tìm một gia sư trực tuyến để giúp bạn trong việc học tập</h1>
            <h2 class="subtitle text-center">Các bài học trực tuyến với Preply diễn ra như thế nào?</h2>
            <ol class="lesson-list">
                <li><strong>Chọn gia sư:</strong> Bạn có thể sử dụng bộ lọc trong mục "Tìm gia sư" để thu hẹp kết quả tìm kiếm theo nhu cầu và phạm vi ngân sách của bạn.</li>
                <li><strong>Đặt buổi học đầu tiên:</strong> Khi bạn đã tìm được gia sư, bạn có thể đặt buổi học đầu tiên vào thời gian và ngày phù hợp với bạn.</li>
                <li><strong>Mua gói bài học:</strong> Nếu bạn thích bài học đầu tiên và muốn tiếp tục học với gia sư này, bạn có thể mua gói bài học và lên lịch học trực tuyến.</li>
                <li><strong>Trong và sau giờ học:</strong> Các bài học sẽ diễn ra trực tuyến trên Preply Space.</li>
                <li><strong>Xác nhận bài học và để lại đánh giá:</strong> Sau bài học, nền tảng sẽ gửi yêu cầu xác nhận bài học và đánh giá.</li>
            </ol>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/script/jquery-3.7.1.min.js"></script>
        <script src="resources/script/script.js"></script>
    </body>
</html>