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

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-box {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            overflow: hidden;
        }

        .login-image {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            text-align: center;
        }

        .login-image img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }

        .create-account {
            margin-top: 10px;
            text-decoration: underline;
            color: var(--text-dark);
        }

        .login-form {
            flex: 1;
            padding: 20px;
            text-align: center;
        }

        .login-form h1 {
            font-family: 'Gilda Display', serif;
            font-size: 28px;
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

        .forgot-password {
            font-size: 14px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .forgot-password a {
            color: var(--border-gray);
            text-decoration: none;
        }

        .message {
            display: block;
            text-align: left;
            color: red;
        }

        .btn-login {
            background: var(--text-dark);
            color: #fff;
            padding: 10px;
            border-radius: 5px;
            width: 100%;
            font-size: 16px;
        }

        .login-google {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 20px;
        }

        @media (max-width: 575.98px) {
            .login-container {
                align-items: flex-start;
                padding-top: 20px;
            }

            .login-box {
                flex-direction: column-reverse;
                align-items: center;
                text-align: center;
            }

            .login-image {
                order: 1;
            }

            .login-form {
                order: 2;
            }
        }
    </style>
</head>

<body>
    <div class="login-container">
        <div class="login-box">
            <div class="login-image">
                <img src="https://assets.astro-charts.com/site/lyra.png" alt="Astro Chart">
                <a href="#" class="create-account">Create an account</a>
            </div>
            <div class="login-form">
                <h1>LOGIN</h1>
                <form method="post" action="./login">
                    <div class="input-group">
                        <i class="fa-solid fa-user"></i>
                        <input type="text" name="username" placeholder="Your User Name" required>
                    </div>
                    <div class="input-group">
                        <i class="fa-solid fa-key"></i>
                        <input type="password" name="password" placeholder="Your Password" required>
                    </div>
                    <div class="forgot-password">
                        <%
                            HttpSession sessionObj = request.getSession();
                            String message = (String) sessionObj.getAttribute("message");
                            if (message != null) {
                        %>
                        <span class="message"><%= message%></span>
                        <%
                                sessionObj.removeAttribute("message"); // Xóa thông báo sau khi hi?n th?
                            }
                        %>

                        <a href="#">Forgot Password?</a>
                    </div>
                    <button class="btn btn-login" type="submit">LOGIN</button>
                </form>
                <div class="login-google">
                    <span>Or:</span>
                    <a href="#">
                        <img src="https://astro-charts.com/client/common/images/site/btn_google.696c081ae56a.png" alt="Google Login">
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
