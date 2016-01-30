<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
     <spring:url value="/addproductdelete"  var ="ProductDeleteurl"/>
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
				<form:form modelAttribute="product" action="/saveProduct"
					method="post">
					
							<div class="row">
							
							 <div>
						   <jsp:include page="/WEB-INF/views/messagesBlock.jsp"></jsp:include>
						   </div>
					 <div class="col-xs-3">
							<label>Godowan</label>
							  <select name="godowanModel" id="godowanModel" class="form-control" style="width:90%;">
														    <option>---Select Godown---- </option>
													<c:forEach var="addgodowanlist" items="${addgodowanlist}">
													    <option value="${addgodowanlist.addgodowanId}">${addgodowanlist.addgodowanName} </option>
													</c:forEach>
							 </select>
						</div>
					 </div>
					<div class="row">
						<div class="col-xs-3">
							<label>Product Code</label>
							<form:input path="productCode" class="form-control"
								placeholder="Product code" id="productCode" />
						</div>
						<div class="col-xs-3">
							<label>Name</label>
							<form:input path="productName" class="form-control"
								placeholder="Name" id="productName" />
						</div>
						<div class="col-xs-3">
							<label>Product Description</label>
							<form:input path="productDisc" class="form-control"
								placeholder="Product Description" id="productDis" />
							<!--<textarea class="form-control" rows="1"></textarea>-->
						</div>
						<div class="col-xs-3">
							<label>Category</label>
							  <select name="categoryObj" id="categoryId" class="form-control" style="width:90%;">
														    <option>---Select Category---- </option>
													<c:forEach var="addCategorylist" items="${addCategorylist}">
													    <option value="${addCategorylist.categoryId}">${addCategorylist.categoryName} </option>
													</c:forEach>
							 </select>
						</div>

						<div class="col-xs-3">
							<label>Unit</label>
							<form:select path="unit" class="form-control" id="unit">
								<form:option value="">Select Unit</form:option>
								<form:option value="Pieces">Pieces</form:option>
								<form:option value="Kg">Kg</form:option>
								<form:option value="Meter">Meter</form:option>
								<form:option value="Box">Box</form:option>
								<form:option value="Gram">Gram</form:option>
								<form:option value="Litre">Litre</form:option>
							</form:select>
						</div>

						<div class="col-xs-3">
							<label>Purchase Price</label>
							<div class="form-group">
								<label class="sr-only" for="">Purchase Rate</label>
								<div class="input-group">
									<div class="input-group-addon">Rs.</div>
									<form:input path="purchaseRate" class="form-control"
										id="purchaseRate" placeholder="Amount" />
									<div class="input-group-addon">.00</div>
								</div>
							</div>
						</div>
						 <div class="col-xs-3">
							<label>Product Quantity</label>
							<form:input path="productQuantity" class="form-control"
								placeholder="productQuantity" id="productQuantity" />
						</div> 
						<div class="col-xs-3">
							<label>Vat(%)</label>
							<select name= "vatPercent" id="vatPercent" class="form-control" style="width:90%;">
														    <option>---Select Vat---- </option>
													<c:forEach var="addVatlist" items="${addVatlist}">
													 <option value="${addVatlist.vatPercent}">${addVatlist.vatPercent} </option>
													</c:forEach>
							</select>
						</div>
					</div>
					<br>
					<br>
					<form:input path="productId" id="productId" type="hidden" />
					<div class="container">
						<button type="submit" class="btn btn-primary">Save</button>
							<c:set var="showEdit" value="false" />
							<c:if
									test="${fn:contains(sessionScope.permissionList, 'Update Product' ) || sessionScope.userName=='admin'}">
									<c:set var="showEdit" value="true" />
						<button type="submit" class="btn btn-info">Update</button>
						</c:if>
					</div>
          <!--  <input type="text" id="productId" name ="productId" class="form-control" value="0" style="visibility: hidden"  > -->
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
							<th>Sr. No.</th>
							<th>Godown</th>
							<th>Product Code</th>
							<th>Product Name</th>
							<th>Available Qty</th>
							<c:if test="${showEdit}">
							<th>Edit</th>
							</c:if>
							<c:set var="showDelete" value="false" />
							<c:if
									test="${fn:contains(sessionScope.permissionList, 'Delete Product' ) || sessionScope.userName=='admin'}">
									<c:set var="showDelete" value="true" />
							<th>Delete</th>
							</c:if>
						</tr>
					</thead>
					                  <tbody>
												<c:forEach var="productObj" items="${productList }"
													varStatus="theCount">
													<tr class="gradeA odd" role="row">
														<td class="sorting_1">${theCount.count }</td>
														<td>${ productObj.godowanModel.addgodowanName}</td>
														<td>${ productObj.productCode}</td>
														<td>${ productObj.productName}</td>
														<td>${ productObj.productQuantity}</td>
														<c:if test="${showEdit}">
														<td class="center"><a href="#"
															onclick="fun('${ productObj.productId}','${productObj.productCode }','${productObj.productName }','${productObj.productDisc }','${productObj.godowanModel.addgodowanId }','${ productObj.productQuantity}','${productObj.purchaseRate }','${productObj.vatPercent }','${ productObj.categoryObj.categoryId}','${ productObj.unit}')"><img
																src="resources/images/edit-notes.png"></a></td>
														</c:if>
														<c:if test="${showDelete}">
														<td class="center"> <a href="addproductdelete.html?id=${ productObj.productId}"><img src="resources/images/DeleteRed.png"></a></td>
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
			productQuantity, purchaseRate, vatPer, category,unit) {
		$("#productId").val(id);
		$("#productCode").val(productCode);
		$("#productName").val(productName);
		$("#productDis").val(productDisc);
		$("#godowanModel").val(addgodowanName);
		$("#productQuantity").val(productQuantity);
		$("#purchaseRate").val(purchaseRate);
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


