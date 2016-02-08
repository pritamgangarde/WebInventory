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

<spring:url value="/addvat" var="addVaturl" />
<spring:url value="/addvat" var="vatDeleteurl" />
</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<form:form class="mws-form" Commandname="addVat" name="addVatForm"
					id="myForm" modelAttribute="addVat" method="post">
					<div class="row">
						<div class="col-lg-12">
							<h1 class="page-header">
								<spring:message code="label.page.addVat" />
							</h1>
							<div>
								<jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
							</div>

							<div class="col-xs-3">
								<label><spring:message code="label.page.addVat" />(%)</label><input
									type="text" id="vatPercent" name="vatPercent"
									class="form-control"
									placeholder="<spring:message code="label.page.addVat" /> %">
							</div>

						</div>
						<!-- /.col-lg-12 -->
					</div>
					<br>
					<br>

					<div class="container">
						<button type="submit" id="save" name="save"
							class="btn btn-primary">
							<spring:message code="label.page.saveButton" />
						</button>
						<button type="reset" class="btn btn-info">
							<spring:message code="label.page.clear" />
						</button>
						<!--  	<button type="button" id="save" name="save"
							class="btn btn-primary">Save</button> -->


					</div>
					<input type="text" id="vatId" name="vatId" class="form-control"
						style="visibility: hidden">

					<!-- /.row -->
					<br>
					<br>
				</form:form>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<spring:message code="label.page.addVat" />
							</div>
							<div class="col-xs-12">
								<table id="dataTable" class="display">
									<thead>
										<tr>
											<th><spring:message code="label.page.srno" /></th>
											<th><spring:message code="label.page.addVat" /> (%)</th>
											<th><spring:message code="label.page.action" /></th>

										</tr>
									</thead>
									<tbody>

										<tr class="gradeA odd" role="row">
											<td class="sorting_1"></td>
											<td></td>

											<td class="center"><a href="#" onclick=""><img
													src=""> </a></td>

										</tr>
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
	$('#dataTable').dataTable({
		"bJQueryUI" : true,
		"sPaginationType" : "full_numbers",
		"sDom" : 'T<"clear">lfrtip<"clear spacer">T'

	});
</script>
<script>
	$("#update").prop('disabled', false);
	function getVatDetails(vatId, vatPercent) {

		$("#vatId").val(vatId);
		$("#vatPercent").val(vatPercent);
		$("#save").prop('disabled', true);
		$("#update").prop('disabled', false);
	}
</script>

</html>
