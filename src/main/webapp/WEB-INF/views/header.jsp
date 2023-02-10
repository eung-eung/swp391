<%-- 
    Document   : header
    Created on : Feb 8, 2023, 5:51:26 PM
    Author     : boyvi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/homePage.css" />" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;1,100;1,300&display=swap"
              rel="stylesheet">
        <script src="https://kit.fontawesome.com/330a21053c.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <header class="header">
            <div class="header-top">
                <div class="container">
                    <div class="header-top-content">
                        <div class="row">
                            <div class="col-left">

                                <div class="col-left-content">Chào mừng <span class="email-need-split" data-email="${sessionScope.user.email}"></span> đến với chúng tôi</div>



                            </div>
                            <div class="col-right">
                                <div class="navigation-user">
                                    <ul class="navigation-user-selection">

                                        <c:choose>

                                            <c:when test="${not empty sessionScope.user}">
                                                <li class="navigation-user-item">
                                                    <span class="email-need-split" data-email="${sessionScope.user.email}"></span>
                                                </li>
                                                <li class="navigation-user-item dropdown">
                                                    <span class="navigation-user-action">
                                                        <div class="current-avatar">
                                                            <div id="my-avatar-header" style="background-image: url('${sessionScope.user.avatarUrl}')" ></div>
                                                        </div>

                                                        <span>My Account</span>
                                                        <i class="fa-solid fa-angle-down"></i>

                                                    </span>

                                                    <div class="dropdown-action">
                                                        <a href="<c:url value="/MainController?btnAction=user&userAction=profile" />">Thông tin của tôi</a>
                                                        <a href="<c:url value="/MainController?btnAction=user&userAction=logout"></c:url>">Đăng xuất</a>

                                                        </div>

                                                    </li>


                                            </c:when>
                                            <c:otherwise>
                                                <li class="navigation-user-item">
                                                    <span id="g_id_onload"
                                                          data-client_id="1091790792976-ks6ah0826cgh92qtm3qo1k5n6cpov2mg.apps.googleusercontent.com"
                                                          data-context="signin" data-ux_mode="popup" data-callback="loginByGoogle"
                                                          data-auto_select="true" data-itp_support="true">
                                                    </span>

                                                    <span class="g_id_signin" data-type="button" data-shape="circle"
                                                          data-theme="outline" data-text="signin_with" data-size="medium">
                                                    </span>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>



                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End header top -->
            <div class="header-center">
                <div class="container">
                    <div class="header-center-row">
                        <div class="header-center-col">
                            <div class="header-logo-container">
                                <a href="<c:url value="/MainController"></c:url>" class="logo">
                                        <img class="header-logo" src="assets/images/logo3.png" alt="">
                                    </a>
                                </div>

                            </div>
                            <div class="header-center-col">
                                <nav class="menu">
                                    <ul class="menu-list">
                                        <li class="menu-list-item">
                                            <a class="menu-list-item-action" href="<c:url value="/MainController"></c:url>">Home</a>
                                        </li>

                                    </ul>
                                </nav>
                            </div>
                            <div class="header-center-col">
                                <div class="contact-container">
                                    <div class="contact-inner">
                                        <i class="fa-solid fa-headphones"></i>
                                        <div class="phone">
                                            <strong>Contact us: </strong>
                                            <span class="phone">9999999</span><br>
                                        </div>
                                        <div class="email">
                                            <span>Email: </span>
                                            <span>adasdasd@gmail.com</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="header-bottom">
                    <div class="container">

                        <div class="row-header-bottom">
                            <div class="header-bottom-left">
                                <div>
                                    <a class="menu-title">
                                        <i class="fa-solid fa-align-left"></i>
                                        <span>Các loại sản phẩm</span>
                                        <i class="fa-regular fa-circle-down down"></i>
                                    </a>
                                    <div class="menu-categories  ${param.btnAction == null  ? "" : "is-hover"}">
                                    <ul  class="menu-categories-list">

                                        <c:forEach items="${sessionScope.listCategory}" var="categoryItem">
                                            <li class="menu-categories-item">
                                                <a href="<c:url value="/MainController?btnAction=product&productAction=showByCateID&categoryID=${categoryItem.categoryID}"></c:url>" class="menu-categories-item-action">
                                                    ${categoryItem.icon}${categoryItem.name}
                                                </a>
                                            </li>
                                        </c:forEach>


                                        <li class="menu-categories-item loadmore">
                                            <div class="menu-categories-item-action">
                                                <i class="fa-solid fa-circle-plus"></i>
                                                <span class="more-view">Xem thêm</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="header-bottom-right">
                            <div class="row-header-bottom-right">
                                <div class="header-bottom-search">
                                    <form action="MainController">
                                        <div class="input-group">

                                            <input type="text" name="searchValue" class="search-input" placeholder="Tìm kiếm..." required>

                                            <div class="search-icon">
                                                <button type="submit" class="search-button" name="btnAction" value="search"><i
                                                        class="fa-solid fa-magnifying-glass"></i></button>
                                            </div>

                                        </div>
                                    </form>
                                </div>
                                <div class="header-bottom-cart">
                                    <a href="" class="cart-button"><i class="fa-solid fa-cart-shopping cart-icon"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </body>

    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script>

        // function to get response
        function loginByGoogle(response) {
            console.log(response)
            const responsePayload = decodeJwtResponse(response.credential);
            console.log(responsePayload)
            const email = responsePayload.email;
            const avatar = responsePayload.picture;
            const username = responsePayload.name;
            fetch("<c:url value="/MainController?btnAction=user&userAction=login&email="/>" + email + "&picture=" + avatar + "&username=" + username, {
                method: "GET"
            }).then(res =>
                res.json()


            ).then(res => {
                console.log(res.avatarUrl)
                const  resUrl = res.avatarUrl;
                document.querySelector('.navigation-user-selection').innerHTML =
                        `<li class="navigation-user-item">
                 <span class="email-need-split" data-email="${res.email}"></span>
                                  </li>
                                  <li class="navigation-user-item dropdown">
                                      <span class="navigation-user-action">
                                            <div class="current-avatar">
                                                            <div id="my-avatar-header" style="background-image: url('')" ></div>
                                                        </div>
                                          <span>My Account</span>
                                          <i class="fa-solid fa-angle-down"></i>

                                      </span>

                                      <div class="dropdown-action">
                                          <a href="<c:url value="/MainController?btnAction=user&userAction=profile" />">Thông tin của tôi</a>
                                          <a href="<c:url value="/MainController?btnAction=user&userAction=logout"></c:url>">Đăng xuất</a>

                                          </div>

                                      </li>`;

                document.querySelector('.email-need-split').innerHTML = res.email.substring(0, res.email.lastIndexOf("@"));
                document.querySelector('#my-avatar-header').style.backgroundImage = "url('" + resUrl + "')";
            }
            )
        }
        window.onload = function () {
            // also display the One Tap dialog on right side
            // important for auto login
            google.accounts.id.prompt();
        }
        // function to decode the response.credential
        function decodeJwtResponse(token) {
            var base64Url = token.split('.')[1];
            var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
            var jsonPayload = decodeURIComponent(atob(base64).split('').map(function (c) {
                return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
            }).join(''));
            return JSON.parse(jsonPayload);
        }
        let usernameDiv = document.querySelector('.email-need-split');
        let emailNeedSplit = document.querySelector('.email-need-split').dataset.email;
        let username = emailNeedSplit.substring(0, emailNeedSplit.lastIndexOf("@"));
        usernameDiv.innerHTML = username;
        </script>
        <script src="<c:url value="/assets/Javascript/handleMenuCategories.js" />"></script>
</html>