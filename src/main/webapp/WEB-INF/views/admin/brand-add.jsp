<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="_header.jsp" />
	<div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Thêm nhãn hàng</h1>
                        </div>
                 <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
	                                <button class="btn btn-social btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/admin/brand/list'">
		                                   <i class="fa fa-list-ol"></i> Xem danh sách
		                            </button>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                    	<div class="col-md-12">
                                        	<form:form action="${pageContext.request.contextPath}/admin/brand/add" modelAttribute="brand" method="post">
                                        		<c:if test="${ error != null }">
                                        			<div class="alert alert-danger alert-dismissible">
	                                        			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                                        			${ error }
	                                                </div>
                                        		</c:if>
                                        		
                                        	
                                        		<div class="form-group">
                                                    <label>Tên nhãn hàng</label>
                                                    <form:input type="text" path="name" class="form-control" placeholder="Nhập tên nhãn hàng" />
                                                    <form:errors path="name" class="text-danger"/>
                                                    <p class="help-block">Từ 2 đến 100 ký tự.</p>
                                                </div>
                                                <div style="float: right">
	                                                <button type="submit" class="btn btn-social btn-success">
	                                                	<i class="fa fa-save"></i> Lưu
	                                                </button>
	                                                <button type="reset" class="btn btn-social">
	                                                	<i class="fa fa-refresh"></i> Làm trắng
	                                                </button>
	                                                <button type="button" class="btn btn-social btn-danger" onclick="window.location.href='${pageContext.request.contextPath}/admin/brand/list'">
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
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->
            
	<jsp:include page="_footer.jsp" />      