<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <head>
          <jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
         
          <spring:url value="/addcategory"  var ="addCategoryurl"/>
          <spring:url value="/addcategory" var ="categoryDeleteurl"/></head>
 <body>
        

    <div id="wrapper">
       <!-- Navigation -->
       
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
            <form:form class="mws-form" Commandname="addCategory" name="addCategoryForm" id="myForm"
						modelAttribute="addCategory" action="${addCategoryurl}" method="post">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Add Category</h1>
                    </div>
                       <div>
						<jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						</div>
                    <!-- /.col-lg-12 -->
					 <div class="col-xs-3">
								<label>Category Name</label><input type="text" id="categoryName" name="categoryName" class="form-control" placeholder="Category Name">
					  </div>
					  <div class="col-xs-3">
								<label>Description</label><input type="text" id="categoryDescription" name="categoryDescription" class="form-control" placeholder="Category Name">
					  </div>
				</div><br><br>
	
					<div class="container">
					<button type="submit" id="save" name="save" class="btn btn-primary">Save</button>
					<c:set var="showEdit" value="false" />
							<c:if
									test="${fn:contains(sessionScope.permissionList, 'Update Product' ) || sessionScope.userName=='admin'}">
									<c:set var="showEdit" value="true" />
						<button type="submit" class="btn btn-info">Update</button>
						</c:if>
					</div>
					<input type="text" id="categoryId" name ="categoryId" class="form-control" value="0" style="visibility: hidden"  >
                   </form:form>
                </div>
                <!-- /.row --><br><br>

				<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            All Categories
                        </div>
                        <!-- /.panel-heading -->
                        <div class="col-xs-12">
					<table id="dataTable" class="display">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Categories Name</th>
							<c:if test="${showEdit}">
							<th>Edit</th>
							</c:if>
							<c:set var="showDelete" value="false" />
								<c:if
									test="${fn:contains(sessionScope.permissionList, 'Delete Category' ) || sessionScope.userName=='admin'}">
									<c:set var="showDelete" value="true" />
							<th>Delete</th>
							</c:if>
						</tr>
					</thead>
					        <tbody>
										<%
									     int cnt = 1;
								         %>
										<c:forEach var="addCategorylist" items="${addCategorylist}">
										
										<tr class="gradeA even" role="row">
												<td class="sorting_1"><%=cnt++%></td>
												<td>${addCategorylist.categoryName}</td>
												<c:if test="${not showEdit}">
												<td class="center"><a href="#"
								                 onclick="getCategoryDetails('${addCategorylist.categoryId}','${addCategorylist.categoryName}','${addCategorylist.categoryDescription}')"><img src="<%=request.getContextPath()%>/resources/images/edit-notes.png">
								                 </a></td>
								                 </c:if>
												<c:if test="${showDelete}">
												<td class="center"> <a href="${categoryDeleteurl}/${addCategorylist.categoryId}?Deletecategorye"><img src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></a></td>
												</c:if>
											</tr>
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

   
</body>
<script type="text/javascript">
	
	$('#dataTable').dataTable( {
	    "bJQueryUI": true,
	    "sPaginationType": "full_numbers",
	    "sDom": 'T<"clear">lfrtip<"clear spacer">T'
	   
	   } );
	
</script>
<script>
   $("#update").prop('disabled',false);
	function getCategoryDetails(catgoryeId, catgoryeName, catgoryeDecst) {
		
		$("#categoryId").val(catgoryeId);
		$("#categoryName").val(catgoryeName);
		$("#categoryDescription").val(catgoryeDecst);
		
		$("#save").prop('disabled',true);
		$("#update").prop('disabled',false);	
	}
	</script>

</html>
