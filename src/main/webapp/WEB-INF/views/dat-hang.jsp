<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="_header.jsp" />
<main id="checkout_page">
        <div class="container">
         <form:form id="frm_post_address" class="form_info" action="${pageContext.request.contextPath}/order" modelAttribute="order" method="post">
            <div class="d-flex">
                <!-- section Info Custom, Payment -->
                <div class="col-md-7 mr-4">
               
                    <section id="info_shipping" class="mb-3">
                        <p  class="collapse_title">
                            <a class="btn d-flex" data-toggle="collapse" href="#address_box" aria-expanded="false" aria-controls="address_box">
                                <span>THÔNG TIN GIAO HÀNG</span>
                                <i class="fas fa-chevron-down"></i>
                            </a>
                        </p>
                        <div class="collapse show collapse--edit" id="address_box">
                            	<form:input type="hidden" path="userId" />
                            	<form:input type="hidden" path="totalMoney"/>
                                <div class="form-group">
                                    <label for="getNameCus" class="col-md-3">Họ tên:</label>
                                    <form:input type="text" class="fullname" path="fullname" id="getNameCus" readonly="true"/>
                                </div>
                                <div class="form-group">
                                    <label for="getPhoneCus" class="col-md-3">Số điện thoại:</label>
                                    <form:input type="text" class="phone" path="phone" id="getPhoneCus" readonly="true"/>
                                </div>
                                <div class="form-group">
                                    <label for="getAddress" class="col-md-3">
                                        Địa chỉ giao hàng:
                                    </label>
                                    <form:textarea path="address" class="address" id="editAddress" cols="70" rows="2" readonly="true"></form:textarea>
                                </div>
                                <div class="form-group">
                                    <button type="button" id="edit_btn" class="btn btn-md" data-toggle="modal" data-target="#modelEditInfoShip">
                                       <span class="mr-2">THAY ĐỔI THÔNG TIN GIAO HÀNG</span>
                                       <i class="far fa-edit"></i>
                                      </button>
                                </div>
                            <input disabled="disabled">
                        </div>
                    </section>
                    
                    <section id="payment_method">
                        <p class="collapse_title">
                        <a class="btn d-flex" data-toggle="collapse" href="#payment_box" aria-expanded="false" aria-controls="payment_box">
                                <span>PHƯƠNG THỨC THANH TOÁN</span>
                                <i class="fas fa-chevron-down"></i>
                        </a>
                        </p>
                        <div class="collapse show collapse--edit" id="payment_box">
                            <div class="form-check d-flex">
                            <input type="checkbox" class="form-check-input" name="pay" id="pay1" value="pay1" checked>
                            <label for="pay1" class="form-check-label">
                                <span>Thanh toán khi nhận hàng</span>
                                <i class="fas fa-question-circle"></i>
                                <div class="tt tooltip_cod">
                                    Là phương thức thanh toán bằng tiền mặt trực tiếp khi nhận hàng
                                </div>
                                <img src="../images/icon_COD.png" alt="">
                            </label>
                            
                            </div>
                        </div>
                    </section>
                </div>
                <!-- section price -->
                <div class="col-md-5" id="total_checkout">
                        <h4>ĐƠN HÀNG</h4>
                        <hr>
                        <ul id="listProd" class="p-0">
                        	<c:if test="${sessionScope.Cart != null}">
                        	<c:forEach items="${ sessionScope.Cart.list }" var="item">
                        	<li class="list_item w-100 d-flex">
                                <div class="col-md-9">
                                    <span class="get_name_prod">
                                        ${ item.name }
                                    </span>
                                    <div class="d-flex">
                                        <p class="col-md-6">
                                        Size: 
                                        <span class="get_size_prod">${ item.size }</span>
                                        </p>
                                        <p class="col-md-6">
                                            x
                                        <span class="get_qty_prod">${ item.qtyInCart }</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <p>
                                        <span class="get_price_prod">${ item.totalMoneyOfProduct }</span> VND
                                    </p>
                                </div>
                            </li>
                        	</c:forEach>
                            </c:if>
                        </ul>
                        <hr>
                        <div class="d-flex" id="total_bill">
                            <div class="col-md-6">
                                TỔNG CỘNG
                            </div>
                            <div class="col-md-6">
                                <span id="total">${ sessionScope.Cart.total }</span> VND
                            </div>
                        </div>
                        <a href="#" class="btn w-100" onclick="document.getElementById('frm_post_address').submit()" id="finish_order_btn">
                            HOÀN TẤT ĐẶT HÀNG
                        </a>
                </div>
               
            </div>
             </form:form>
        </div>
        
        <!-- Modal edit information shipping-->
    <div class="modal fade" id="modelEditInfoShip" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">THAY ĐỔI THÔNG TIN</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                </div>
                <div class="modal-body">
                    <form:form id="frm_edit_address" class="form_info" modelAttribute="order">
                        <div class="form-group">
                            <label for="editNameCus" class="col-md-3">Họ tên:</label>
                            <form:input type="text" class="fullname" path="fullname" id="editNameCus" required="true"/>
                            <i class="fas fa-eraser"></i>
                        </div> 
                        <div class="form-group">
                            <label for="editPhoneCus" class="col-md-3">Số điện thoại:</label>
                            <form:input type="text" class="phone" path="phone" id="editPhoneCus" required="true"/>
                            <i class="fas fa-eraser"></i>

                        </div>
                        <div class="form-group">
                            <label for="editAddress" class="col-md-3">
                                Địa chỉ giao hàng:
                            </label>
                            <form:textarea path="address" class="address" id="editAddress" cols="70" rows="2" required="true"></form:textarea>
                            <i class="fas fa-eraser"></i>
                        </div>
                    </form:form>
                </div>
                <div class="modal-footer">
                    <div class="d-flex">
                        <button type="button" class="btn btn-dark mr-3" data-dismiss="modal">ĐÓNG</button>
                        <button type="button" class="btn" id="update_info_btn" onclick="updateInfo()">CẬP NHẬT</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script>

	function updateInfo() {
		var fullname = $("#frm_edit_address .fullname").val();
		var phone = $("#frm_edit_address .phone").val();
		var address = $("#frm_edit_address .address").val();
		$("#frm_post_address .fullname").val(fullname);
		$("#frm_post_address .phone").val(phone);
		$("#frm_post_address .address").val(address);
		
		$("#modelEditInfoShip").modal("hide");
	}
</script>
<jsp:include page="_footer.jsp" />