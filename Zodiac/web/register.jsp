<%-- 
    Document   : register
    Created on : Mar 22, 2025, 2:06:35 PM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Astro Charts</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <!-- <script src="https://www.google.com/recaptcha/api.js" async defer></script> -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gilda+Display&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@100..900&display=swap');

        :root {
            --color-text: #232323;
            --bg-1: #F1EDE8;
            --font-title: 'Gilda Display', serif;
            --font-body: 'Roboto', sans-serif;
        }

        * {
            padding: 0;
            margin: 0;
            border: 0;
            box-sizing: border-box;
        }

        body {
            background: var(--bg-1);
            font-family: var(--font-body);
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .signup-box {
            display: flex;
            background: #fff;
            width: 800px;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .left {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            padding-right: 20px;
        }

        .left img {
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
        }

        .left a {
            color: #232323;
            text-decoration: underline;
        }

        .right {
            flex: 1;
            padding-left: 20px;
        }

        .right h1 {
            font-family: var(--font-title);
            font-size: 28px;
            margin-bottom: 10px;
        }

        .right p {
            font-size: 14px;
            color: #7A7A7A;
            margin-bottom: 20px;
        }

        .google-signin {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            margin-bottom: 20px;
        }

        .google-signin img {
            cursor: pointer;
        }

        .or-text {
            text-align: left;
            font-size: 14px;
            color: #232323;
            margin-bottom: 10px;
        }

        .input-group {
            position: relative;
            margin-bottom: 15px;
            margin-top: 20px;
        }

        .input-group input {
            width: 100%;
            padding: 10px 15px 10px 40px;
            border: 1px solid #BBBBBB;
            border-radius: 5px;
            font-size: 16px;
        }

        .input-group i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #BBBBBB;
            font-size: 18px;
        }

        .g-recaptcha {
            margin-bottom: 20px;
        }

        .btn-signup {
            background: #232323;
            color: #fff;
            padding: 10px;
            border-radius: 5px;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
        }
        
        .message {
            display: block;
            text-align: left;
            color: red;
        }
        
        .success-popup {
    background-color: #d4edda;
    color: #155724;
    padding: 15px 20px;
    border: 1px solid #c3e6cb;
    border-radius: 8px;
    margin-top: 20px;
    font-size: 16px;
    font-weight: 500;
    display: flex;
    align-items: center;
    gap: 10px;
    animation: fadeIn 0.6s ease-out;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.success-popup i {
    color: #28a745;
    font-size: 18px;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}


        @media (max-width: 768px) {
            .signup-box {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }
            .left, .right {
                width: 100%;
                padding: 0;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="signup-box">
            <div class="left">
                <img src="https://assets.astro-charts.com/site/lyra.png" alt="Astro Chart">
                <a href="./login">Already have an account? Login here</a>
            </div>
            <div class="right">
                <h1>WELCOME</h1>
                <p class="inner-desc">Create a free account to save your astrology charts. Sign up using your Google account or by entering an email and password below.</p>
                <form method="POST" action="./create-user">
                    <div class="input-group">
                        <i class="fa-solid fa-user"></i>
                        <input type="text" name="username" placeholder="Your User Name" required>
                    </div>
                    <div class="input-group">
                        <i class="fa-solid fa-key"></i>
                        <input type="password" name="password" placeholder="Your Password" required>
                    </div>
                    <div class="input-group">
                        <i class="fa-solid fa-key"></i>
                        <input type="password" name="cfmpassword" placeholder="Your Comfirm Password" required>
                    </div>

                    <%
                        String message = (String) request.getAttribute("message");
                        String success = (String) request.getAttribute("success");
                    %>

                    <% if (message != null) {%>
                    <div class="error-popup">
                        <i class="fa-solid fa-circle-exclamation"></i>
                        <p><%= message%></p>
                    </div>
                    <% } %>

                    <% if (success != null) {%>
                    <div class="success-popup">
                        <i class="fa-solid fa-circle-check"></i>
                        <p><%= success%></p>
                    </div>
                    <script>
                        setTimeout(function () {
                            window.location.href = "login.jsp";
                        }, 3000);
                    </script>
                    <% }%>
                    <div class="g-recaptcha" data-sitekey="your-site-key"></div>
                    <button class="btn-signup" type="submit">SIGN UP</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
