<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<jsp:include page="_header.jsp" />
<main id="register_page">
                <div class="container p-0">
                    <div class="d-flex box">
                        <div class="col-md-7 left">
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/">
                                    <img src="${pageContext.request.contextPath}/resources/images/Logo_Ananas_Header.png" alt="">
                                </a>
                            </div>
                            <div class="content">
                                <form:form id="frm_register" action="${pageContext.request.contextPath}/register" modelAttribute="register" method="post">
                                    <div class="form-group">
                                        <label for="ip_fullname">Họ tên<i>*</i></label>
                                        <form:input type="text" id="ip_fullname" path="fullname" class="form-control" placeholder="Nhập họ tên" required="required" />
                                        <form:errors path="fullname" class="text-danger"/>
                                    </div>
                                    <div class="form-group ">
                                        <label for="ip_username" class="col-md-2">Tên đăng nhập<i>*</i></label>
                                        <form:input type="text" id="ip_username" path="username" class="form-control" placeholder="Nhập tên đăng nhập" required="required"/>
                                        <form:errors path="username" class="text-danger"/>
                                    </div>
                                    <div class="form-group ">
                                        <label for="ip_email">Email<i>*</i></label>
                                        <form:input type="email" id="ip_email" path="email" class="form-control" placeholder="Nhập Email" required="required"/>
                                        <form:errors path="email" class="text-danger"/>
                                    </div>
                                    <div class="d-flex">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="ip_password" class="col-md-3">Mật khẩu<i>*</i></label>
                                                <form:input type="password" id="ip_password" path="password" class="form-control" placeholder="Nhập mật khẩu" required="required"/>
                                       			<form:errors path="password" class="text-danger"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="ip_repassword" class="col-md-4">Lặp lại mật khẩu<i>*</i></label>
                                                <input type="password" name="ip_repassword" id="ip_repassword" placeholder="Nhập lại mật khẩu" required="required">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="ip_phone" class="col-md-2">Số điện thoại<i>*</i></label>
                                        <form:input type="text" id="ip_phone" path="phone" class="form-control" placeholder="Nhập số điện thoại" required="required"/>
                                        <form:errors path="phone" class="text-danger"/>
                                    </div>
                                    <div class="form-group ">
                                        <label for="ip_address" class="col-md-2">Địa chỉ giao hàng<i>*</i></label>
                                        <form:input type="text" id="ip_address" path="address" class="form-control" placeholder="Nhập địa chỉ" required="required"/>
                                        <form:errors path="address" class="text-danger"/>
                                    </div>
                                        <button id="regis_btn" class="btn" type="submit">
                                            Đăng Ký
                                            <i class="fas fa-chevron-right"></i>
                                        </button>
                                </form:form>
                            </div>
                            <p class="foot">
                                Bạn đã có sẵn một tài khoản?
                                <a href="#" data-toggle="modal" data-target="#funct_login">
                                    Đăng nhập
                                </a>
                            </p>
                        </div>
                        <!-- phong bac =] -->
                        <div class="col-md-5 right">
                            <div id="register_carousel" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#register_carousel" data-slide-to="0" class="active"></li>
                                    <li data-target="#register_carousel" data-slide-to="1"></li>
                                    <li data-target="#register_carousel" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active">
                                        <img src="${pageContext.request.contextPath}/resources/images/AnanasxLuckyLuke-Pack_poster.png" alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="${pageContext.request.contextPath}/resources/images/poster_2.png" alt="">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="${pageContext.request.contextPath}/resources/images/poster_3.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
<jsp:include page="_footer.jsp" />