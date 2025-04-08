<%-- 
    Document   : resetPassword
    Created on : Apr 8, 2025, 7:35:22 PM
    Author     : FPT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100..900&family=Gilda+Display&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #F1EDE8;
            --text-dark: #1C1C1C;
            --border-gray: #BBBBBB;
        }
        
        body {
            background: var(--bg-color);
            font-family: 'Roboto', sans-serif;
        }
        
        .forgot-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .forgot-box {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 700px;
            width: 100%;
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            overflow: hidden;
        }
        
        .forgot-image {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            text-align: center;
        }
        
        .forgot-image img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }
        
        .forgot-form {
            flex: 1;
            padding: 20px;
            text-align: center;
        }
        
        .forgot-form h1 {
            font-family: 'Gilda Display', serif;
            font-size: 16px;
            margin-bottom: 20px;
        }
        
        .input-group {
            position: relative;
            margin-bottom: 20px;
        }
        
        .input-group input {
            width: 100%;
            padding: 10px 15px 10px 40px;
            border: 1px solid var(--border-gray);
            border-radius: 5px;
            font-size: 16px;
        }
        
        .input-group i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--border-gray);
            font-size: 18px;
        }
        
        .btn-forgot {
            background: var(--text-dark);
            color: #fff;
            padding: 10px;
            border-radius: 5px;
            width: 100%;
            font-size: 16px;
        }
        
        @media (max-width: 575.98px) {
            .forgot-container {
                align-items: flex-start;
                padding-top: 20px;
            }
            .forgot-box {
                flex-direction: column-reverse;
                align-items: center;
                text-align: center;
            }
            .forgot-image {
                order: 2;
            }
            .forgot-form {
                order: 1;
            }
        }
    </style>
</head>

<body>
    <div class="forgot-container">
        <div class="forgot-box">
            <div class="forgot-image">
                <img src="https://assets.astro-charts.com/site/lyra.png" alt="Astro Chart">
            </div>
            <div class="forgot-form">
                <h1>Forgotten your password? Please enter your email below to reset it.</h1>
                <form action="./reset-password" method="POST">
                     <div class="input-group">
                        <input type="hidden" name="username" value="${username}">
                    </div>
                    <div class="input-group">
                        <i class="fa-solid fa-key"></i>
                        <input type="password" name="newPassword" placeholder="New Password" required>
                    </div>
                    <div class="input-group">
                        <i class="fa-solid fa-key"></i>
                        <input type="password" name="confirmPassword" placeholder="Comfirm Password" required>
                    </div>
                        <button class="btn btn-forgot" type="submit">RESET PASSWORD</button>
                </form>
                <c:if test="${message ne 'success'}">
                    <p style="color: red;">${message}</p>
                </c:if>
            </div>
        </div>
    </div>
</body>

<% 
    String msg = (String) request.getAttribute("message"); 
    if ("success".equals(msg)) {
%>
    <script>
        alert("Đặt lại mật khẩu thành công! Bạn sẽ được chuyển đến trang đăng nhập.");
        window.location.href = "login.jsp";
    </script>
<% 
    } 
%>

</html>

