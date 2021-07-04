<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="_header.jsp" />
	<div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Cập nhật trạng thái đơn hàng</h1>
                        </div>
                 <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
	                                <button class="btn btn-social btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/admin/bill/list'">
		                                   <i class="fa fa-list-ol"></i> Xem danh sách
		                            </button>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                    	<div class="col-md-12">
                                        	<form:form action="${pageContext.request.contextPath}/admin/bill/edit" modelAttribute="bill" method="post">
                                        		<form:input type="hidden" path="id" class="form-control"/>
                                                <div class="form-group">
                                                    <label for="status">Trạng thái</label>
                                                    <form:select path="status" id="status" class="form-control">
														<form:option value="process">Đang xử lý</form:option>
														<form:option value="success">Đã giao hàng</form:option>
													</form:select>
                                                </div>
                                                <div style="float: right">
	                                                <button type="submit" class="btn btn-social btn-success">
	                                                	<i class="fa fa-save"></i> Lưu
	                                                </button>
	                                                <button type="button" class="btn btn-social btn-danger" onclick="window.location.href='${pageContext.request.contextPath}/admin/bill/list'">
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