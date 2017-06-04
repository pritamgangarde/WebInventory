<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
     <spring:url value="/addProduct"  var ="ProductDeleteurl"/>
     <spring:url value="/addProduct"  var ="addProductUrl"/>
<div id="wrapper">
	
	<!-- Navigation -->

	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Add Product</h1>
				</div>
				<!-- /.col-lg-12 -->
				<form:form class="mws-form" Commandname="addProduct"
						name="addProductForm" id="myForm" modelAttribute="addProduct"
						action="${addProductUrl}" method="post">
						<div class="row">
							
							 <div>
						   <jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						   </div>
					 <div class="col-xs-3">
							<label><spring:message code="label.page.godownName" /></label>
							  <select name="godowanObj" id=godowanObj class="form-control" style="width:90%;">
														    <option>---Select Godown---- </option>
													<c:forEach var="godowan" items="${godownList}">
													      <option value="${godowan.id}">${godowan.name} </option>
													</c:forEach>
							 </select>
						</div>
					 </div>
					<div class="row">
						<div class="col-xs-3">
							<label><spring:message code="label.page.productCode" /></label>
							<input type="text" id="productCode" name="productCode" class="form-control"
									placeholder="<spring:message code="label.page.productCode" />">
							
						</div>
						<div class="col-xs-3">
							<label><spring:message code="label.page.productName"/></label>
							<input type="text" id="productName" name="productName" class="form-control"
									placeholder="<spring:message code="label.page.productName"/>">
						</div>
						<div class="col-xs-3">
							<label><spring:message code="label.page.productDescription"/></label>
							<input type="text" id="productDescription" name="productDescription" class="form-control"
									placeholder="<spring:message code="label.page.productDescription"/>">
							<!--<textarea class="form-control" rows="1"></textarea>-->
						</div>
						<div class="col-xs-3">
							<label><spring:message code="label.page.categoryName"/></label>
							  <select name="categoryObj" id="categoryId" class="form-control" style="width:90%;">
														    <option>---Select Category---- </option>
													<c:forEach var="category" items="${categoryList}">
													    <option value="${category.categoryId}">${category.categoryName} </option>
													</c:forEach>
							 </select>
						</div>

						<div class="col-xs-3">
							<label><spring:message code="label.page.unitName"/></label>
							
							<select name= "unitObj" id="unitObj" class="form-control" style="width:90%;">
														    <option>---Select Unit---- </option>
													<c:forEach var="unit" items="${unitList}">
													 <option value="${unit.id}">${unit.unitName} </option>
													</c:forEach>
							</select>
							
							<%-- <form:select path="unit" class="form-control" id="unitId">
								<form:option value="">Select Unit</form:option>
								<form:option value="Pieces">Pieces</form:option>
								<form:option value="Kg">Kg</form:option>
								<form:option value="Meter">Meter</form:option>
								<form:option value="Box">Box</form:option>
								<form:option value="Gram">Gram</form:option>
								<form:option value="Litre">Litre</form:option>
							</form:select> --%>
						</div>

						<div class="col-xs-3">
							<label><spring:message code="label.page.saleRate"/></label>
							<div class="form-group">
								<label class="sr-only" for=""><spring:message code="label.page.saleRate"/></label>
								<div class="input-group">
									<div class="input-group-addon"><spring:message code="label.page.rs"/></div>
									<input type="number" class="form-control"
										id="saleRate" name="saleRate" placeholder="<spring:message code="label.page.amount"/>" />
									<div class="input-group-addon">.00</div>
								</div>
							</div>
						</div>
						 <div class="col-xs-3">
							<label><spring:message code="label.page.productQuantity"/></label>
							<input type="text" id="quantity" name="quantity"  class="form-control"
								placeholder="<spring:message code="label.page.productQuantity"/>" />
						</div> 
						<div class="col-xs-3">
							<label><spring:message code="label.page.vat"/>(%)</label>
							<select name= "vatObj" id="vatObj" class="form-control" style="width:90%;">
														    <option>---Select Vat---- </option>
													<c:forEach var="vat" items="${vatList}">
													 <option value="${vat.id}">${vat.vatPercent} </option>
													</c:forEach>
							</select>
						</div>
					</div>
					<br>
					<br>
					<div class="container">
						<button type="submit" class="btn btn-primary">Save</button>
							<c:set var="showEdit" value="false" />
							<c:if
									test="${fn:contains(sessionScope.permissionList, 'Update Product' ) || sessionScope.userName=='admin'}">
									<c:set var="showEdit" value="true" />
						<button type="submit" class="btn btn-info">Update</button>
						</c:if>
					</div>
            <input type="text" id="id" name ="id" class="form-control" value="0" style="visibility: hidden"  > 
				</form:form>
			</div>

			<!-- /.row -->
		</div>

		<!-- /.container-fluid -->
		<br> <br>
		<div class="row">
		
		   <div class="col-xs-12">
					<table id="dataTable" class="display">
					<thead>
						<tr>
							<th><spring:message code="label.page.srno" /></th>
							<th><spring:message code="label.page.godownName"/></th>
							<th><spring:message code="label.page.productCode"/></th>
							<th><spring:message code="label.page.productName"/></th>
							<th><spring:message code="label.page.availableQty"/></th>
							<th><spring:message code="label.page.action" /></th>
							
						</tr>
					</thead>
					                  <tbody>
												 <c:forEach var="productObj" items="${productList }"
													varStatus="theCount">
													<tr class="gradeA odd" role="row">
														<td class="sorting_1">${theCount.count }</td>
														<td>${ productObj.godowanModel.name}</td>
														<td>${ productObj.productCode}</td>
														<td>${ productObj.productName}</td>
														<td>${ productObj.quantity}</td>
														    <c:if test="${showEdit}">
														<td clas="center"><a href="#"
															onclick="fun('${ productObj.id}','${productObj.productCode }','${productObj.productName }','${productObj.productDescription }','${productObj.godowanModel.godowanId }','${ productObj.quantity}','${productObj.vat.vatPercent }','${ productObj.categoryModel.categoryId}','${ productObj.unitModel.id}')"><img
																src="resources/images/edit-notes.png"></a></td>
														</c:if>
														<c:if test="${showDelete}">
														<td class="center"> <a href="addproductdelete.html?id=${ productObj.id}"><img src="resources/images/DeleteRed.png"></a></td>
														</c:if>
													</tr>
												</c:forEach>
											</tbody>
				</table>
					</div>
			
		</div>
	</div>
	<!-- /#page-wrapper -->

</div>

<div id="modal-from-dom" class="modal hide fade">
	<div class="modal-header">
		<a href="#" class="close">&times;</a>
		<h3>Delete URL</h3>
	</div>
	<div class="modal-body">
		<p>You are about to delete one track url, this procedure is
			irreversible.</p>
		<p>Do you want to proceed?</p>
		<p id="debug-url"></p>
	</div>
	<div class="modal-footer">
		<a href="delete.php?ref=" class="btn danger">Yes</a>
		<!-- <a href="delete.php?some=param&ref=" class="btn danger">Yes 2</a> -->
		<a href="#" data-dismiss="modal" class="btn secondary">No</a>
	</div>
</div>

<script type="text/javascript">
	
	$('#dataTable').dataTable( {
	    "bJQueryUI": true,
	    "sPaginationType": "full_numbers",
	    "sDom": 'T<"clear">lfrtip<"clear spacer">T'
	   
	   } );
	
</script>
<script>
	function fun(id, productCode, productName, productDisc, addgodowanName,
			productQuantity, vatPer, category,unit) {
		$("#productId").val(id);
		$("#productCode").val(productCode);
		$("#productName").val(productName);
		$("#productDis").val(productDisc);
		$("#godowanModel").val(addgodowanName);
		$("#productQuantity").val(productQuantity);
		$("#vatPercent").val(vatPer);
		$("#categoryId").val(category);

		 $("#godown option").each(function() {
			if ($(this).attr("selected") == "selected") {
				$(this).removeAttr("selected");
			}
		});
		var selectedIndex = "";
		$("#godown option").each(function() {
			if ($(this).text() == addgodowanName) {
				selectedIndex = $(this).val();
				$(this).attr('selected', 'selected');
			}
		});
		$("#godown").val(selectedIndex); 
		
		$("#unit option").each(function() {
			if ($(this).attr("selected") == "selected") {
				$(this).removeAttr("selected");
			}
		});
		$("#unit option").each(function() {
			if ($(this).text() == unit) {
				selectedIndex = $(this).val();
				$(this).attr('selected', 'selected');
			}
		});
		$("#unit").val(selectedIndex);
	};
</script>
<!-- /#wrapper -->


