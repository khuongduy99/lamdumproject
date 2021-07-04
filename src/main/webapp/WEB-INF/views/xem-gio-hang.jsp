<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<jsp:include page="_header.jsp" />
   <section id="gio_hang_page">
            <div class="container">
                <div class="d-flex">
                    <artical id="content_cart" class="col-md-8 mr-4">
                        <div id="my_cart" class="show">
                          <div class="title">
                            <h4>GIỎ HÀNG</h4>
                          </div>
                          <div id="list_order">
                          <c:if test="${sessionScope.Cart != null}">
	                    	<c:forEach items="${ sessionScope.Cart.list }" var="item" >
                          	<div class="card">
                          	<form action="${pageContext.request.contextPath}/cap-nhat-gio" method="POST" >
                          	  <input type="hidden" name="id" value="${ item.id }">
                              <div class="row no-gutters">
                                <img src="${pageContext.request.contextPath}/resources${ item.image }" class="card-img" alt="...">
                                <div class="card-body col-md-6">
                                    <h4 class="card-title"><a href="#">${ item.name }</a></h4>
                                    <p  class="card-price"><strong>Giá:</strong> <span id="get_price_id">${ item.price }</span> VND</p>
                                    <div class="edit_box">
                                      <div class="box_group">
                                        
                                            <div class="d-flex">
                                                <div class="form-group col-md-6">
                                                    <label for="get-size">
                                                        SIZE
                                                    </label>
                                                    <select style="width:100% ;height: 38px" name="size" id="get-size">
                                                    	<c:forEach var="i" begin="35" end="43" step="1">
                                                    			<c:if test="${ item.size == i }">
                                                    				<option value="${ i }" selected>${ i }</option>
                                                    			</c:if>
	                                                        	<c:if test="${ item.size != i }">
                                                    				<option value="${ i }">${ i }</option>
                                                    			</c:if>
														</c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="get-qty">
                                                        SỐ LƯỢNG
                                                    </label>
                                                    <input type="number" style="height: 38px" value="${ item.qtyInCart }" name="qty" id="get-qty" >
                                                </div>
                                            </div>
                                        
                                    </div>
                                    </div>
                                </div>
                                <div class="check_price col-md-3">
                                  <h4><span class="check_price_prod">${ item.totalMoneyOfProduct }</span> VND</h4>
                                  <i class="check_val_prod">Còn hàng</i>
                                  <button class="choose_btn" type="submit">
                                    <i class="fas fa-check"></i>
                                  </button>
                                  <button class="delete_btn" type="button" onclick="window.location.href='${pageContext.request.contextPath}/xoa-khoi-gio?id=${ item.id }'">
                                    <i class="far fa-trash-alt"></i>
                                  </button>
                                </div>
                              </div>
                              </form>
                            </div>
                          	</c:forEach>
                          	<c:if test="${sessionScope.Cart.size == 0}">
		                    	<h4>Giỏ hàng trống</h4>
		                    </c:if>
	                   	 </c:if>
		                    <c:if test="${sessionScope.Cart == null}">
		                    	<h4>Giỏ hàng trống</h4>
		                    </c:if>
                          	
                            
                          </div>
                          <hr>
                          <div id="btn_handle">
                            <div class="d-flex">
                              <div class="col-md-6">
                                <a href="${pageContext.request.contextPath}/phan-loai" class="btn">QUAY LẠI MUA HÀNG</a>
                              </div>
                            </div>
                          </div>
                        </div>
                        
                    </artical>
                    <artical id="total_cart" class="col-md-4">
                      <h4>ĐƠN HÀNG</h4>
                      <form id="frm_bill">
                        
                        
                        <div class="form-group">
                            <div class="d-flex" style="justify-content: space-between; align-items: center;">
                              <h5>TẠM TÍNH</h5>
                              <h3>
                              <c:if test="${sessionScope.Cart == null}">
		                    	<span id="total_price_final">0</span> VND
		                      </c:if>
                              <c:if test="${sessionScope.Cart != null}">
		                    	<span id="total_price_final">${ sessionScope.Cart.total }</span> VND
		                      </c:if> 
                              </h3>
                            </div>
                        </div>
                        <c:if test="${pageContext.request.userPrincipal != null}">
                        	<a href="${pageContext.request.contextPath}/dat-hang" class="btn tttt_btn">
	                          MUA HÀNG
	                        </a>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal == null}">
                        	<a href="#" data-toggle="modal" data-target="#funct_login" class="btn tttt_btn">
	                          MUA HÀNG
	                        </a>
                        </c:if>
                      </form>
                    </artical>
                </div>
            </div>
        </section>
<jsp:include page="_footer.jsp" />