<%-- 
    Document   : login.jsp
    Created on : Feb 12, 2025, 8:07:43 PM
    Author     : Huy
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | EduOnline</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/login.css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <%@ include file="header.jsp" %>

        <div class="login-container" id="loginContainer">
            <!-- Sign In Form -->
            <div class="form-container sign-in-container">
                <div class="form">
                    <h2 class="text-center fw-bold">Log in</h2>
                    <p class="text-center">
                        <a href="signupstudent.jsp" class="text-center-student">Sign up as a student</a>
                        <a href="signuptutor.jsp" class="text-center-student">Sign up as a tutor</a>
                    </p>
                    <div class="social-login">
                        <button class="btn btn-outline-dark w-100 d-flex align-items-center justify-content-center">
                            <i class="fab fa-google me-2"></i> Continue with Google
                        </button>
                    </div>
                    <div class="separator d-flex align-items-center my-3">
                        <hr class="flex-grow-1">
                        <span class="mx-2 text-or">or</span>
                        <hr class="flex-grow-1">
                    </div>


                    <form action="login" method="post" id="loginForm">
                        <!--                        <div class="mb-3 text-start">
                                                    <label>Email</label>
                                                    <input name="email" type="email" class="form-control"  placeholder="Your email" required>
                                                </div>-->
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input value="${emailCookie}" name="email" type="email" class="form-control" id="email"
                                   placeholder="Email" required>
                        </div>

                        <!--                        <div class="mb-3 text-start">
                                                    <label>Password</label>
                                                    <div class="input-group">
                                                        <input name = "password" type="password" class="form-control"  id="loginPassword" placeholder="Your password" required>
                                                        <div class="input-group-text password-toggle" onclick="togglePassword('loginPassword')">
                                                            <i class="fas fa-eye"></i>
                                                        </div>
                                                    </div>
                                                </div>-->

                        <div class="mb-3">
                            <label for="password" class="form-label">Mật khẩu</label>
                            <input value="${passwordCookie}" name="password" type="password" class="form-control"
                                   id="password" placeholder="Mật khẩu" required>
                        </div>         


                        <!-- forgot password-->         
                        <div class="d-flex justify-content-between align-items-center">
                            <a href="forgotpassword.jsp" class="text-decoration-none">Forgot your password?</a>
                        </div>

                        <!-- Remember me--> 
                        <div class="form-check my-3 text-start">
                            <input type="checkbox" class="form-check-input" id="rememberMe">
                            <label name="rememberMe" class="form-check-label" for="rememberMe">Remember me</label>
                        </div>



                        <button type="submit" class="btn btn-primary w-100">Log in</button>
                    </form>
                </div>
            </div>

            <!-- Sign Up Form -->
            <div class="form-container sign-up-container">
                <div class="form">
                    <h2 class="text-center fw-bold">Sign Up</h2>
                    <p class="text-center">
                        Already have an account? <a href="#" onclick="toggleSignUp()">Log in</a>
                    </p>
                    <div class="social-login">
                        <button class="btn btn-outline-dark w-100 d-flex align-items-center justify-content-center">
                            <i class="fab fa-google me-2"></i> Continue with Google
                        </button>
                    </div>
                    <div class="separator d-flex align-items-center my-3">
                        <hr class="flex-grow-1">
                        <span class="mx-2 text-or">or</span>
                        <hr class="flex-grow-1">
                    </div>
                    <form action="registerServlet" method="post">
                        <div class="mb-3 text-start">
                            <label>Full Name</label>
                            <input type="text" class="form-control" name="fullname" placeholder="Your full name" required>
                        </div>
                        <!-- Email -->
                        <div class="mb-3 text-start">
                            <label>Email</label>
                            <input type="email" class="form-control" placeholder="Your email">
                        </div>

                        <!-- Password -->
                        <div class="mb-3 text-start">
                            <label>Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control" placeholder="Your password">
                                <div class="input-group-text password-toggle">
                                    <i class="fas fa-eye"></i>
                                </div>
                            </div>
                        </div>

                        <!-- Forgot Password -->
                        <div class="d-flex justify-content-between align-items-center">
                            <a href="#" class="forgot-password">Forgot your password?</a>
                        </div>

                        <!-- Log in button -->
                        <button class="btn-login">Log in</button>
                    </form>
                </div>
            </div>

            <!-- Overlay Panel -->
            <div class="overlay-container" id="overlayContainer">
                <div class="overlay">
                    <div class="text-wrapper">
                        <h2 id="overlayTitle">Hello, Friend!</h2>
                        <p id="overlayText">Enter your details and start your journey with us.</p>
                        <button class="btn btn-outline-light" onclick="toggleSignUp()">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>

        <%@ include file="footer.jsp" %>

        <script>
            function toggleSignUp() {
                document.getElementById("loginContainer").classList.toggle("right-panel-active");
                if (document.getElementById("loginContainer").classList.contains("right-panel-active")) {
                    document.getElementById("overlayTitle").innerText = "Welcome Back!";
                    document.getElementById("overlayText").innerText = "If you already have an account, log in now.";
                } else {
                    document.getElementById("overlayTitle").innerText = "Hello, Friend!";
                    document.getElementById("overlayText").innerText = "Enter your details and start your journey with us.";
                }
            }

            function togglePassword(fieldId) {
                let input = document.getElementById(fieldId);
                let icon = input.nextElementSibling.querySelector("i");
                if (input.type === "password") {
                    input.type = "text";
                    icon.classList.replace("fa-eye", "fa-eye-slash");
                } else {
                    input.type = "password";
                    icon.classList.replace("fa-eye-slash", "fa-eye");
                }
            }
        </script>
        <script src="resources/script/jquery-3.7.1.min.js"></script>
        <script>
            $(document).ready(() => {
                $('#loginForm').on('submit', (event) => {
                    event.preventDefault();

                    //Get data from form 
//                    var formData = {
//                        email: $('#email').val(),
//                        password: $('#password').val(),
//                        rememberMe: $('#rememberMe').val()
//                    };

                    var formData = {
                        email: $('input[name="email"]').val(),
                        password: $('input[name="password"]').val(),
                        rememberMe: $('#rememberMe').is(':checked') ? "on" : null // Kiểm tra xem checkbox có được chọn không
                    };

                    $.ajax({
                        url: 'login',
                        type: 'POST',
                        data: formData,
                        success: function (response) {
                            console.log("I'm in success function");
                            if (response.success) {
                                window.location.href = './home';
                            } else {
                                $('#error-message').text("Sai email hoặc mật khẩu, vui lòng thử lại");
                            }
                        },
                        error: function () {
                            alert('An error occurred');
                        }
                    });
                });
            });
        </script>
    </body>
</html>

