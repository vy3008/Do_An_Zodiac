<%-- 
    Document   : login
    Created on : Mar 20, 2025, 9:36:58 PM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log in - StarMsg</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gilda+Display&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap');

        :root {
            --color-one: #BA9545;
            --color-text: #232323;
            --bg-1: #F1EDE8;

            --font: 'Gilda Display', serif;
            --font-2: 'Roboto', sans-serif;
        }

        * {
            padding: 0;
            margin: 0;
            border: 0;
            box-sizing: border-box !important;
        }

        body {
            background: var(--bg-1);
        }

        .login .inner-wrap {
            display: flex;
            background: #fff;
            width: 700px;
            height: 500px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 50px;
            padding: 50px;
        }

        .login .inner-wrap .login-img {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 40%;
            margin-top: 30px;
        }


        .login .inner-wrap .login-img img {
            width: 100%;
            height: auto;
            margin-bottom: 20px;
        }

        .login .inner-wrap .login-img a {
            color: #000;
        }

        .login .inner-wrap h1 {
            font-family: var(--font-2);
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .login .inner-wrap section {
            margin-top: 20px;
        }

        .login .inner-wrap .flex {
            margin-left: 50px;
        }

        .login .inner-wrap form input {
            border: none;
        }

        .login .inner-wrap input:focus {
            outline: none;
        }

        .login .inner-wrap .horizontal-line {
            border-bottom: 1px solid #E5E5E5;
            height: 10px;
            width: 300px;
            margin-bottom: 10px;
        }

        .login .inner-wrap .forgot-pass {
            display: block;
            text-align: right;
        }

        .login .inner-wrap .forgot-pass a {
            color: #B4BBC3;
            text-decoration: none;
        }

        .login .inner-wrap .button-one {
            padding: 15px 100px;
            margin-top: 40px;
            background: #1B1B1B;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 2px;
            cursor: pointer;
        }

        .login .inner-wrap .login-google {
            display: flex;
            margin-top: 40px;
        }

        .login .inner-wrap .login-google span {
            margin-top: 10px;
        }

        @media (max-width: 991.98px) {
            .login .inner-wrap {
                width: 600px;
                height: 400px;
                margin-left: auto;
                margin-right: auto;
                margin-top: 50px;
                padding: 40px;
            }
        }

        @media (max-width: 767.98px) {
            .login .inner-wrap {
                flex-wrap: wrap;
                height: 800px;
                width: 400px;
                padding: 50px 0;
            }

            .login .inner-wrap .login-img {
                width: 100%;
                order: 2;
            }

            .login .inner-wrap .login-img img {
                width: 40%;
            }

            .login .inner-wrap .flex {
                width: 100%;
                order: 1;
            }

            .login .inner-wrap .forgot-pass {
                display: block;
                margin-right: 50px;
            }

            .login .inner-wrap .button-one {
                padding: 15px 120px;
            
            }
        }
    </style>

    <div class="login">
        <div class="inner-wrap">
            <div class="login-img">
                <img src='https://assets.astro-charts.com/site/lyra.png' alt="an illustration of goddess with Lyra">
                <a href="#">Create an account</a>
            </div>
            <div class="flex">
                <h1>Login</h1>
                <form method="post" action="./login" id="login-form">
                    <section>
                        <div class="input-icon-wrap">
                            <span class="input-icon">
                                <i class="fa-solid fa-user"></i>
                            </span>
                            <label for="email" style="display:none">
                                <span>Email</span>
                            </label>
                            <input id="id_username" name="username" type="text" placeholder="Your Email"
                                autocomplete="off">
                        </div>
                    </section>

                    <div class="horizontal-line"></div>

                    <section>
                        <div class="input-icon-wrap">
                            <span class="input-icon">
                                <i class="fa-solid fa-key"></i>
                            </span>
                            <label for="password" style="display:none">
                                <span>Password</span>
                            </label>
                            <input id="id_password" name="password" type="password" placeholder="Your Password"
                                autocomplete="off">
                        </div>
                    </section>

                    <div class="horizontal-line"></div>

                    <div>
                        <span class="forgot-pass"><a href="#">Forgot Password?</a></span>
                        <button class="button button-one" id="login" type="submit">Login</button>
                        <input type="hidden" name="next" value="" />
                    </div>
                </form>

                <div class="login-google">
                    <span>Or:</span>
                    <a id="google-oauth2-button" name="google oauth2" href="#">
                        <img src="https://astro-charts.com/client/common/images/site/btn_google.696c081ae56a.png">
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>


