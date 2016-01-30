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
         
           <spring:url value="/addVendor"  var ="addVendorurl"/>
           <spring:url value="/addVendor" var ="vendorUpdateurl"/>
           <spring:url value="/addVendor" var ="vendorDeleteurl"/>
          </head>
<body>
<div id="wrapper">

        <!-- Navigation -->
     

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
            <form:form class="mws-form" Commandname="addVendor" name="addVendorForm" id="myForm"
						modelAttribute="addVendor" action="${addVendorurl}" method="post">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">vendor</h1>
                    </div>
                        <div>
						      <jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						   </div>
                    <!-- /.col-lg-12 -->
					<div class="col-xs-3">
								<label>Vendor Name</label><input type="text" id="vendorName" name="vendorName" class="form-control" value="${vendorlist123.vendorName}" placeholder="Vendor Name">
				    </div>
					<div class="col-xs-3">
								<label>Tin No</label><input type="text" id="tinno" name="tinno" class="form-control"  value="${vendorlist123.tinno}"  placeholder="Tin No.">
				    </div>
					<div class="col-xs-3">
								<label>Address Line1</label><input type="text" id="addressLine1" name="addressLine1" value="${vendorlist123.addressLine1}"   class="form-control">
				    </div>
					<div class="col-xs-3">
								<label>Address Line2</label><input type="text"id="addressLine2" name="addressLine2"  value="${vendorlist123.addressLine2}"  class="form-control">
				    </div>
					<div class="col-xs-3">
						<label>State</label>
						<select id="state" name="state"  value="${vendorlist123.state}"class="form-control"
									onchange="getCityFromState(this.value);">
										<option value="0">---Select State---</option>
										<c:forEach items="${stateList}" var="state"
											varStatus="theCount">
											<option value="${state}">
												${state}</option>
										</c:forEach>
								</select>
							
                      </div>
				<div class="col-xs-3" >
						<label>City</label>
							<select id="city" name="city"  value="${vendorlist123.city}" class="form-control">
							<option value="0">---Select City---</option>
									<%-- <c:forEach items="${stateCityList}" var="stateCityList"
										varStatus="theCount">
										<option value="${cityList.cityName}">${cityList.cityName}</option>
									</c:forEach> --%>
							</select>
                </div>
					
					<div class="col-xs-3">
								<label>Pin No.</label><input type="text" id="pinno" name="pinno" class="form-control" value="${vendorlist123.pinno}"  placeholder="Pin No.">
				    </div>
					<div class="col-xs-3">
								<label>Phone No.</label><input type="text" id="phoneno" name="phoneno" class="form-control"  value="${vendorlist123.phoneno}" placeholder="Phone No.">
				    </div>
					<div class="col-xs-3">
								<label>Email </label><input type="text" id="email" name="email" class="form-control" value="${vendorlist123.email}" placeholder="Email">
				    </div>

					<div class="col-xs-3">
						<label>IsActive</label>
							<select class="form-control" id="active" name="active"  value="${vendorlist123.active}" >
								 <option>Select Status</option>
								 <option>Active</option>
								 <option>Inactive</option>
							  </select>
                </div>
				</div>
                <!-- /.row -->
				<br><br>
                     <input type="text" id="id" name ="id" class="form-control" value="${addvendorlist123. id}" style="visibility: hidden"  >
					<div class="container">
						<button type="sumbit" class="btn btn-primary">Save</button>
						<c:set var="showEdit" value="false" />
							<c:if
									test="${fn:contains(sessionScope.permissionList, 'Update Vendor' ) || sessionScope.userName=='admin'}">
									<c:set var="showEdit" value="true" />
						<button type="submit" class="btn btn-info">Update</button>
						</c:if>
					</div>
      </form:form>
				<br><br>
				<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Vendor
                        </div>
                        <!-- /.panel-heading -->
                        <div class="col-xs-12">
					<table id="dataTable" class="display">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Vendor Name</th>
							<th>Active</th>
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
										<c:forEach var="addvendorlist" items="${addvendorlist}">
										<tr class="gradeA odd" role="row">
												<td class="sorting_1"><%=cnt++ %></td>
												<td>${addvendorlist.vendorName }</td>
												<td >${addvendorlist.active }</td>
												<c:if test="${showEdit}">
												<td class="center"><a href="${addVendorurl}/${addvendorlist.id}?Updatevendor"><img src="<%=request.getContextPath()%>/resources/images/edit-notes.png"></a></td>
												</c:if>
												<c:if test="${showDelete}">
												<td class="center"> <a href="${addVendorurl}/${addvendorlist.id}?Deletevendor"><img src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></a></td>
												</c:if>
											</tr>
											</c:forEach>
											</tbody>
				</table>
				<!-- /.panel-body -->
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

</html>
<script type="text/javascript">
	
	$('#dataTable').dataTable( {
	    "bJQueryUI": true,
	    "sPaginationType": "full_numbers",
	    "sDom": 'T<"clear">lfrtip<"clear spacer">T'
	   
	   } );
	
</script>
