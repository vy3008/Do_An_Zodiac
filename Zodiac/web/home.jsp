<%-- 
    Document   : home
    Created on : Mar 22, 2025, 8:55:52 PM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
              integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&display=swap"
              rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap"
              rel="stylesheet">

        <title>Home</title>
    </head>

    <body>
        <style>
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
                                    <span>SM</span>
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

        <!-- Form -->
        <style>
            .form {
                background: #F1EDE8;
                padding: 50px 0;
            }

            .form .inner-left {
                background: #fff;
            }

            .suggestion-box {
                position: absolute;
                top: 100%;
                left: 0;
                z-index: 1000;
                width: 100%;
                border: 1px solid #ccc;
                background-color: #fff;
                list-style: none;
                padding: 0;
                margin: 5px 0 0;
                max-height: 150px;
                overflow-y: auto;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                display: none;
                max-height: 200px;
                overflow-y: auto;
                scrollbar-width: none;
            }

            .suggestion-box::-webkit-scrollbar {
                display: none;
            }

            .suggestion-box li {
                padding: 10px;
                cursor: pointer;
                font-size: 14px;
                color: #333;
            }

            .suggestion-box li:hover {
                background-color: #f0f0f0;
            }

            input[name="mm"],
            input[name="dd"] {
                margin-right: 15px;
            }

            input[name="hh"],
            input[name="mm"] {
                margin-right: 15px;
            }

            .form .btn {
                width: 100%;
            }
        </style>
        <div class="form">

            <section class="container text-center my-5">
                <h2 class="fw-bold">Create Your Astrology Birth Chart</h2>
                <p class="text-muted">Create your free, personalized, and highly customizable birth chart (natal
                    chart) by filling in the form below. Using our tools you can hide/show planets and
                    asteroids, choose a house system, customize orbs, show declinations, sidereal charts and
                    more...</p>
            </section>

            <section class="container d-flex justify-content-center align-items-center">
                <div class="row w-100">
                    <div class="col-md-6 p-4 inner-left">
                        <h5 class="text-warning">FILL IN YOUR DETAILS</h5>
                        <form method="POST" action="./cung">
                            <div class="mb-3">
                                <label class="form-label">My name is:</label>
                                <input type="text" class="form-control" name="name" placeholder="Enter your name" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">I was born in:</label>
                                <input type="text" class="form-control" name="born"
                                       placeholder="City, state, country" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">My date of birth is:</label>
                                <div class="d-flex gap-2">
                                    <input type="number" class="form-control" id="month" name="mm" placeholder="MM" maxlength="2">
                                    <input type="number" class="form-control" id="day" name="dd" placeholder="DD" maxlength="2">
                                    <input type="number" class="form-control" id="year" name="yyyy" placeholder="YYYY" maxlength="4">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Time of birth:</label>
                                <div class="d-flex gap-2">
                                    <input type="number" class="form-control" id="hour" name="hh" placeholder="hh" required>
                                    <input type="number" class="form-control" id="minute" name="min" placeholder="mm" required>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="ampm" id="am" value="AM">
                                        <label class="form-check-label" for="am">AM</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="ampm" id="pm" value="PM">
                                        <label class="form-check-label" for="pm">PM</label>
                                    </div>
                                </div>
                            </div>
                            <div id="error-message" class="text-danger mb-2"></div>
                            <button type="submit" class="btn btn-dark">Create Chart</button>
                        </form>
                    </div>
                    <div class="col-md-6 d-flex justify-content-center align-items-center">
                        <img src="https://assets.astro-charts.com/site/illustration-form.webp"
                             alt="Astrology Illustration" class="img-fluid">
                    </div>
                </div>
            </section>
        </div>
        <!-- Form -->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const countries = [
                    "Afghanistan", "Albania", "Algeria", "Andorra", "Angola",
                    "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria",
                    "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados",
                    "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia",
                    "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria",
                    "Burkina Faso", "Burundi", "Cabo Verde", "Cambodia", "Cameroon",
                    "Canada", "Central African Republic", "Chad", "Chile", "China",
                    "Colombia", "Comoros", "Congo", "Costa Rica", "Croatia", "Cuba",
                    "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica",
                    "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea",
                    "Eritrea", "Estonia", "Eswatini", "Ethiopia", "Fiji", "Finland",
                    "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece",
                    "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti",
                    "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq",
                    "Ireland", "Israel", "Italy", "Ivory Coast", "Jamaica", "Japan",
                    "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kuwait", "Kyrgyzstan",
                    "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya",
                    "Liechtenstein", "Lithuania", "Luxembourg", "Madagascar", "Malawi",
                    "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands",
                    "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova",
                    "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique",
                    "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand",
                    "Nicaragua", "Niger", "Nigeria", "North Korea", "North Macedonia",
                    "Norway", "Oman", "Pakistan", "Palau", "Palestine", "Panama",
                    "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland",
                    "Portugal", "Qatar", "Romania", "Russia", "Rwanda", "Saint Kitts and Nevis",
                    "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa",
                    "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal",
                    "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia",
                    "Slovenia", "Solomon Islands", "Somalia", "South Africa",
                    "South Korea", "South Sudan", "Spain", "Sri Lanka", "Sudan",
                    "Suriname", "Sweden", "Switzerland", "Syria", "Tajikistan",
                    "Tanzania", "Thailand", "Timor-Leste", "Togo", "Tonga",
                    "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan",
                    "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates",
                    "United Kingdom", "United States", "Uruguay", "Uzbekistan",
                    "Vanuatu", "Vatican City", "Venezuela", "Vietnam",
                    "Yemen", "Zambia", "Zimbabwe"
                ];

                const input = document.querySelector('input[name="born"]');
                const suggestionBox = document.createElement("ul");
                suggestionBox.className = "suggestion-box";


                input.parentNode.style.position = "relative";
                input.parentNode.appendChild(suggestionBox);


                input.addEventListener("input", function () {
                    const query = input.value.toLowerCase();
                    suggestionBox.innerHTML = "";
                    if (query.length > 0) {
                        const suggestions = countries.filter(country => country.toLowerCase().startsWith(query));
                        if (suggestions.length > 0) {
                            suggestions.forEach(country => {
                                const listItem = document.createElement("li");
                                listItem.textContent = country;


                                listItem.addEventListener("click", function () {
                                    input.value = country;
                                    suggestionBox.style.display = "none";
                                });

                                suggestionBox.appendChild(listItem);
                            });
                            suggestionBox.style.display = "block";
                        } else {
                            suggestionBox.style.display = "none";
                        }
                    } else {
                        suggestionBox.style.display = "none";
                    }
                });

                document.addEventListener("click", function (event) {
                    if (!input.contains(event.target) && !suggestionBox.contains(event.target)) {
                        suggestionBox.style.display = "none";
                    }
                });
            });

        </script>
        <!-- End Form -->
        <script>
            document.querySelector("form").addEventListener("submit", function (e) {
                let isValid = true;
                let errorMessage = "";
                const errorBox = document.getElementById("error-message");

                const monthField = document.getElementById("month");
                const dayField = document.getElementById("day");
                const yearField = document.getElementById("year");
                const hourField = document.getElementById("hour");
                const minuteField = document.getElementById("minute");

                const month = monthField.value.trim();
                const day = dayField.value.trim();
                const year = yearField.value.trim();
                const hour = hourField.value.trim();
                const minute = minuteField.value.trim();

                // Reset lỗi
                [monthField, dayField, yearField, hourField, minuteField].forEach(field => field.classList.remove("is-invalid"));

                // Validate tháng
                if (!/^\d{1,2}$/.test(month) || parseInt(month) < 1 || parseInt(month) > 12) {
                    monthField.classList.add("is-invalid");
                    errorMessage = "Enter a valid month (date format: MM/DD/YYYY)";
                    isValid = false;
                }

                // Validate ngày
                else if (!/^\d{1,2}$/.test(day) || parseInt(day) < 1 || parseInt(day) > 31) {
                    dayField.classList.add("is-invalid");
                    errorMessage = "Enter a valid day (date format: MM/DD/YYYY)";
                    isValid = false;
                }

                // Validate năm
                else if (!/^\d{4}$/.test(year) || parseInt(year) < 1900 || parseInt(year) > 2100) {
                    yearField.classList.add("is-invalid");
                    errorMessage = "Enter a valid year (date format: MM/DD/YYYY)";
                    isValid = false;
                }

                // Validate giờ
                else if (!/^\d{1,2}$/.test(hour) || parseInt(hour) < 1 || parseInt(hour) > 12) {
                    hourField.classList.add("is-invalid");
                    errorMessage = "Enter a valid hour (1–12)";
                    isValid = false;
                }

                // Validate phút
                else if (!/^\d{1,2}$/.test(minute) || parseInt(minute) < 0 || parseInt(minute) > 59) {
                    minuteField.classList.add("is-invalid");
                    errorMessage = "Enter a valid minute (0–59)";
                    isValid = false;
                }

                if (!isValid) {
                    e.preventDefault();
                    errorBox.innerText = errorMessage;
                } else {
                    errorBox.innerText = "";
                }
            });

            // Giới hạn độ dài khi gõ vào
            const limitLength = (id, maxLength) => {
                document.getElementById(id).addEventListener("input", function () {
                    this.value = this.value.slice(0, maxLength);
                });
            };

            limitLength("month", 2);
            limitLength("day", 2);
            limitLength("year", 4);
            limitLength("hour", 2);
            limitLength("minute", 2);
        </script>


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
    </body>

</html>
