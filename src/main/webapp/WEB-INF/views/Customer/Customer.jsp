<html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>

<spring:url value="/addCustomer" var="saveCustomerUrl" />
<spring:url value="/updateCustomerDefaulter"
	var="updateCustomerDefaulterUrl" />
<spring:url value="/deleteCustomer" var="deleteCustomerUrl" />
<script type="text/javascript">
	function onloadDisableUpdateBtn() {
		$("#save").prop('disabled', false);
		$("#update12").prop('disabled', true);
	}
</script>
</head>
<body onload="onloadDisableUpdateBtn()">
	<div id="wrapper">

		<!-- Navigation -->


		<!-- Page Content -->
				
		<div id="page-wrapper">
			<div class="container-fluid">
				<form:form class="mws-form" Commandname="addCustomer"
					name="addCustomerForm" id="myForm" modelAttribute="addCustomer"
					action="${saveCustomerUrl}" method="post">
					<div class="row">
						<div class="col-lg-12">
							<h1 class="page-header">
								<spring:message code="label.menu.customer" />
							</h1>
						</div>
						<div>
							<jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						</div>
						<!-- /.col-lg-12 -->
						<div class="col-xs-3">
							<label><spring:message code="label.page.customerName" /></label><input
								type="text" id="customerName" required="required"
								name="customerName" class="form-control"
								placeholder="<spring:message code="label.page.customerName"/>">
							<input type="hidden" id="id" name="id">
						</div>
						<div class="col-xs-3">
							<label><spring:message code="label.page.address" /></label><input
								type="text" id="address" name="address" class="form-control"
								placeholder="<spring:message code="label.page.address" />">
						</div>


						<div class="col-xs-3">
							<label>State</label> <select id="state" name="state"
								class="form-control" style="height: 28px !important;"
								onchange="getCityNameByState(this.value);">
								<option value="0">---
									<spring:message code="label.page.selectState" />---
								</option>
								<c:forEach items="${sessionScope.stateList}" var="state"
									varStatus="theCount">
									<option value="${state}">${state}</option>
								</c:forEach>

							</select>

						</div>
						<div class="col-xs-3">
							<label>City</label> <select id="city" name="city"
								style="height: 30px !important;" class="form-control">
								<option value="0">---
									<spring:message code="label.page.selectCity" />---
								</option>

							</select>
						</div>

						<div class="col-xs-3">
							<label><spring:message code="label.page.pincode" /></label><input
								type="text" id="pincode" name="pincode" class="form-control"
								placeholder="<spring:message code="label.page.pincode" />">
						</div>
						<div class="col-xs-3">
							<label><spring:message code="label.page.mobileNo" /></label><input
								type="text" id="mobileNo" name="mobileNo" class="form-control"
								placeholder="<spring:message code="label.page.mobileNo" />">
						</div>
						<div class="col-xs-3">
							<label><spring:message code="label.page.landlineNo" /></label><input
								type="text" id="landlineNo" name="landlineNo"
								class="form-control"
								placeholder="<spring:message code="label.page.landlineNo" />">
						</div>
						<div class="col-xs-3">
							<label><spring:message code="label.page.email" /></label><input
								type="text" id="emailId" name="emailId" class="form-control"
								placeholder="<spring:message code="label.page.email" />">
						</div>



					</div>
					<!-- /.row -->
					<br>
					<br>

					<div class="container">
						<button type="submit" name="save" value="save" id="save"
							class="btn btn-primary">
							<spring:message code="label.page.saveButton" />
						</button>
						<c:set var="showEdit" value="false" />
						<c:if
							test="${fn:contains(sessionScope.permissionList, 'Update Vendor' ) || sessionScope.userName=='admin'}">
							<c:set var="showEdit" value="true" />
							<button type="submit" name="update12" value="update"
								id="update12" class="btn btn-info">
								<spring:message code="label.page.updateButton" />
							</button>
						</c:if>
						<button type="reset" onclick="onloadDisableUpdateBtn();"
							class="btn btn-info">
							<spring:message code="label.page.clear" />
						</button>

					</div>
				</form:form>
				<br> <br>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<spring:message code="label.menu.customer" />
							</div>
							<!-- /.panel-heading -->
							<div class="col-xs-12">
								<table id="dataTable" class="display">
									<thead>
										<tr>
											<th><spring:message code="label.page.srno" /></th>
											<th><spring:message code="label.page.customerName" /></th>
											<th><spring:message code="label.page.mobileNo" /></th>
											<th><spring:message code="label.page.status" /></th>
											<th><spring:message code="label.page.action" /></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach varStatus="theCount" items="${customerList}"
											var="customer">
											<tr>
												<td>${theCount.count}</td>
												<td>${customer.customerName}</td>
												<td>${customer.mobileNo}</td>
												<td>${customer.defaulter==true?'Defaulter':'Normal'}</td>
												<td class="center"><a href="#"
													onclick="viewCustomerDetails('${customer.id}','${customer.customerName}','${customer.address}','${customer.state}','${customer.city}', '${customer.pincode}', '${customer.mobileNo}', '${customer.landlineNo}' ,'${customer.emailId}')">
														<img
														src="<%=request.getContextPath()%>/resources/images/edit-notes.png"></img>
												</a> <a href="${deleteCustomerUrl}/${customer.id}"> <img
														src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></img>
												</a> <a
													href="${updateCustomerUrl}/${customer.id}/${customer.defaulter}">
														${customer.defaulter==true?'Remove Defaulter':'Make Defaulter'}
												</a></td>

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
	$('#dataTable').dataTable({
		"bJQueryUI" : true,
		"sPaginationType" : "full_numbers",
		"sDom" : 'T<"clear">lfrtip<"clear spacer">T'

	});
</script>
<script>
	$("#update12").prop('disabled', false);
	function viewCustomerDetails(customerId, customerName, address, state, city,
			pincode, mobileNo, landlineNo, emailId) {
		$("#id").val(customerId);
		$("#customerName").val(customerName);
		$("#address").val(address);
		$("#state").val(state);
		$("#city").val(city);
		$("#pincode").val(pincode);
		$("#mobileNo").val(mobileNo);
		$("#landlineNo").val(landlineNo);
		$("#emailId").val(emailId);
		$("#save").prop('disabled', true);
		$("#update12").prop('disabled', false);
	}
</script>