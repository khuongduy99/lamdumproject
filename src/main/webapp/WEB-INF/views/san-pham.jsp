<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<jsp:include page="_header.jsp" />
    <main id="product_page">
        <div class="container">
          <section id="add_Ads">
            <div id="ADCarousel" class="carousel slide" data-ride="carousel">
              <ol class="carousel-indicators">
                <li data-target="#ADCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#ADCarousel" data-slide-to="1"></li>
                <li data-target="#ADCarousel" data-slide-to="2"></li>
              </ol>
              <div class="carousel-inner" role="listbox">
                  <a href="#" class="carousel-item active">
                      <img src="${pageContext.request.contextPath}/resources/images/banner_aboutUs_2m.png" alt="">
                  </a>
                  <a href="#" class="carousel-item">
                      <img src="${pageContext.request.contextPath}/resources/images/banner_aboutUs_2m_2.png" alt="">
                  </a>
                  <a href="#" class="carousel-item">
                    <img src="${pageContext.request.contextPath}/resources/images/banner_aboutUs_2m_3.png" alt="">
                  </a>
              </div>
          </div>
          </section>
            <div class="d-flex">
                <article class="col-md-3">
                    <section id="menu_side">
                      <h4>TÌM SẢN PHẨM THEO:</h4>
                        <div id="menuCollapes" role="tablist" aria-multiselectable="true">
                          
                          <div class="card">
                            <div class="card-header" role="tab" id="style_prod">
                              <h5 class="mb-0">
                                <a data-toggle="collapse" data-parent="#menuCollapes" href="#style_prod_content" aria-expanded="true" aria-controls="style_prod_content" class="title_card">
                                 GIỚI TÍNH <i class="fas fa-chevron-up"></i>
                                </a>
                              </h5>
                            </div>
                            <div id="style_prod_content" class="collapse in show" role="tabpanel" aria-labelledby="style_prod">
                                <ul class="card-body">
                                  <li>
                                    <a href="#" onclick="getProduct('gender', 'true')"  class="active">Nam</a>
                                  </li>
                                  <li>
                                    <a href="#" onclick="getProduct('gender', 'false')">Nữ</a>
                                </ul>
                            </div>
                          </div>
                          <div class="card">
                            <div class="card-header" role="tab" id="stream_prod">
                              <h5 class="mb-0">
                                <a data-toggle="collapse" data-parent="#menuCollapes" href="#stream_prod_content" aria-expanded="true" aria-controls="style_prod_content" class="title_card">
                                 DÒNG SẢN PHẨM <i class="fas fa-chevron-up"></i>
                                </a>
                              </h5>
                            </div>
                            <div id="stream_prod_content" class="collapse in show" role="tabpanel" aria-labelledby="stream_prod">
                                <ul class="card-body">
	                                <c:forEach items="${ ListBrand }" var="item">
	                                	<li>
	                                    <a href="#" onclick="getProduct('brandId', '${ item.id }')">${ item.name }</a>
	                                  </li>
	                                </c:forEach>
                                </ul>
                            </div>
                          </div>
                        </div>
                    </section>
                </article>
                <article class="col-md-9">
                  <section id="section_prod_list">
                    <div class="container">
                    	<h4 class="text-uppercase">${ TitleProduct }</h4>
                      <div id="page_prods" class="row--grid hip-grid">
                      
                      <c:forEach items="${ ListProduct }" var="item">
                      	<div class="card card_product hip-item">
                          <div class="card-top">
                            <a href="${pageContext.request.contextPath}/chi-tiet-sp?code=${ item.code }" class="card-top_link">
                              <div  class="card-img-top inner">
                                  <img src="${pageContext.request.contextPath}/resources${ item.image }" class="img_first" alt="banner_1">
                                  <img src="${pageContext.request.contextPath}/resources${ item.image }" class="img_second" alt="banner_1">
                              </div>
                              <p class="btn btn_review_prod"><i class="fas fa-eye"></i> XEM CHI TIẾT </p>
                            </a>
                            <button class="like_btn btn">
                              <i class="far fa-heart"></i>
                             </button>
                            <p class="popover_hover">Thêm vào mục yêu thích</p>
                          </div>
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
                      </c:forEach>
                        
                        
                        
                      </div>
                    </div>
                        <script src="${pageContext.request.contextPath}/resources/libs/grid-layout-pagination-hip/lib/hip.js"></script>
                        <script>
                          $("#page_prods").hip({
                            itemsPerPage: 9,
                            itemsPerRow: 3,
                            itemGaps: '20px',
                            paginationPos: 'left'
                          });
                        </script>
                  </section>
                </article>
            </div>
        </div>
    </main>
<script type="text/javascript">

	function getProduct(key, value) {
			var url = window.location.href;
			var checkUrl = url.split("?");
			var x = url;
			if(url.includes(key)) {
				var newUrl = new URL(url);
				var getValueOfKey = newUrl.searchParams.get(key);
				url = url.replace(key + "=" + getValueOfKey, key + "=" + value);
				window.location.href = url;
			} else {
				if(checkUrl.length === 1) {
					url += "?" + key + "=" + value;
					window.location.href = url;
				} else {
					window.location.href = url + "&" + key + "=" + value;
				}
			}
		
	}
</script>
<jsp:include page="_footer.jsp" />