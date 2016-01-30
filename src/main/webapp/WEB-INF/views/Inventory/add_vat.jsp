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
         
         <spring:url value="/addvat"  var ="addVaturl"/>
         <spring:url value="/addvat"  var ="vatDeleteurl"/></head>
  
   <body>
        
    <div id="wrapper">

        <!-- Navigation -->
       
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
              <form:form class="mws-form" Commandname="addVat" name="addVatForm" id="myForm"
						modelAttribute="addVat" action="${addVaturl}" method="post">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Add Vat</h1>
                           <div>
						      <jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						   </div>
					   
						<div class="col-xs-3">
								<label>Vat(%)</label><input type="text" id="vatPercent" name="vatPercent" class="form-control" placeholder="Category Name">
					    </div>
						
			          </div>
                     <!-- /.col-lg-12 -->
                      </div><br><br>

				     <div class="container">
				  	    <button type="sumbit" id ="save"  name="save" class="btn btn-primary">Save</button>
					   	<c:set var="showEdit" value="false" />
							<c:if
									test="${fn:contains(sessionScope.permissionList, 'Update Vat' ) || sessionScope.userName=='admin'}">
									<c:set var="showEdit" value="true" />
						<button type="submit" class="btn btn-info">Update</button>
						</c:if>
				     </div>
				   	<input type="text"  id="vatId" name ="vatId" class="form-control"  style="visibility: hidden" >
					
                <!-- /.row --><br>
               <br>
                 </form:form>
				<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Vat
                        </div>
                          <div class="col-xs-12">
					<table id="dataTable" class="display">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Vat Percent</th>
								<c:if test="${showEdit}">
							<th>Edit</th>
							</c:if>
							<c:set var="showDelete" value="false" />
								<c:if
									test="${fn:contains(sessionScope.permissionList, 'Delete Vendor' ) || sessionScope.userName=='admin'}">
									<c:set var="showDelete" value="true" />
							<th>Delete</th>
							</c:if>
						</tr>
					</thead>
					         <tbody>
										<%
									     int cnt = 1;
								         %>
										<c:forEach var="addVatlist" items="${addVatlist}">
										
										    <tr class="gradeA odd" role="row">
												<td class="sorting_1"><%=cnt++%></td>
												<td>${addVatlist. vatPercent}</td>
												<c:if test="${showEdit}">
												<td class="center"><a href="#"
								                 onclick="getVatDetails('${addVatlist.vatId}','${addVatlist.vatPercent}')"><img src="<%=request.getContextPath()%>/resources/images/edit-notes.png">
								                 </a></td>
								                 </c:if>
								                 <c:if test="${showDelete}">
												<td class="center"> <a href="${vatDeleteurl}/${addVatlist.vatId}?DeleteVat"><img src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></a></td>
											</c:if>
											</tr>
										</c:forEach>
										</tbody>
				</table>
					</div>
                       
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

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
	function getVatDetails(vatId, vatPercent) {
		
		$("#vatId").val(vatId);
		$("#vatPercent").val(vatPercent);
		$("#save").prop('disabled',true);
		$("#update").prop('disabled',false);	
	}
	</script>

</html>
