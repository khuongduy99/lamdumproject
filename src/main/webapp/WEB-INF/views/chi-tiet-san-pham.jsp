<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<jsp:include page="_header.jsp" />
    <main id="detail_page">
      <section id="detail_prod_content" class="border_bottom--dashed">
        <div class="container">
            <nav aria-label="breadcrumb" id="breadcrumb_navbar">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">${ product.name }</li>
              </ol>
            </nav>
            <section id="content_prod" class="d-flex">
                <article id="picts_prod" class="col-md-7 pr-5 py-3">
                  <div class="exzoom" id="exzoom">
                    <div class="exzoom_img_box">
                      <ul class='exzoom_img_ul'>
                      <c:set var="str1" value="Welcome-to-JSP-Programming."/>  
                      <c:forEach items="${ images }" var="item">
                      	 <li>
                          <img src="${pageContext.request.contextPath}/resources${ item }"/>
                        </li>
                      </c:forEach>
                       
                      </ul>
                    </div>
                    <div class="exzoom_nav">
                    	</div>
                  </div> 
                  <script>
                    $(function(){
                    $("#exzoom").exzoom({
                      "autoPlay":true,
                      "autoPlayTimeout": 3000
                    });
                    });
                  </script>
                </article>
                <article id="infor_prod" class="col-md-5 py-3">
                    <h2 style="text-transform: uppercase;">${ product.name }
                    </h2>
                    <!-- danh gia san pham -->
                    <div class="rating_section">
                    <div class="d-flex">
                      <p>
                        <span class="fa fa-star checked"></span>
                      <span class="fa fa-star checked"></span>
                      <span class="fa fa-star checked"></span>
                      <span class="fa fa-star checked"></span>
                      <span class="fa fa-star checked"></span>
                      </p>
                      <a href="" class="btn">4.7</a>
                    </div>
                    </div>
                    <!-- ma san pham, trang thai va gia -->
                    <div class="box_group">
                        <div class="d-flex">
                            <div class="col-md-6 p-0">
                                Tình trạng: <b>
                                    <span id="get_state_prod">Best Seller</span>
                                </b> 
                            </div>
                        </div>
                        <c:if test="${ product.sale != 0 }">
                        	<h4><span id="get_price_prod">${ product.sale }</span> VND</h4>
                        	<del><span id="get_price_prod">${ product.price }</span> VND</del>
                        </c:if>
                        <c:if test="${ product.sale == 0 }">
                        	<h4><span id="get_price_prod">${ product.price }</span> VND</h4>
                        </c:if>
                    </div>
                    <!-- mo ta -->
                    <div class="box_group">
                        <p id="get_descript_prod">
                            ${ product.descriptions }
                        </p>
                    </div>
                    <!-- form chon size, so luong, them vao gio hang, thanh toan  -->
                    <div class="box_group">
                        <form id="select_info_prod" action="${pageContext.request.contextPath}/them-vao-gio" method="POST">
                        	<input type="hidden" name="id" value="${ product.id }">
                            <div class="d-flex">
                                <div class="form-group col-md-6">
                                  <label for="get_size_prod">SIZE</label>
                                  <div id="collapse_size">
                                    <a class="btn" data-toggle="collapse" href="#select_collapse" aria-expanded="false" aria-controls="select_collapse" id="btn_select">
                                      <span id="get_size_prod">35</span>
                                      <i class="fas fa-chevron-down"></i>
                                    </a>
                                   <div class="collapse" id="select_collapse">
                                    <ul class="select">
                                        <li class="opt">
                                        <input type="radio" name="size" id="opt0" value="35" checked>35
                                        </li>
                                        <li class="opt">
                                        <input type="radio" name="size" id="opt1" value="36">36
                                        </li>
                                        <li class="opt">
                                        <input type="radio" name="size" id="opt2" value="37">37
                                        </li>
                                        <li class="opt">
                                        <input type="radio" name="size" id="opt3" value="38">38
                                        </li>
                                        <li class="opt">
                                        <input type="radio" name="size" id="opt4" value="39">39
                                        </li>
                                        <li class="opt">
                                        <input type="radio" name="size" id="opt5" value="40">40
                                        </li>
                                        <li class="opt">
                                        <input type="radio" name="size" id="opt6" value="41">41
                                        </li>
                                        <li class="opt">
                                        <input type="radio" name="size" id="opt7" value="42">42
                                        </li>
                                    </ul>
                                    </div>  
                                  </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="get_quantity_order" class="ml-4">
                                        SỐ LƯỢNG
                                    </label>
                                    <input type="number" style="width: 100%; height: 38px" value="1" min="1" max="3" name="qty" id="get_quantity_order" >
                                </div>
                            </div>
                            <div class="form-group d-flex">
                                <button id="add_cart" class="mr-2" type="submit">
                                	<a>
                                   THÊM VÀO GIỎ HÀNG	
                                   </a>
                                </button>
                                <div class="edit_button">
                                  <a class="like_btn btn">
                                    <i class="far fa-heart"></i>
                                   </a>
                                  <p class="popover_hover">Thêm vào mục yêu thích</p>
                                </div>
                            </div>
                            
                        </form>
                        <div id="info_prod">
                          <p>
                            <a class="btn" data-toggle="collapse" href="#get_info_prod" aria-expanded="false" aria-controls="get_info_prod">
                              THÔNG TIN SẢN PHẨM
                            <i class="fas fa-chevron-down"></i>
                            </a>
                          </p>
                          <div class="collapse" id="get_info_prod">
                            <ul class="menu" style="list-style: disc;">
                              <li class="menu-item">Gender: Unisex</li>
                              <li class="menu-item">Size run: 35 - 46</li>
                              <li class="menu-item">Upper: Canvas/Suede</li>
                              <li class="menu-item">Outsole: Rubber</li>
                            </ul>
                            <img src="${pageContext.request.contextPath}/resources/images/size_chart.png" alt="">
                          </div>
                        </div>
                    </div>
                    <div class="box_group">
                      <div id="rule_return_prod">
                        <p>
                          <a class="btn" data-toggle="collapse" href="#return_prod" aria-expanded="false" aria-controls="return_prod">
                            QUY ĐỊNH SẢN PHẨM
                            <i class="fas fa-chevron-down"></i>
                          </a>
                        </p>
                        <div class="collapse" id="return_prod">
                          <ul class="menu" style="list-style: decimal;">
                            <li class="menu-item">
                              Chỉ đổi hàng 1 lần duy nhất, mong bạn cân nhắc kĩ trước khi quyết định.
                            </li>
                            <li class="menu-item">
                              Thời hạn đổi sản phẩm khi mua trực tiếp tại cửa hàng là 07 ngày, kể từ ngày mua. Đổi sản phẩm khi mua online là 14 ngày, kể từ ngày nhận hàng.
                            </li>
                            <li class="menu-item">
                              Sản phẩm đổi phải kèm hóa đơn. Bắt buộc phải còn nguyên tem, hộp, nhãn mác.
                            </li>
                            <li class="menu-item">
                              Sản phẩm đổi không có dấu hiệu đã qua sử dụng, không giặt tẩy, bám bẩn, biến dạng.
                            </li>
                            <li class="menu-item">
                              Ananas chỉ ưu tiên hỗ trợ đổi size. Trong trường hợp sản phẩm hết size cần đổi, bạn có thể đổi sang 01 sản phẩm khác:
                              <p>
                                - Nếu sản phẩm muốn đổi ngang giá trị hoặc có giá trị cao hơn, bạn sẽ cần bù khoảng chênh lệch tại thời điểm đổi (nếu có).
                              </p>
                              <p>
                                - Nếu bạn mong muốn đổi sản phẩm có giá trị thấp hơn, chúng tôi sẽ không hoàn lại tiền.
                              </p>
                            </li>
                            <li class="menu-item">
                              Trong trường hợp sản phẩm - size bạn muốn đổi không còn hàng trong hệ thống. Vui lòng chọn sản phẩm khác.
                            </li>
                            <li class="menu-item">
                              Không hoàn trả bằng tiền mặt dù bất cứ trong trường hợp nào. Mong bạn thông cảm.
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="box_group">
                      <div id="how_repair_prod">
                        <p>
                          <a class="btn" data-toggle="collapse" href="#repair_prod" aria-expanded="false" aria-controls="repair_prod">
                            BẢO HÀNH THẾ NÀO  
                            <i class="fas fa-chevron-down"></i>
                          </a>
                        </p>
                        <div class="collapse" id="repair_prod">
                          Mỗi đôi giày Ananas trước khi xuất xưởng đều trải qua nhiều khâu kiểm tra. Tuy vậy, trong quá trình sử dụng, nếu nhận thấy các lỗi: gãy đế, hở đế, đứt chỉ may,...trong thời gian 6 tháng từ ngày mua hàng, mong bạn sớm gửi sản phẩm về Ananas nhằm giúp chúng tôi có cơ hội phục vụ bạn tốt hơn. Vui lòng gửi sản phẩm về bất kỳ cửa hàng Ananas nào, hoặc gửi đến trung tâm bảo hành Ananas ngay trong trung tâm TP.HCM trong giờ hành chính: <br>
                          Lầu 1, 75/1 Mai Thị Lựu, P. Đa Kao, Q1, TP.HCM <br>
                          Hotline: 028 3526 7774
                        </div>
                      </div>
                    </div>
                </article>
            </section>
        </div>
      </section>
      <!-- san pham lien qua -->
      <section id="section_prods_concern" class="border_bottom--dashed">
      <div class="container-fluid">
          <h2>SẢN PHẨM LIÊN QUAN</h2>
          <div class="glider-contain">
              <div class="glider--prods_concern">
                <div class="content">
                  <div class="card card_product">
                      <a href="chi-tiet-san-pham.html">
                          <img src="${pageContext.request.contextPath}/resources/images/products/pro_basas_A61078_1.jpg" class="card-img-top" alt="">
                      </a>
                      <div class="card-body">
                          <h5>
                              <a href="#">Basas Mono - High Top 
                              </a>
                          </h5>
                          <p>All White</p>
                          <p class="bold"><span>520</span>.000VND</p>
                      </div>
                  </div>
                </div>
                <div class="content">
                  <div class="card card_product">
                      <a href="chi-tiet-san-pham.html">
                          <img src="${pageContext.request.contextPath}/resources/images/products/pro_basas_A61080_1.jpg" class="card-img-top" alt="banner_1">
                      </a>
                      <div class="card-body">
                          <h5>
                              <a href="#">Basas New Simple Life - High Top
                              </a>
                          </h5>
                          <p>Taupe</p>
                          <p class="bold"><span>520</span>.000VND</p>
                      </div>
                    </div>
                </div>
                <div class="content">
                  <div class="card card_product">
                      <a href="chi-tiet-san-pham.html">
                          <img src="${pageContext.request.contextPath}/resources/images/products/pro_basas_A61080_1.jpg" class="card-img-top" alt="banner_1">
                      </a>
                      <div class="card-body">
                          <h5>
                              <a href="#">Basas New Simple Life - High Top - Taupe
                              </a>
                          </h5>
                          <p>Taupe</p>
                          <p class="bold"><span>520</span>.000VND</p>
                      </div>
                    </div>
                </div>
                <div class="content">
                  <div class="card card_product">
                      <a href="chi-tiet-san-pham.html">
                          <img src="${pageContext.request.contextPath}/resources/images/products/pro_basas_A61020_1.jpg" class="card-img-top" alt="banner_1">
                      </a>
                      <div class="card-body">
                          <h5>
                              <a href="#">Basas Bumper Gum - High Top - Offwhite/Gum

                              </a>
                          </h5>
                          <p>Offwhite/Gum</p>
                          <p class="bold"><span>490</span>.000VND</p>
                      </div>
                    </div>
                </div>
                <div class="content">
                  <div class="card card_product">
                      <a href="chi-tiet-san-pham.html">
                          <img src="${pageContext.request.contextPath}/resources/images/products/stu_basas_A61018_1.jpg" class="card-img-top" alt="banner_1">
                      </a>
                      <div class="card-body">
                          <h5>
                              <a href="#">Basas Mono - Black - High Top - All Black

                              </a>
                          </h5>
                          <p>All Black</p>
                          <p class="bold"><span>490</span>.000VND</p>
                      </div>
                    </div>
                </div>
                <div class="content">
                  <div class="card card_product">
                      <a href="chi-tiet-san-pham.html">
                          <img src="${pageContext.request.contextPath}/resources/images/products/pro_basas_A61077_1.jpg" class="card-img-top" alt="banner_1">
                      </a>
                      <div class="card-body">
                          <h5>
                              <a href="#">Basas New Simple Life - High Top - Black

                              </a>
                          </h5>
                          <p>Black</p>
                          <p class="bold"><span>510</span>.000VND</p>
                      </div>
                    </div>
                </div>
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
          $("#section_prods_concern").ready(function(){
              window.addEventListener('load', function(){
                  new Glider(document.querySelector('.glider--prods_concern'), {
                  slidesToShow: 4,
                  slidesToScroll: 4,
                  draggable: true,
                  arrows: {
                      prev: '#section_prods_concern .glider-prev',
                      next: '#section_prods_concern .glider-next'
                  }
          });
          })  
          })
      </script>
    </main>
<jsp:include page="_footer.jsp" />