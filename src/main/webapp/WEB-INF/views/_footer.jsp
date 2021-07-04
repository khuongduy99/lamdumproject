 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
 <!-- on_top_btn -->
    <a href="#sidebar" type="button" id="to_top_btn" class="btn" data-toggle="tooltip" data-placement="top" title="Back to Top">
      <i class="fas fa-chevron-up"></i>
    </a>
    <!-- modal login -->
    <div class="modal fade" id="funct_login" tabindex="-1" role="dialog" aria-labelledby="funct_login" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <div class="d-flex w-100">
              <div class="col-md-12">
              <img src="${pageContext.request.contextPath}/resources/images/Logo_Ananas_Header.png" alt="logo" id="funct_login--logo">
              <h3 class="modal-title" id="funct_login--title">
                  CHÀO MỪNG ĐẾN VỚI ANANAS
              </h3>
              </div>
              <div class="inner" id="btn_close">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            </div>
          </div>
          <div class="modal-body">
            <form id="frm_login" action="${pageContext.request.contextPath}/j_spring_security_check" method="POST">
            <c:if test="${ login == 'false' }">
	    		<div class="alert alert-danger alert-dismissible fade show">
			    	<button type="button" class="close" data-dismiss="alert">&times;</button>
			    	<strong>Đăng nhập thất bại!</strong> Tên đăng nhập hoặc mật khẩu không đúng.
			  	</div>
    		</c:if>
             
              <div class="form-group">
                <input type="text" name="username" id="ip_email" placeholder="Tên đăng nhập">
              </div>
              <div class="form-group">
                <input type="password" name="password" id="ip_pass" placeholder="Mật khẩu">
              </div>
              <a href="#" id="forget_pass">Quên mật khẩu?</a>
              <div class="form-group">
              <a></a>
                <button type="submit"><a>Đăng nhập</a></button>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <p>Chưa có tài khoản tại Ananas? <a href="${pageContext.request.contextPath}/dang-ky">Đăng ký</a></p>
          </div>
        </div>
      </div>
    </div>

<!-- footer -->
  <footer>
  <div class="container">
      <div class="d-flex">
          <div class="col-md-3">
              <div class="store d-flex">
                  <img src="${pageContext.request.contextPath}/resources/images/Store.png" alt="">
                  <a href="tim-cua-hang.html" class="storeBtn btn">TÌM CỬA HÀNG</a>
              </div>
          </div>
          <div class="col-md-9">
              <div class="content-foot">
                  <div class="row">
                      <div class="col-md-3">
                          <ul class="menu-bot">
                              <li class="head">
                                 SẢN PHẨM
                              </li>
                              <li><a href="san-pham.html">Giày Nam</a></li>
                              <li><a href="san-pham.html">Giày Nữ</a></li>
                              <li><a href="san-pham.html">Thời trang & Phụ kiện</a></li>
                              <li><a href="san-pham.html">Sale off</a></li>
                          </ul>
                      </div>
                      <div class="col-md-3">
                          <ul class="menu-bot">
                              <li class="head">
                                  VỀ CÔNG TY
                              </li>
                              <li><a href="tuyen-dung.html">Dứa tuyển dụng</a></li>
                              <li><a href="lien-he.html">Liên hệ</a></li>
                              <li><a href="#">Về Ananas</a></li>
                              
                          </ul>
                      </div>
                      <div class="col-md-3">
                          <div class="menu-bot">
                              <div class="head">
                                  ANANAS SOCIAL
                              </div>
                              <div class="d-flex ">
                                  <a href="#" class="socialIcon">
                                      <img src="${pageContext.request.contextPath}/resources/images/icon_social1.png" alt="">
                                  </a>
                                  <a href="#" class="socialIcon">
                                      <img src="${pageContext.request.contextPath}/resources/images/icon_social2.png" alt="">
                                  </a>
                                  <a href="#" class="socialIcon">
                                      <img src="${pageContext.request.contextPath}/resources/images/icon_social3.png" alt="">
                                  </a>
                                  
                              </div>
                          </div>
                      </div>
                      <div class="col-md-3">
                          <ul class="menu-bot">
                              <li class="head">
                                  THÀNH VIÊN
                              </li>
                              <li>Trần Thu An</li>
                              <li>Từ Phước Thiện</li>
                              <li>Nguyễn Tiến</li>
                          </ul>
                      </div>
                  </div>
                  <div class="row">
                      <div class="col-md-6">
                          <img src="${pageContext.request.contextPath}/resources/images/Logo_Ananas_Footer.png" alt="">
                      </div>
                      <div class="col-md-6">
                          <p>
                              Copy
                              <i class="fa fa-copyright" aria-hidden="true"></i>
                              2020 Ananas. All rights reserved
                          </p>
                          
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  </footer>
    <!-- JS -->
    <c:if test="${ login != null }">
    	<c:if test="${ login == 'true' }">
    		<script type="text/javascript">
    			$("#funct_login").modal('show');
    		</script>
    	</c:if>
    	<c:if test="${ login == 'false' }">
    		<script type="text/javascript">
    			$("#funct_login").modal('show');
    		</script>
    	</c:if>
    </c:if>
    
    <script src="${pageContext.request.contextPath}/resources/themes/js/main.js"></script>    
</body>
</html>