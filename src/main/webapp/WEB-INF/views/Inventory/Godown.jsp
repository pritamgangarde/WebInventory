<html>
<head><%@ page language="java"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<spring:url value="/addGodown" var="viewGodownUrl" />
<spring:url value="/addGodown" var="deleteGodownUrl" />
</head>
<body>
	<spring:url value="/addGodown" var="addGodwnUrl" />
	<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
	<div id="wrapper">

		<!-- Navigation -->

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<!--style="background:#23527C;color:#FFFFFF;"-->
						<h1 class="page-header">
							<spring:message code="label.menu.addGodown" />
						</h1>
					</div>


					<br> <br>
					<form:form class="mws-form" Commandname="addGodown"
						name="addGodownForm" id="myForm" modelAttribute="addGodown"
						action="${addGodwnUrl}" method="post">


						<div class="row">
							<div>
								<jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
							</div>
							<div class="col-xs-3">
								<label><spring:message code="label.page.godownName" /></label><input
									type="text" id="name" name="name" class="form-control"
									placeholder="<spring:message code="label.page.godownName" />">
								<input type="hidden" id="id" name="id">
							</div>

							<div class="col-xs-3">
								<label><spring:message code="label.page.description" /></label><input
									type="text" id="description" name="description"
									class="form-control"
									placeholder="<spring:message code="label.page.description" />">
							</div>

							<div class="col-xs-3">
								<label><spring:message code="label.page.address" /></label><input
									type="text" id="location" name="location" class="form-control"
									placeholder="<spring:message code="label.page.address" />">

							</div>

							<div class="col-xs-3">
								<label><spring:message code="label.page.state" /></label> <select
									id="state" name="state" class="form-control"
									style="height: 28px !important;"
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
								<label><spring:message code="label.page.city" /></label> <select
									id="city" name="city" style="height: 30px !important;"
									class="form-control">
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
								<label><spring:message code="label.page.landlineNo" /></label><input
									type="text" id="landLineNo" name="landLineNo"
									class="form-control"
									placeholder="<spring:message code="label.page.landlineNo" />">
							</div>

							<div class="col-xs-3">
								<label><spring:message code="label.page.mobileNo" /></label><input
									type="text" id="mobileNo" name="mobileNo" class="form-control"
									placeholder="<spring:message code="label.page.mobileNo" />">
							</div>

							<div class="col-xs-3">
								<label><spring:message code="label.page.incharge" /></label><input
									type="text" id="inchargeName" name="inchargeName"
									class="form-control"
									placeholder="<spring:message code="label.page.incharge" />">
								<input type="hidden" name="incharge" id="incharge">
							</div>

						</div>

						<br>
						<br>

						<div class="container">

							<button type="submit" id="save" name="save"
								class="btn btn-primary">
								<spring:message code="label.page.saveButton" />
							</button>
							<button type="submit" class="btn btn-info">
								<spring:message code="label.page.updateButton" />
							</button>

							<button type="reset" class="btn btn-info">
								<spring:message code="label.page.clear" />
							</button>


						</div>

					</form:form>
					<!-- /.row -->
				</div>

				<!-- /.container-fluid -->
				<br> <br>

				<div class="row">

					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<spring:message code="label.page.allGodown" />
								</div>
								<!-- /.panel-heading -->
								<div class="col-xs-12">
									<table id="dataTable" class="display">


										<thead>
											<tr>
												<th><spring:message code="label.page.srno" /></th>
												<th><spring:message code="label.page.godownName" /></th>
												<th><spring:message code="label.page.description" /></th>
												<th><spring:message code="label.page.action" /></th>

											</tr>
										</thead>


										<tbody>
											<c:forEach items="${godwonList}" var="godown"
												varStatus="theCount">
												<tr>
													<td>${theCount.count}</td>
													<td>${godown.name}</td>
													<td>${godown.description}</td>
													<td class="center">
														<a	href="#" onclick="getGodownDetails('${godown.id}','${godown.description}','${godown.name}','${godown.location}','${godown.state}', '${godown.city}' ,'${godown.pincode}', '${godown.landLineNo}', '${godown.mobileNo}','${godown.incharge}')">
															<img src="<%=request.getContextPath()%>/resources/images/edit-notes.png"></img>
														</a>
														<a href="${deleteGodownUrl}/${godown.id}?DeleteGodown">
															<img src="<%=request.getContextPath()%>/resources/images/DeleteRed.png"></img>
														</a>
													</td>
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
	$('#dataTable').dataTable({
		"bJQueryUI" : true,
		"sPaginationType" : "full_numbers",
		"sDom" : 'T<"clear">lfrtip<"clear spacer">T'

	});
</script>
<script>
	$("#update12").prop('disabled', false);
	function getGodownDetails(godownId,description, godownname, address1, sate, city,
			pinno, landlineNo,phoneno, incharge) {

		$("#id").val(godownId);
		$("#description").val(description);
		$("#name").val(godownname);
		$("#location").val(address1);
		$("#state").val(sate);
		$("#city").val(city);
		$("#pincode").val(pinno);
		$("#landLineNo").val(landlineNo);
		$("#mobileNo").val(phoneno);
		$("#inchargeName").val(incharge);
		$("#save").prop('disabled', true);
		$("#update12").prop('disabled', false);
	}
</script>
