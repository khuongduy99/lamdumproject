<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<jsp:include page="_header.jsp" />

    <section id="poster_main">
        <div class="container">
            <div class="glider-contain">
                <div class="glider--poster">
                    <a href="#">
                        <img src="${pageContext.request.contextPath}/resources/images/AnanasxLuckyLuke-Pack_poster.png" alt="">
                    </a>
                    <a href="#">
                        <img src="${pageContext.request.contextPath}/resources/images/poster_2.png" alt="">
                    </a>
                    <a href="#">
                        <img src="${pageContext.request.contextPath}/resources/images/poster_3.png" alt="">
                    </a>
                </div>
                <div role="tablist" class="rect rect--poster"></div>
              </div>
        </div>
        <script>
            $("#poster_main").ready(function(){
                window.addEventListener('load', function(){
                new Glider(document.querySelector('.glider--poster'), {
                slidesToShow: 1,
                dots: '.rect--poster',
                draggable: true
            });
            })  
            })            
        </script>
    </section>
    
    <section id="section_menu_product">
        <div class="container-fluid">
            <h2>DANH SÁCH MUA HÀNG</h2>
            <div class="d-flex">
                <div class="col-md-4">
                    <div class="img_bg inner">
                        <img src="${pageContext.request.contextPath}/resources/images/catalogy-1.jpg" alt="">
                    </div>
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                          <h3 class="card-title">
                              <a href="#">giày nam</a>
                          </h3>
                          <ul class="menu">
                            <li class="menu-item d-block">
                                <a href="#">New Arrivals</a>
                            </li>
                            <li class="menu-item d-block"><a href="#">Best Seller</a></li>
                            <li class="menu-item d-block"><a href="#">Sale-off</a></li>
                        </ul>
                        </div>
                      </div>
                </div>
                <div class="col-md-4">
                    <div class="img_bg inner">
                        <img src="${pageContext.request.contextPath}/resources/images/catalogy-2.jpg" alt="">
                    </div>
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                          <h3 class="card-title">
                              <a href="#">giày nữ</a>
                          </h3>
                          <ul class="menu">
                            <li class="menu-item d-block">
                                <a href="#">New Arrivals</a>
                            </li>
                            <li class="menu-item d-block"><a href="#">Best Seller</a></li>
                            <li class="menu-item d-block"><a href="#">Sale-off</a></li>
                        </ul>
                        </div>
                      </div>
                </div>
                <div class="col-md-4">
                    <div class="img_bg inner">
                        <img src="${pageContext.request.contextPath}/resources/images/catalogy-3.jpg" alt="">
                    </div>
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                          <h3 class="card-title">
                              <a href="#">dòng sản phẩm</a>
                          </h3>
                          <ul class="menu">
                            <li class="menu-item d-block">
                                <a href="#">New Arrivals</a>
                            </li>
                            <li class="menu-item d-block"><a href="#">Best Seller</a></li>
                            <li class="menu-item d-block"><a href="#">Sale-off</a></li>
                        </ul>
                        </div>
                      </div>
                </div>
            </div>
        </div>
    </section>
    <section id="section_best_seller">
        <div class="container-fluid">
            <h2>SẢN PHẨM ĐANG KHUYẾN MÃI</h2>
            <div class="glider-contain">
                <div class="glider--best_seller">
                <c:forEach items="${ ListProductSale }" var="item">
                	<div class="content">
                    <div class="card card_product">
                        <a href="${pageContext.request.contextPath}/chi-tiet-sp?code=${ item.code }">
                            <img src="${pageContext.request.contextPath}/resources${ item.image }" class="card-img-top" alt="">
                        </a>
                        <div class="card-body">
                            <h5>
                                <a href="${pageContext.request.contextPath}/chi-tiet-sp?code=${ item.code }">${ item.name }
                                </a>
                            </h5>
                           
                           <c:if test="${ item.sale != 0 }">
	                        	<p class="bold">${ item.sale } VND</p>
	                        	<p><del>${ item.price } VND</del></p>
	                        </c:if>
	                        <c:if test="${ item.sale == 0 }">
	                        	<p class="bold">${ item.price } VND</p>
	                        </c:if>
                        </div>
                    </div>
                  </div>
                </c:forEach>
                  
                  
                </div>
                <button aria-label="Previous" class="glider-prev">
                    <i class="fas fa-chevron-left"></i>
                </button>
                <button aria-label="Next" class="glider-next">
                    <i class="fas fa-chevron-right"></i>
                </button>
            </div>
        </div>
        <script>
            $("#section_best_seller").ready(function(){
                window.addEventListener('load', function(){
                    new Glider(document.querySelector('.glider--best_seller'), {
                    slidesToShow: 4,
                    slidesToScroll: 4,
                    draggable: true,
                    arrows: {
                        prev: '.glider-prev',
                        next: '.glider-next'
                    }
            });
            })  
            })
        </script>
    </section>
    
    <section id="section_hot_product">
        <div class="container-fluid">
            <h2>SẢN PHẨM HOT</h2>
            <div class="glider-contain">
                <div class="glider--hot_product">
                  <c:forEach items="${ ListProductHot }" var="item">
                	<div class="content">
                    <div class="card card_product">
                        <a href="${pageContext.request.contextPath}/chi-tiet-sp?code=${ item.code }">
                            <img src="${pageContext.request.contextPath}/resources${ item.image }" class="card-img-top" alt="">
                        </a>
                        <div class="card-body">
                            <h5>
                                <a href="${pageContext.request.contextPath}/chi-tiet-sp?code=${ item.code }">${ item.name }
                                </a>
                            </h5>
                           
                           <c:if test="${ item.sale != 0 }">
	                        	<p class="bold">${ item.sale } VND</p>
	                        	<p><del>${ item.price } VND</del></p>
	                        </c:if>
	                        <c:if test="${ item.sale == 0 }">
	                        	<p class="bold">${ item.price } VND</p>
	                        </c:if>
                        </div>
                    </div>
                  </div>
                </c:forEach>
                  
                </div>
                <button aria-label="Previous" class="glider-prev">
                    <i class="fas fa-chevron-left"></i>
                </button>
                <button aria-label="Next" class="glider-next">
                    <i class="fas fa-chevron-right"></i>
                </button>
            </div>
        </div>
        <script>
            $("#section_hot_product").ready(function(){
                window.addEventListener('load', function(){
                    new Glider(document.querySelector('.glider--hot_product'), {
                    slidesToShow: 4,
                    slidesToScroll: 4,
                    draggable: true,
                    arrows: {
                        prev: '.glider-prev',
                        next: '.glider-next'
                    }
            });
            })  
            })
        </script>
    </section>
    
    <section id="section_news">
        <div class="container-fluid">
            <h2>TIN TỨC & BÀI VIẾT</h2>
            <div class="contents news_grid">
              <div class="card">
                <a href="discover-you.html">
                    <img src="${pageContext.request.contextPath}/resources/images/peeping_pattas01.png" class="card-img-top" alt="...">
                </a>
                <div class="card-body">
                  <h3 class="card-title">
                      <a href="#">SNEAKER FEST VIETNAM VÀ SỰ KẾT HỢP</a>
                  </h3>
                  <a href="#" class="card-text">
                    Việc sử dụng dáng giày Vulcanized High Top của Ananas trong thiết kế và cảm hứng bắt nguồn từ linh vật Peeping - đại diện cho tinh thần xuyên suốt 6 năm qua Sneaker Fest Vietnam, chúng tôi tự tin đây sẽ là sản phẩm đáng mong chờ cho mọi “đầu giày” vào mùa hè năm nay...
                      <i>Đọc thêm</i>
                  </a>
                </div>
            </div>
            <div class="card">
                <a href="discover-you.html">
                    <img src="${pageContext.request.contextPath}/resources/images/news_2.jpg" class="card-img-top" alt="...">
                </a>
                <div class="card-body">
                  <h3 class="card-title">
                      <a href="discover-you.html">URBAS CORLURAY PACK</a>
                  </h3>
                  <a href="discover-you.html" class="card-text">
                    Urbas Corluray Pack đem đến lựa chọn “làm mới mình” với sự kết hợp 5 gam màu mang sắc thu; phù hợp với những người trẻ năng động, mong muốn thể hiện cá tính riêng biệt khó trùng lặp.
                      <i>Đọc thêm</i>
                  </a>
                </div>
            </div>
            <div class="card">
                <a href="discover-you.html">
                    <img src="${pageContext.request.contextPath}/resources/images/Mobile_Blog-1980s_0.png" class="card-img-top" alt="...">
                </a>
                <div class="card-body">
                  <h3 class="card-title">
                      <a href="#">VINTAS SAIGON 1980s</a>
                  </h3>
                  <a href="#" class="card-text">
                    Với bộ 5 sản phẩm, Vintas Saigon 1980s Pack đem đến một sự lựa chọn “cũ kỹ thú vị” cho những người trẻ sống giữa thời hiện đại nhưng lại yêu nét bình dị của Sài Gòn ngày xưa ...
                      <i>Đọc thêm</i>
                  </a>
                </div>
            </div>
            </div>
        </div>
    </section>
    </main>
    
   
  
  <jsp:include page="_footer.jsp" />