
<html>
<head><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
</head>
  <body>
    <spring:url value="/addGodown"  var ="addGodwnurl"/>
     <spring:url value="/addGodown"  var ="godownDeleteurl"/>
   <jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
    <div id="wrapper">

        <!-- Navigation -->
     
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12" ><!--style="background:#23527C;color:#FFFFFF;"-->
                        <h1 class="page-header">Add Godown</h1>
                    </div>
                   
					<br><br>
					<form:form class="mws-form" Commandname="addGodowan" name="addGodownForm" id="myForm"
						modelAttribute="addGodowan" action="${addGodwnurl}" method="post">
					

							<div class="row">
							<div>
						      <jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						   </div>
							  <div class="col-xs-3">
								<label>Godown</label><input type="text"  id="addgodowanName" name ="addgodowanName" class="form-control" placeholder="Godown">
								
							  </div>
							  
							<div class="col-xs-3">
										<label>Address Line1</label><input type="text"  id="addressLine1" name="addressLine1" class="form-control" placeholder="Address Line1">
										<!--<textarea rows="1" class="form-control"></textarea>-->
							</div>
							<div class="col-xs-3">
										<label>Address Line2</label><input type="text" id="addressLine1" name="addressLine1" class="form-control" placeholder="Address Line2">
										<!--<textarea rows="1" class="form-control"></textarea>-->
							</div>
							<div class="col-xs-3">
						<label>State</label>
						<select id="state" name="state" class="form-control"
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
							<select id="city" name="city" class="form-control">
							<option value="0">---Select City---</option>
									 <c:forEach items="${stateCityList}" var="stateCityList"
										varStatus="theCount">
										<option value="${stateCityList.cityName}">${stateCityList.cityName}</option>
									</c:forEach> 
							</select>
                </div>
					
					<div class="col-xs-3" >
								<label>Pin No.</label><input type="text" id="pinno" name="pinno"  class="form-control" placeholder="Pin No.">
				    </div>
					<div class="col-xs-3">
								<label>Phone No.</label><input type="text" id="phoneno" name="phoneno"  class="form-control" placeholder="Phone No.">
				    </div>
					<div class="col-xs-3">
								<label>Incharge</label><input type="text"  id="Incharge" name="Incharge"  class="form-control" placeholder="Incharge">
				    </div>
					
					</div>
					
							<br><br>

							<div class="container">
							
							<button type="submit" id ="save"  name="save" class="btn btn-primary">Save</button>
								<c:set var="showEdit" value="false" />
							<c:if
									test="${fn:contains(sessionScope.permissionList, 'Update Godown' ) || sessionScope.userName=='admin'}">
									<c:set var="showEdit" value="true" />
						<button type="submit" class="btn btn-info">Update</button>
						</c:if>
							</div>
							<input type="text"  id="addgodowanid" name ="addgodowanid" class="form-control"  style="visibility: hidden" >
					  </form:form>
                <!-- /.row -->
            </div>
          
            <!-- /.container-fluid -->
			<br><br>
			
			<div class="row">
                
							<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            All Godowns
                        </div>
                      <!-- /.panel-heading -->
                        <div class="col-xs-12">
					<table id="dataTable" class="display">
				
					
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Godown Name</th>
							<c:if test="${showEdit}">
							<th>Edit</th>
							</c:if>
							<c:set var="showDelete" value="false" />
								<c:if
									test="${fn:contains(sessionScope.permissionList, 'Delete Godown' ) || sessionScope.userName=='admin'}">
									<c:set var="showDelete" value="true" />
							<th>Delete</th>
							</c:if>
						</tr>
					</thead>
					
					
					          <tbody>
										<%
									     int cnt = 1;
								         %>
										<c:forEach var="addgodowanlist" items="${addgodowanlist}">
										
										<tr class="gradeA odd" role="row">
												<td class="sorting_1"><%=cnt++%></td>
												<td>${addgodowanlist.addgodowanName}</td>
											<c:if test="${showEdit}">
												<td class="center"><a href="#"
								                 onclick="getGodownDetails('${addgodowanlist.addgodowanId}','${addgodowanlist.addgodowanName}','${addgodowanlist.addressLine1}','${addgodowanlist.state}','${addgodowanlist.city}','${addgodowanlist.pinno}','${addgodowanlist.phoneno}','${addgodowanlist.incharge}')"><img src="<%=request.getContextPath()%>/resources/images/edit-notes.png">
								                 </a></td>
								              </c:if>
								              <c:if test="${showDelete}">
								                 <security:authorize access="hasRole('ROLE_ADMIN')">
													<td class="center"> <a href="${godownDeleteurl}/${addgodowanlist.addgodowanId}?Deletegodown"><img src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></a></td>
												</security:authorize>
												</c:if>
										</tr>
											
											</c:forEach></tbody>
				</table>
					</div>
                        
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
							<!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
			
        </div>
        <!-- /#page-wrapper -->
</body>

</html>
<script type="text/javascript">
	
	$('#dataTable').dataTable( {
	    "bJQueryUI": true,
	    "sPaginationType": "full_numbers",
	    "sDom": 'T<"clear">lfrtip<"clear spacer">T'
	   
	   } );
	
</script>
  <script>
   $("#update12").prop('disabled',false);
	function getGodownDetails(godownId, godownname, address1, sate, city,pinno,phoneno,incharge) {
		
		$("#addgodowanid").val(godownId);
		$("#addgodowanName").val(godownname);
		$("#addressLine1").val(address1);
		$("#state").val(sate);
		$("#city").val(city);
		$("#pinno").val(pinno);
		$("#phoneno").val(phoneno);
		$("#Incharge").val(incharge);
		$("#save").prop('disabled',true);
		$("#update12").prop('disabled',false);	
	}	
	</script>
