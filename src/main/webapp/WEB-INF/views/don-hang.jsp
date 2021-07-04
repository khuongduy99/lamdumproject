<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<jsp:include page="_header.jsp" />
    <main id="detail_page">
    	<div class="container">
      	<h2>ĐƠN HÀNG CỦA BẠN</h2>
		  <table class="table">
		    <thead class="thead-dark">
		      <tr>
		        <th>STT</th>
		        <th>Họ tên</th>
		        <th>Điện thoại</th>
		        <th>Địa chỉ</th>
		        <th>Trạng thái</th>
		      </tr>
		    </thead>
		    <tbody>
                                               	<c:set value="1" var="stt"/>
                                                <c:forEach items="${ ListBill }" var="item">
                                                 <tr>
													<td>${ stt }</td>
                                                    <td>${ item.fullname }</td>
                                                    <td>${ item.phone }</td>
                                                    <td>${ item.address }</td>
                                                    <td>
                                                    	<c:if test="${ item.status eq 'process' }">
                                                    		<span class="badge badge-danger">Đang xử lý</span>
                                                    	</c:if>
                                                    	<c:if test="${ item.status eq 'success' }">
                                                    		<span class="badge badge-success">Đã giao hàng</span>
                                                    	</c:if>
                                                 </tr>
                                                 <c:set value="${ stt + 1 }" var="stt"/>
												</c:forEach>
		      
		    </tbody>
		  </table>
		  </div>
    </main>
<jsp:include page="_footer.jsp" />