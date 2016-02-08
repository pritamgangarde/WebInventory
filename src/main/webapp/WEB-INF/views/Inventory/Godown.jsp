
<html>
<head><%@ page language="java"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
</head>
<body>
	<spring:url value="/addGodown" var="addGodwnurl" />
	<spring:url value="/addGodown" var="godownDeleteurl" />
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
					<form:form class="mws-form" Commandname="addGodowan"
						name="addGodownForm" id="myForm" modelAttribute="addGodowan"
						action="${addGodwnurl}" method="post">


						<div class="row">
							<div>
								<jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
							</div>
							<div class="col-xs-3">
								<label><spring:message code="label.page.godownName" /></label><input
									type="text" id="godownName" name="godownName"
									class="form-control"
									placeholder="<spring:message code="label.page.godownName" />">
								<input type="hidden" id="godownId" name="godownId">
							</div>

							<div class="col-xs-3">
								<label><spring:message code="label.page.description" /></label><input
									type="text" id="description" name="description"
									class="form-control"
									placeholder="<spring:message code="label.page.description" />">
							</div>

							<div class="col-xs-3">
								<label><spring:message code="label.page.address" /></label><input
									type="text" id="addressLine1" name="addressLine1"
									class="form-control"
									placeholder="<spring:message code="label.page.address" />">

							</div>

							<div class="col-xs-3">
								<label><spring:message code="label.page.state" /></label> <select
									id="state" name="state" class="form-control"
									style="height: 28px !important;"
									onchange="getCityFromState(this.value);">
									<option value="0">---
										<spring:message code="label.page.selectState" />---
									</option>
									<!--  	<c:forEach items="${stateList}" var="state"
											varStatus="theCount">
											<option value="${state}">
												${state}</option>
										</c:forEach>
										-->
								</select>

							</div>
							<div class="col-xs-3">
								<label><spring:message code="label.page.city" /></label> <select
									id="city" name="city" style="height: 30px !important;"
									class="form-control">
									<option value="0">---
										<spring:message code="label.page.selectCity" />---
									</option>
									<!--  			<c:forEach items="${stateCityList}" var="stateCityList"
										varStatus="theCount">
										<option value="${stateCityList.cityName}">${stateCityList.cityName}</option>
									</c:forEach> -->
								</select>
							</div>

							<div class="col-xs-3">
								<label><spring:message code="label.page.pincode" /></label><input
									type="text" id="pincodeNo" name="pincodeNo"
									class="form-control"
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
									type="text" id="Incharge" name="Incharge" class="form-control"
									placeholder="<spring:message code="label.page.incharge" />">
								<input type="hidden" name="inchargeId" id="inchargeId">
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
						<input type="text" id="addgodowanid" name="addgodowanid"
							class="form-control" style="visibility: hidden">
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
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
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
	function getGodownDetails(godownId, godownname, address1, sate, city,
			pinno, phoneno, incharge) {

		$("#addgodowanid").val(godownId);
		$("#addgodowanName").val(godownname);
		$("#addressLine1").val(address1);
		$("#state").val(sate);
		$("#city").val(city);
		$("#pinno").val(pinno);
		$("#phoneno").val(phoneno);
		$("#Incharge").val(incharge);
		$("#save").prop('disabled', true);
		$("#update12").prop('disabled', false);
	}
</script>
