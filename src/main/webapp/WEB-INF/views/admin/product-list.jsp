<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="_header.jsp" />

            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">DANH SÁCH SẢN PHẨM</h1>
                        </div>
                        
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading row">
                                	<div class="col-md-6">
		                                <button class="btn btn-social btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/admin/product/add'">
	                                        <i class="fa fa-plus"></i> Thêm mới
	                                    </button>
                                    </div>
                                </div>
                                
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="table-responsive">
                                    	<c:if test="${ message != null && alert != null}">
                                        	<div class="alert alert-${ alert  } alert-dismissible">
	                                        	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                                        	
	                                        	<c:if test="${ message eq 'add' }">
		                                        	${ 'Thêm thành công!' }
		                                        </c:if>
		                                        <c:if test="${ message eq 'edit' }">
		                                        	${ 'Chỉnh sửa thành công!' }
		                                        </c:if>
		                                        <c:if test="${ message eq 'delete' && alert eq 'success'}">
		                                        	${ 'Xóa thành công!' }
		                                        </c:if>
		                                        <c:if test="${ message eq 'delete' && alert eq 'danger'}">
		                                        	${ 'Xóa thất bại!' }
		                                        </c:if>
		                                        
	                                         </div>
                                        </c:if>
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th width="5%">STT</th>
                                                    <th width="10%">Ảnh</th>
                                                    <th>Tên</th>
                                                    <th>Code</th>
                                                    <th>Giá</th>
                                                    <th>Trạng thái</th>
                                                    <th>Công cụ</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                               	<c:set value="1" var="stt"/>
                                                <c:forEach items="${ ListProduct }" var="item">
                                                 <tr>
													<td>${ stt }</td>
													<td>
                                                    	<img alt="" width="100%" src="${pageContext.request.contextPath}/resources${ item.image }">
                                                    </td>
                                                    <td>${ item.name }</td>
                                                    <td>${ item.code }</td>
                                                    <td>
                                                    	<c:if test="${ item.sale != 0 }">
                                                    		${ item.sale } ₫ <br>
                                                    		<del>${ item.price } ₫</del>
                                                    	</c:if>
                                                    	<c:if test="${ item.sale == 0 }">
                                                    		${ item.price } ₫
                                                    	</c:if>
                                                    </td>
                                                    <td>
                                                    	<c:if test="${ item.status eq 'active' }">
                                                    		<span class="badge badge-success">Kích hoạt</span>
                                                    	</c:if>
                                                    	<c:if test="${ item.status eq 'in_active' }">
                                                    		<span class="badge badge-danger">Ẩn</span>
                                                    	</c:if>
                                                    </td>
                                                    <td>
                                                    	<a class="btn btn-success btn-circle" title="Chỉnh sửa" href="${pageContext.request.contextPath}/admin/product/edit?id=${ item.id }"><i class="fa fa-edit"></i></a>
                                                    	<a class="btn btn-danger btn-circle" title="Xóa" href="${pageContext.request.contextPath}/admin/product/delete?id=${ item.id }"><i class="fa fa-trash-o"></i></a>
                                                    </td>
                                                 </tr>
                                                 <c:set value="${ stt + 1 }" var="stt"/>
												</c:forEach>
                                                    
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->
        <!-- /#wrapper -->
<jsp:include page="_footer.jsp" />      
