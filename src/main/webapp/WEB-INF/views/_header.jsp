<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - ANANAS</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/Logo_Ananas_Header.svg" type="image/x-icon">
    <!-- THEME -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/libs/bootstrap-4.5.0-dist/css/bootstrap.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/libs/fontawesome-free-5.13.0-web/css/all.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/Glider.js-master/glider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/Exzoom/src/jquery.exzoom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/themes/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/themes/css/style_section.css">
    
    <!-- JS -->
    <script src="${pageContext.request.contextPath}/resources/libs/jquery/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/libs/bootstrap-4.5.0-dist/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/libs/Glider.js-master/glider.js"></script>
    <script src="${pageContext.request.contextPath}/resources/libs/Exzoom/src/jquery.exzoom.js"></script>
</head>
<body>
	<!-- header -->
    <header>
      <div class="container-fluid">
        <div id="top-head">
          <div class="container">
            <div class="d-flex">
              <div class="col-md-4 col-sm-0"></div>
              <div class="col-md-8 col-sm-12">
                <ul class="d-flex">
                 <c:if test="${pageContext.request.userPrincipal != null}">
                 	<li>
                    <img src="${pageContext.request.contextPath}/resources/images/icon_dang_nhap.png" alt="" />
                    <a href="#">
                      <span id="get_name_user">Chào! ${ pageContext.request.userPrincipal.name }</span>
                    </a>
                  </li>
                  <li>
                    
                    <a href="${pageContext.request.contextPath}/logout">
                      <span id="get_name_user">Đăng xuất</span>
                    </a>
                  </li>
                  
                  <li>
                    <img src="${pageContext.request.contextPath}/resources/images/icon_tra_cuu_don_hang.png" alt="" />
                    <a href="${pageContext.request.contextPath}/don-hang">Tra cứu đơn hàng</a>
                  </li>
                 </c:if>
                 <c:if test="${pageContext.request.userPrincipal == null}">
                 	<li>
                    <img src="${pageContext.request.contextPath}/resources/images/icon_dang_nhap.png" alt="" />
                    <a href="#" data-toggle="modal" data-target="#funct_login">
                      <span id="get_name_user">Đăng nhập</span>
                    </a>
                  </li>
                 </c:if>
                  
                  
                  <li>
                    <img src="${pageContext.request.contextPath}/resources/images/icon_tim_cua_hang.png" alt="" />
                    <a href="tim-cua-hang.html">Tìm cửa hàng</a>
                  </li>
                  <li>
                    <img src="${pageContext.request.contextPath}/resources/images/icon_heart_header.png" alt="" />
                    <a href="yeu-thich.html">Yêu thích</a>
                  </li>
                  <li>
                    <img src="${pageContext.request.contextPath}/resources/images/icon_gio_hang.png" alt="" />
                    <c:if test="${sessionScope.Cart != null}">
                    	<a href="${pageContext.request.contextPath}/xem-gio-hang">Giỏ hàng (<span>${ sessionScope.Cart.size }</span>)</a>
                    </c:if>
                    <c:if test="${sessionScope.Cart == null}">
                    	<a href="${pageContext.request.contextPath}/xem-gio-hang">Giỏ hàng (<span>0</span>)</a>
                    </c:if>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div id="sidebar" class="bg-light">
          <div class="container">
            <div class="d-flex">
              <div class="col-md-2 d-flex justify-content-center">
                <a href="${pageContext.request.contextPath}">
                  <img src="${pageContext.request.contextPath}/resources/images/Logo_Ananas_Header.png" alt="" />
                </a>
              </div>
              <div class="col-md-7">
                <ul class="menu d-flex">
                  <li class="menu-item">
                    <a href="san-pham.html" class="d-flex">
                      <h4>SẢN PHẨM</h4>
                      <i class="fas fa-chevron-down"></i>
                    </a>
                    <div class="menu-sub menu-sub--product">
                      <div class="container">
                        <ul class="d-flex">
                          <li>
                            <a href="${pageContext.request.contextPath}/phan-loai?gender=true">
                              <div class="card">
                                <img
                                  src="${pageContext.request.contextPath}/resources/images/Menu_Nam.jpg"
                                  alt=""
                                  class="card__image"
                                />
                                <div class="card__content">CHO NAM</div>
                              </div>
                            </a>
                          </li>
                          <li>
                            <a href="${pageContext.request.contextPath}/phan-loai?gender=false">
                              <div class="card">
                                <img
                                  src="${pageContext.request.contextPath}/resources/images/Menu_Nu.jpg"
                                  alt=""
                                  class="card__image"
                                />
                                <div class="card__content">CHO NỮ</div>
                              </div>
                            </a>
                          </li>
                          <li>
                            <a href="${pageContext.request.contextPath}/phan-loai">
                              <div class="card">
                                <img
                                  src="${pageContext.request.contextPath}/resources/images/Menu_Sale-off.jpg"
                                  alt=""
                                  class="card__image"
                                />
                                <div class="card__content">OUTLET SALE</div>
                              </div>
                            </a>
                          </li>
                          
                        </ul>
                      </div>
                    </div>
                  </li>
                  <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/phan-loai?gender=true" class="d-flex">
                      <h4>NAM</h4>
                    </a>
                  </li>
                  <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/phan-loai?gender=false" class="d-flex">
                      <h4>NỮ</h4>
                    </a>
                    
                  </li>
                  <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/phan-loai" class="d-flex">
                      <h4>SALE OFF</h4>
                    </a>
                  </li>
                  <li class="menu-item">
                    <a href="discover-you.html" class="d-flex">
                      <img src="${pageContext.request.contextPath}/resources/images/DiscoverYOU.png" alt="" />
                    </a>
                  </li>
                </ul>
              </div>
              <div class="col-md-3">
                <form id="searchBox">
                  <div class="form-group d-flex">
                    <input
                      type="text"
                      name="searchInput"
                      id="searchInput"
                      class="form-control"
                      placeholder="Bạn cần tìm..."
                      aria-describedby="helpId"
                    />
                    <a href="tim-kiem.html" class="btn" id="searchBtn">
                      <i class="fas fa-search"></i>
                    </a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
    <main id="home_page">
      <section id="section_banner">
        <div id="ruleCarousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner" role="listbox">
                <a class="carousel-item active">
                    free shipping hoá đơn từ 800k!
                </a>
                <a class="carousel-item">
                    hàng 2 tuần nhận đổi - giày nữa năm bảo hành
                </a>
                <a class="carousel-item">
                    buy more pay less - áp dụng khi mua phụ kiện
                </a>
            </div>
            <a class="carousel-control-prev" href="#ruleCarousel" role="button" data-slide="prev">
                <!-- carousel-control-prev-icon -->
                <span class="fas fa-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#ruleCarousel" role="button" data-slide="next">
                <span class="fas fa-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </section>