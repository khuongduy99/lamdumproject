<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="_header.jsp" />
	<div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Chỉnh sửa sản phẩm</h1>
                        </div>
                 <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
	                                <button class="btn btn-social btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/admin/product/list'">
		                                   <i class="fa fa-list-ol"></i> Xem danh sách
		                            </button>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                    	<div class="col-md-12">
                                        	<form:form action="${pageContext.request.contextPath}/admin/product/edit" modelAttribute="product" method="post">
                                        		<c:if test="${ error != null }">
                                        			<div class="alert alert-danger alert-dismissible">
	                                        			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                                        			${ error }
	                                                </div>
                                        		</c:if>
                                        		<form:input type="hidden" path="id" />
                                        		<div class="row">
                                        			<div class="col-md-8">
                                        				<div class="form-group">
		                                                    <label for="brand">Nhãn hàng</label>
		                                                    <form:select path="brandId" id="brand" class="form-control">
		                                                    		<form:option value="">-- Chọn --</form:option>
		                                                    	<c:forEach items="${ ListBrand }" var="item">
		                                                    		<form:option value="${ item.id }">${ item.name }</form:option>
		                                                    	</c:forEach>
															</form:select>
															<form:errors path="brandId" class="text-danger"/>
															<p class="help-block"><a href="${pageContext.request.contextPath}/admin/brand/add">Thêm nhãn hàng</a></p>
		                                                </div>
		                                                <div class="form-group">
		                                                    <label for="name">Tên sản phẩm</label>
		                                                    <form:input type="text" id="name" path="name" class="form-control" placeholder="Nhập tên sản phẩm" />
		                                                    <form:errors path="name" class="text-danger"/>
		                                                    <p class="help-block">Từ 2 đến 100 ký tự.</p>
		                                                </div>
		                                                <div class="row">
		                                                	<div class="form-group col-md-4">
			                                                    <label>Sản phẩm cho: </label>
			                                                    <label class="radio-inline">
			                                                        <form:radiobutton path="gender" value="male" checked="checked" />Nam
			                                                    </label>
			                                                    <label class="radio-inline">
			                                                        <form:radiobutton path="gender" value="female" />Nữ
			                                                    </label>
			                                                </div>
		                                                	<div class="form-group col-md-2">
			                                                    <label for="qty">Số lượng</label>
			                                                    <form:input type="number" id="qty" path="qty" class="form-control" placeholder="Nhập số lượng" />
			                                                    <form:errors path="qty" class="text-danger"/>
			                                                    <p class="help-block">Vd: 1.</p>
		                                                	</div>
		                                                	<div class="form-group col-md-6">
			                                                    <div class="form-group">
				                                                    <label for="status">Trạng thái</label>
				                                                    <form:select path="status" id="status" class="form-control">
																		<form:option value="active">Kích hoạt</form:option>
																		<form:option value="in_active">Ẩn</form:option>
																	</form:select>
				                                                </div>
		                                                	</div>
		                                                </div>
		                                                
		                                                <div class="row">
		                                                	<div class="form-group col-md-6">
			                                                    <label for="price">Giá niêm yết</label>
			                                                    <form:input type="number" id="price" path="price" class="form-control" placeholder="Nhập giá tiền" />
			                                                    <form:errors path="price" class="text-danger"/>
			                                                    <p class="help-block">Vd: 1000000.</p>
		                                                	</div>
		                                                	<div class="form-group col-md-6">
			                                                    <label for="sale">Giá khuyến mãi</label>
			                                                    <form:input type="number" id="sale" path="sale" class="form-control" placeholder="Nhập giá tiền" />
			                                                    <form:errors path="sale" class="text-danger"/>
			                                                    <p class="help-block">Vd: 1000000.</p>
		                                                	</div>
		                                                </div>
		                                                <div class="form-group">
		                                                    <label for="descriptions">Mô tả:</label>
		                                                    <form:textarea path="descriptions" id="descriptions" rows="5" class="form-control"/>
		                                                </div>
                                        			</div>
                                        			<div class="col-md-4">
                                        				<div class="form-group">
		                                                    <label for="descriptions">Ảnh sản phẩm:</label>
		                                                    <a href="#" onclick="openImages('image-product')">
		                                                    	<img alt="" width="100%" id="src-image-product" src="${pageContext.request.contextPath}/resources${ product.image }">
		                                                    	<form:input type="hidden" id="image-product" path="image"/>
		                                                    </a>
		                                                </div>
		                                                <div class="form-group">
		                                                    <label for="descriptions">Ảnh chi tiết sản phẩm:</label>
		                                                    <div class="row">
		                                                    <c:set value="1" var="stt"/>
		                                                    	<c:forEach items="${ product.images }" var="item">
		                                                    		<div class="col-xs-3">
			                                                    		<a href="#" onclick="openImages('image-product-${ stt }')">
					                                                    	<img alt="" width="100%" id="src-image-product-${ stt }" src="${pageContext.request.contextPath}/resources${ item }">
					                                                    	<form:input type="hidden" id="image-product-${ stt }" path="images" value="${ item }"/>
					                                                    </a>
			                                                    	</div>
			                                                    	<c:set value="${ stt + 1 }" var="stt"/>
		                                                    	</c:forEach>
		                                                    </div>
		                                                    
		                                                </div>
                                        			</div>
                                        		</div>
                                        		
                                                <div class="text-center">
	                                                <button type="submit" class="btn btn-social btn-success">
	                                                	<i class="fa fa-save"></i> Lưu
	                                                </button>
	                                                <button type="button" class="btn btn-social btn-danger" onclick="window.location.href='${pageContext.request.contextPath}/admin/product/list'">
	                                                	<i class="fa fa-trash-o"></i> Hủy
	                                                </button>
                                                </div>
                                        	</form:form>
                                         </div>
                                    </div>
                                    <!-- /.row (nested) -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                            
                             <!-- Modal -->
                                    <div class="modal fade" id="modal-images" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title" id="myModalLabel">Thư viện ảnh</h4>
                                                </div>
                                                <div class="modal-body"> 
			                                         <div class="row"></div>
                                                </div>
                                                <div class="text-center">
				                                   <ul class="pagination justify-content-center"></ul>
                                                </div>
                                                <div class="modal-footer">
                                                    
                                                    <button type="button" id="btn-select-image" class="btn btn-primary">Chọn</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    <!-- /.modal -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->
            
	<jsp:include page="_footer.jsp" />      