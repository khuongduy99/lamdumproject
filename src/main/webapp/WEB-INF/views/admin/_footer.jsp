<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    </div>
    <input type="hidden" value="${ pageContext.request.contextPath }" id="url-root"/>
  <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/admin/js/metisMenu.min.js"></script>
        
        <!-- DataTables JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/admin/js/dataTables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/admin/js/dataTables/dataTables.bootstrap.min.js"></script>\

        <!-- Custom Theme JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/admin/js/startmin.js"></script>
		
		<!-- Page-Level Demo Scripts - Tables - Use for reference -->
        <script>
            $(document).ready(function() {
                $('#dataTables-example').DataTable({
                        responsive: true
                });
            });
            
            var urlGetImageProduct = $("#url-root").val() + "/admin/product/images?start=0";
            
            $.get(urlGetImageProduct,function(data) {
            	var html = "";
    			for(var i = 0; i < data.length; i++) {
    				var obj = data[i];
    				html += "<div class='col-md-2 col-xs-4'>\n";
    				html += "<label>\n";
    				html += "<input type='radio' name='url-image' value='"+ obj.url +"'> \n";
    				html += "<img width='100%' height='125px' src='" + $("#url-root").val() + "/resources" + obj.url + "'> \n";
    				html += "</label> \n";
    				html += "</div> \n";
    			}
    			$("#modal-images .modal-body .row").html(html);
    			var pagnText = "";
    			pagnText += "<li class='page-item disabled'><a class='page-link' ><i class='fa fa-angle-double-left'></i></a></li>\n";
    			pagnText += "<li class='page-item active'><a class='page-link' >" + 1 + "</a></li>\n";
    			var totalItem = data[0].totalImage;
				var totalPage = data[0].totalPage;
    			for(var i = 1; i < totalPage; i++) {
    				var start = i * 18;
    				pagnText += "<li class='page-item'><a class='page-link' onclick='selectPagination(" + start + ", " + totalItem + ", " + totalPage + ")'>" + (i + 1) + "</a></li>\n";
    			}
    			pagnText += "<li class='page-item'><a class='page-link' onclick='selectPagination(" + 18 + ", " + totalItem + ", " + totalPage + ")'><i class='fa fa-angle-double-right'></i></a></li>\n";
    			
    			$("#modal-images .pagination").html(pagnText);
    		});
            
    		
			function selectPagination(start, totalItem, totalPage) {
				var pagnText = "";
				
				if(start != 0) {
					pagnText += "<li class='page-item'><a class='page-link' onclick='selectPagination(" + (start - 18) + ", " + totalItem + ", " + totalPage + ")'><i class='fa fa-angle-double-left'></i></a></li>\n";
				} else {
					pagnText += "<li class='page-item disabled'><a class='page-link'> <i class='fa fa-angle-double-left'></i> </a></li>\n";
				}
				
				for(var i = 0; i < totalPage; i++) {
					if(start == (18 * i)) {
						pagnText += "<li class='page-item active'><a class='page-link'>"+(i+1)+"</a></li>\n";
					} else {
						pagnText += "<li class='page-item'><a class='page-link' onclick='selectPagination(" + (i * 18) + ", " + totalItem + ", " + totalPage + ")'>"+(i+1)+"</a></li>\n";
					}
				}
				if(start + 18 < totalItem) {
					pagnText += "<li class='page-item'><a class='page-link' onclick='selectPagination(" + (start + 18) + ", " + totalItem + ", " + totalPage + ")'><i class='fa fa-angle-double-right'></i></a></li>\n";
				} else {
					pagnText += "<li class='page-item disabled'><a class='page-link'> <i class='fa fa-angle-double-right'></i> </a></li>\n";
				}
				$("#modal-images .pagination").html(pagnText);
				var url = $("#url-root").val() + "/admin/product/images?start=" + start;
				$.get(url,function(data) {
	            	var html = "";
	    			for(var i = 0; i < data.length; i++) {
	    				var obj = data[i];
	    				html += "<div class='col-md-2 col-xs-4'>\n";
	    				html += "<label>\n";
	    				html += "<input type='radio' name='url-image' value='"+ obj.url +"'> \n";
	    				html += "<img width='100%' height='125px' src='" + $("#url-root").val() + "/resources" + obj.url + "'> \n";
	    				html += "</label> \n";
	    				html += "</div> \n";
	    			}
	    			$("#modal-images .modal-body .row").html(html);
	    			
	    		});
    		}
    		
    			
            function openImages(idInput) {  	
            	$("#btn-select-image").attr("onclick", "selectImage('"+idInput+"')");
            	$("#modal-images").modal("show");
            }
            
            function selectImage(idInput) {
            	
            	var srcUrl = $("input:radio[name=url-image]:checked").val();
            	$("#" + idInput).val(srcUrl);
            	srcUrl = $("#url-root").val() + "/resources" + $("input:radio[name=url-image]:checked").val();
            	$("#src-" + idInput).attr("src", srcUrl);
            	$("#modal-images").modal("hide")
            	
            }
            
            
        </script>
    </body>
</html>