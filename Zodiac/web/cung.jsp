<%-- 
    Document   : cung
    Created on : Mar 24, 2025, 8:43:02 AM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
              integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Home</title>
    </head>

    <body>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap');

            :root {
                --color-one: #BA9545;
                --color-text: #232323;
                --bg-1: #F1EDE8;

                --font: 'Gilda Display', serif;
                --font-2: 'Roboto', sans-serif
            }
        </style>
        <!-- Header -->
        <style>
            .header {
                padding: 5px;
                position: fixed;
                top: 0;
                width: 100%;
                z-index: 1000;
                background: #fff;
            }

            .header .inner-head {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .header .inner-head .inner-menu {
                display: flex;
                justify-content: center;
                align-items: center;
                background: #000;
                width: 40px;
                height: 40px;
                color: #fff;
            }

            .header .inner-head .inner-logo span {
                font-family: 'Dancing Script', cursive;
                font-size: 50px;
                font-weight: bold;
                color: #000;
            }

            .header .inner-head .inner-info {
                display: flex;
            }

            .header .inner-head .inner-info .inner-sign-up a {
                color: #7A7A7A;
                text-decoration: none;
                font-family: var(--font);
            }

            .header .inner-head .inner-info .inner-login a {
                color: #7A7A7A;
                text-decoration: none;
                font-family: var(--font);
            }

            .header .inner-head .inner-info .inner-sign-up::after {
                content: "/";
                margin-right: 5px;
                margin-left: 5px;
                color: #7A7A7A;
            }

            .header .inner-head .inner-info .inner-login::after {
                content: "|";
                margin-left: 10px;
                margin-right: 10px;
                color: #7A7A7A;
            }

            .header .inner-head .inner-info .inner-notification {
                position: relative;
            }

            .header .inner-head .inner-info .inner-notification a {
                color: #7A7A7A;
                font-size: 20px;
            }

            .header .inner-head .inner-info .inner-notification::after {
                content: "0";
                position: absolute;
                width: 10px;
                height: 10px;
                top: 15px;
                left: 10px;
                border-radius: 50%;
                background: #F1EDE8;
                font-size: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .header .inner-head .inner-menu-mobi {
                display: none;
            }

            .header .inner-head .inner-logo-mobi {
                display: none;
            }
            
            .header .inner-head .inner-info .inner-logout a {
                color: #7A7A7A;
                text-decoration: none;
                font-family: var(--font);
                margin-left: 30px;
            }
  
            @media (max-width: 991.98px) {
                .header .inner-head .inner-logo-mobi {
                    display: block;
                }

                .header .inner-head .inner-logo-mobi span {
                    font-family: 'Dancing Script', cursive;
                    font-size: 50px;
                    font-weight: bold;
                    color: #000;
                }

                .header .inner-head .inner-menu {
                    display: none;
                }

                .header .inner-head .inner-logo {
                    display: none;
                }

                .header .inner-head .inner-info {
                    display: none;
                }

                .header .inner-head .inner-menu-mobi {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    background: #000;
                    width: 40px;
                    height: 40px;
                    color: #fff;
                }
            }
        </style>

        <header class="header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="inner-head">
                            <div class="inner-logo-mobi">
                                <a href="#">
                                    <span>AC</span>
                                </a>
                            </div>
                            <div class="inner-menu">
                                <i class="fa-solid fa-bars"></i>
                            </div>
                            <div class="inner-logo">
                                <a href="#">
                                    <span>StarMsg</span>
                                </a>
                            </div>
                            <div class="inner-info">
                                <%
                                    String username = (String) session.getAttribute("username");
                                    if (username != null) {
                                %>

                                <div class="inner-logout">
                                    <a href="./logout">Logout</a>
                                </div>
                                <%
                                } else {
                                %>

                                <div class="inner-sign-up">
                                    <a href="./register">
                                        Sign Up
                                    </a>
                                </div>
                                <div class="inner-login">
                                    <a href="./login">
                                        Login
                                    </a>
                                </div>
                                <%
                                    }
                                %>
                            </div>

                            <div class="inner-menu-mobi">
                                <i class="fa-solid fa-bars"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- End Header -->

        <!-- Menu -->
        <style>
            .menu {
                margin-top: 100px;
            }

            .menu .inner-list {
                margin-right: auto;
                margin-left: auto;
            }

            .menu ul {
                display: flex;
                list-style: none;
            }

            .menu ul li {
                margin-left: 50px;
            }

            .menu ul li a {
                font-family: "Roboto", serif;
                text-transform: uppercase;
                text-decoration: none;
                color: #000;
                font-size: 12px;
            }

            @media (max-width: 991.98px) {
                .menu {
                    display: none;
                }
            }
        </style>
        <div class="menu">
            <div class="container">
                <div class="row">
                    <div class="inner-list">
                        <ul>
                            <li>
                                <a href="./home">Home</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Menu -->

        <!-- Section One -->
        <style>
            .section-one {
                padding: 50px;
            }
            
            .section-one .inner-content p {
                font-family: var(--font);
                font-size: 26px;
            }
            
            .section-one .inner-left {
                margin-top: 20px;
            }
            
            .section-one .inner-title p {
                font-family: var(--font2);
                text-transform: uppercase;
                font-size: 26px;
            }
            
            .section-one .inner-desc {
                margin-top: 20px;
                font-family: var(--font);
                background: #ECEAEA;
                color: #7A7A7A;
                padding: 0 20px;
                font-size: 20px;
            }
            
            .section-one .inner-left .inner-box {
                display: flex;
                margin-bottom: 10px;
            }
            
            .section-one .inner-left .inner-title {
                font-size: 20px;
            }
            
            .section-one .inner-left .inner-title span {
                font-family: var(--font);
            }
            
            .section-one .inner-left .inner-box .inner-icon {
                margin-right: 20px;
            }
            
            .section-one .inner-right {
                margin-top: 20px;
            }
            
            .section-one .inner-right .inner-box {
                display: flex;
                margin-bottom: 10px;
            }
            
            .section-one .inner-right .inner-title {
                font-size: 20px;
            }

            .section-one .inner-right .inner-box .inner-icon {
                margin-right: 20px;
            }

            .section-one .inner-title h2::after {
                content: "";
                display: block;
                margin-top: 10px;
                width: 1000px;
                height: 2px;
                background-color: #E5E5E5;
            }
            .section-one .inner-desc .btn-danger {
                margin-top: 20px;
                font-size: 32px;
            }
        </style>

        <div class="section-one">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-lg-4 col-md-4 col-sm-12">
                        <div class="inner-box">
                            <div class="inner-content">
                                <%
                                    String name = (String) request.getAttribute("name");
                                    String country = (String) request.getAttribute("country");
                                    String ZodiacSign = (String) request.getAttribute("ZodiacSign");
                                    
                                    int day = (int) request.getAttribute("day");
                                    int month = (int) request.getAttribute("month");
                                    int year = (int) request.getAttribute("year");

                                    // Chuyển day, month, year thành chuỗi và cộng thành một chuỗi duy nhất
                                    String birth = String.valueOf(month) + "/" + String.valueOf(day) + "/" + String.valueOf(year);
                                %>
                                <p class="inner-name">Name: <%= name%></p> 
                                <p class="inenr-country">Country: <%= country%></p> 
                                <p class="inner-birth">Birth: <%= birth%></p> 
                                <p class="Zodiac">Zodiac: <%= ZodiacSign%></p> 
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-xl-12">
                        <div class="inner-title">
                            <h2>Planets</h2>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="inner-left">
                            <div class="inner-box">
                                <div class="inner-icon">
                                    <img src="https://astro-charts.com/client/common/images/planets/sun.svg">
                                </div>
                                <div class="inner-title">
                                    <%
                                        String sunPosition = (String) request.getAttribute("sunSign");
                                        System.out.println("Sun Sign: " + sunPosition);
                                    %>
                                    <span>Sun in <%= sunPosition%></span>
                                </div>
                            </div>
                            <div class="inner-box">
                                <div class="inner-icon">
                                    <img src="https://astro-charts.com/client/common/images/planets/moon.svg">
                                </div>
                                <div class="inner-title">
                                    <%
                                        String moonPosition = (String) request.getAttribute("moonSign");
                                    %>
                                    <span>Moon in <%= moonPosition%></span>
                                </div>
                            </div>
                            <div class="inner-box">
                                <div class="inner-icon">
                                    <img src="https://astro-charts.com/client/common/images/planets/mercury.svg">
                                </div>
                                <div class="inner-title">
                                    <%
                                        String mercuryPosition = (String) request.getAttribute("mercurySign");
                                    %>
                                    <span>Mercury in <%= mercuryPosition%></span>
                                </div>
                            </div>
                            <div class="inner-box">
                                <div class="inner-icon">
                                    <img src="https://astro-charts.com/client/common/images/planets/venus.svg">
                                </div>
                                <div class="inner-title">
                                    <%
                                        String venusPosition = (String) request.getAttribute("venusSign");
                                    %>
                                    <span>Venus in <%= venusPosition%></span>
                                </div>
                            </div>
                            <div class="inner-box">
                                <div class="inner-icon">
                                    <img src="https://astro-charts.com/client/common/images/planets/mars.svg">
                                </div>
                                <div class="inner-title">
                                    <%
                                        String marsPosition = (String) request.getAttribute("marsSign");
                                    %>
                                    <span>Mars in <%= marsPosition%></span>
                                </div>
                            </div>
                            <div class="inner-box">
                                <div class="inner-icon">
                                    <img src="https://astro-charts.com/client/common/images/planets/jupiter.svg">
                                </div>
                                <div class="inner-title">
                                    <%
                                        String jupiterPosition = (String) request.getAttribute("jupiterSign");
                                    %>
                                    <span>Jupiter in <%= jupiterPosition%></span>
                                </div>
                            </div>
                            <div class="inner-box">
                                <div class="inner-icon">
                                    <img src="https://astro-charts.com/client/common/images/planets/saturn.svg">
                                </div>
                                <div class="inner-title">
                                    <%
                                        String saturnPosition = (String) request.getAttribute("saturnSign");
                                    %>
                                    <span>Saturn in <%= saturnPosition%></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-6">
                        <div class="inner-right">
                            <div class="inner-box">
                                <div class="inner-icon">
                                    <img src="https://astro-charts.com/client/common/images/planets/uranus.svg">
                                </div>
                                <div class="inner-title">
                                    <%
                                        String uranusPosition = (String) request.getAttribute("uranusSign");
                                    %>
                                    <span>Uranus in <%= uranusPosition%></span>
                                </div>
                            </div>
                            <div class="inner-box">
                                <div class="inner-icon">
                                    <img src="https://astro-charts.com/client/common/images/planets/neptune.svg">
                                </div>
                                <div class="inner-title">
                                    <%
                                        String neptunePosition = (String) request.getAttribute("neptuneSign");
                                    %>
                                    <span>Neptune in <%= neptunePosition%></span>
                                </div>
                            </div>
                            <div class="inner-box">
                                <div class="inner-icon">
                                    <img src="https://astro-charts.com/client/common/images/planets/pluto.svg">
                                </div>
                                <div class="inner-title">
                                    <%
                                        String plutoPosition = (String) request.getAttribute("plutoSign");
                                    %>
                                    <span>Pluto in <%= plutoPosition%></span>
                                </div>
                            </div>
                            <div class="inner-box">
                                <div class="inner-icon">
                                    <img src="https://astro-charts.com/client/common/images/planets/north%20node.svg">
                                </div>
                                <div class="inner-title">
                                    <%
                                        String northNodePosition = (String) request.getAttribute("northNodeSign");
                                    %>
                                    <span>North Node in <%= northNodePosition%></span>
                                </div>
                            </div>
                            <div class="inner-box">
                                <div class="inner-icon">
                                    <img src="https://astro-charts.com/client/common/images/planets/chiron.svg">
                                </div>
                                <div class="inner-title">
                                    <%
                                        String chironPosition = (String) request.getAttribute("chironSign");
                                    %>
                                    <span>Chiron in <%= chironPosition%></span>
                                </div>
                            </div>
                            <div class="inner-box">
                                <div class="inner-icon">
                                    <img src="https://astro-charts.com/client/common/images/planets/ascendant.svg">
                                </div>
                                <div class="inner-title">
                                    <%
                                        String ascendantPosition = (String) request.getAttribute("ascendantSign");
                                    %>
                                    <span>Ascendant in <%= ascendantPosition%></span>
                                </div>
                            </div>
                            <div class="inner-box">
                                <div class="inner-icon">
                                    <img src="https://astro-charts.com/client/common/images/planets/mc.svg">
                                </div>
                                <div class="inner-title">
                                    <%
                                        String mcPosition = (String) request.getAttribute("mcSign");
                                    %>
                                    <span>MC in <%= mcPosition%></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-12">
                        <div class="inner-desc">
                            <%
                                // Kiểm tra xem người dùng đã đăng nhập chưa
//                                String username = (String) session.getAttribute("username");
                                if (username != null) { // Nếu đã đăng nhập
                                    String message = (String) request.getAttribute("MessageForSign");
                                    String healthMessage = (String) request.getAttribute("HealthMessageForSign");
                                    String loveMessage = (String) request.getAttribute("LoveMessageForSign");
                                    String studyMessage = (String) request.getAttribute("StudyMessageForSign");
                            %>
                            <p><%= message%></p>
                            <p><%= healthMessage%></p>
                            <p><%= loveMessage%></p>
                            <p><%= studyMessage%></p>

                            
                            <%
                            } else { 
                            %>

                            
                            <p><em>Login to see your personalized horoscope!</em></p>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Section One -->


    </body>

</html>