<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <script src="https://github.com/lightswitch05/table-to-json"></script>

<head>


<!-- search code start -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/jquery-ui.css" />">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-1.5.2.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-ui.js" />"></script>
<jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
<spring:url value="/addManufacturing" var="ProductDeleteurl" />

<meta charset="utf-8">

<script type="text/javascript">
	$(function() {
		$.extend($.ui.autocomplete.prototype, {
			_renderItem : function(ul, item) {
				var term = this.element.val(), html = item.label.replace(term,
						"<b>" + term + "</b>");
				return $("<li></li>").data("item.autocomplete", item).append(
						$("<a></a>").html(html)).appendTo(ul);
			}
		});

		var availableTags = [];
		var tagsWithValues = [];

		$("#customerNames option").each(function() {
			availableTags.push($(this).text());
			tagsWithValues.push($(this).val() + "=" + $(this).text());
		});

		$("#customerName").autocomplete({
			source : availableTags,
			select : function(event, ui) {
				var value = "";
				for (var i = 0; i < tagsWithValues.length; i++) {
					values = null;
					values = tagsWithValues[i].split("=");
					if (values[1] == ui.item.value) {
						value = values[0];
						break;
					}
				}

				$("#customerId").val(value);
				$("#customerName").val(ui.item.value);
				getCustomerDetailsById(value);
				return false;
			},
			delay : 0
		});
	});
	$(function() {
		$.extend($.ui.autocomplete.prototype, {
			_renderItem : function(ul, item) {
				var term = this.element.val(), html = item.label.replace(term,
						"<b>" + term + "</b>");
				return $("<li></li>").data("item.autocomplete", item).append(
						$("<a></a>").html(html)).appendTo(ul);
			}
		});

		var availableTags = [];
		var tagsWithValues = [];

		$("#customerNamesWithMobile option").each(function() {
			availableTags.push($(this).text());
			tagsWithValues.push($(this).val() + "=" + $(this).text());
		});

		$("#mobileNo").autocomplete({
			source : availableTags,
			select : function(event, ui) {
				var value = "";
				for (var i = 0; i < tagsWithValues.length; i++) {
					values = null;
					values = tagsWithValues[i].split("=");
					if (values[1] == ui.item.value) {
						value = values[0];
						break;
					}
				}

				$("#customerId").val(value);
				$("#mobileNo").val(ui.item.value);
				getCustomerDetailsById(value);
				return false;
			},
			delay : 0
		});
	});

	$(function() {
		$.extend($.ui.autocomplete.prototype, {
			_renderItem : function(ul, item) {
				var term = this.element.val(), html = item.label.replace(term,
						"<b>" + term + "</b>");
				return $("<li></li>").data("item.autocomplete", item).append(
						$("<a></a>").html(html)).appendTo(ul);
			}
		});

		var availableTags = [];
		var tagsWithValues = [];

		$("#productCodes option").each(function() {
			availableTags.push($(this).text());
			tagsWithValues.push($(this).val() + "=" + $(this).text());
		});

		$("#productCode").autocomplete({
			source : availableTags,
			select : function(event, ui) {
				var value = "";
				for (var i = 0; i < tagsWithValues.length; i++) {
					values = null;
					values = tagsWithValues[i].split("=");
					if (values[1] == ui.item.value) {
						value = values[0];
						break;
					}
				}

				$("#productId").val(value);
				$("#productCode").val(ui.item.value);
				getProductDetailsById(value);
				return false;
			},
			delay : 0
		});
	});

	$(function() {
		$.extend($.ui.autocomplete.prototype, {
			_renderItem : function(ul, item) {
				var term = this.element.val(), html = item.label.replace(term,
						"<b>" + term + "</b>");
				return $("<li></li>").data("item.autocomplete", item).append(
						$("<a></a>").html(html)).appendTo(ul);
			}
		});

		var availableTags = [];
		var tagsWithValues = [];

		$("#productNames option").each(function() {
			availableTags.push($(this).text());
			tagsWithValues.push($(this).val() + "=" + $(this).text());
		});

		$("#productName").autocomplete({
			source : availableTags,
			select : function(event, ui) {
				var value = "";
				for (var i = 0; i < tagsWithValues.length; i++) {
					values = null;
					values = tagsWithValues[i].split("=");
					if (values[1] == ui.item.value) {
						value = values[0];
						break;
					}
				}

				$("#productId").val(value);
				$("#productName").val(ui.item.value);
				getProductDetailsById(value);
				return false;
			},
			delay : 0
		});
	});
</script>

<script type="text/javascript">
	function getCustomerDetailsById(id) {

	  var filter = /^[0-9-+]+$/;
         if (id.match('[0-9]{10}')) {

         }
         else {
            alert("कृपया वैध मोबाईल क्रमांक प्रविष्ट करा")
             return false;
         }

		$.getJSON('getCustomerDetails', {
			id : id
		}, function(data) {
			//alert(data);
		});

		$.ajax({
			method : 'GET',
			url : 'getCustomerDetails',
			dataType : 'json',
			data : {
				id : id
			},
			success : function(data) {
				clearCustomerDetails();
				$("#customerId").val(data.id);
				$("#customerName").val(data.customerName);
				$("#mobileNo").val(data.mobileNo);
				$("#address").val(data.address);
				document.getElementById("customerName").focus();
			}
		});
	}

	function clearCustomerDetails() {
		$("#customerName").val('');
		$("#mobileNo").val('');
		$("#address").val('');
	}

function getProductDetailsByCatId(id) {
		$('#productNames').find("option").remove();
		$.getJSON('getProductList', {
			id : id
		}, function(data) {

		});

		$.ajax({
			method : 'GET',
			url : 'getProductList',
			dataType : 'json',
			data : {
				id : id
			},
			success : function(data) {
                 $(data).each(function()
                  {
                      //this refers to the current item being iterated over

                      var option = $('<option />');
                      option.attr('value', this.id).text(this.productName);

                      $('#productNames').append(option);
                  });

				/* $("#productId").val(data.id);
				$("#productCode").val(data.productCode);
				$("#productName").val(data.productName);
				$("#unit").val(data.unitModel.unitName);
				if (isInt(data.vat.vatPercent))
					$("#vat").val(data.vat.vatPercent.toFixed(1));
				else
					$("#vat").val(data.vat.vatPercent);
				$("#salePrice").val(data.saleRate);

				document.getElementById("salePrice").focus();*/

			}
		});
	}

	function getProductDetailsById(id) {
		$.getJSON('getProductDetails', {
			id : id
		}, function(data) {
			alert(data);
		});

		$.ajax({
			method : 'GET',
			url : 'getProductDetails',
			dataType : 'json',
			data : {
				id : id
			},
			success : function(data) {
				$("#productId").val(data.id);
				$("#productCode").val(data.productCode);
				$("#productName").val(data.productName);
				$("#unit").val(data.unitModel.unitName);
				if (isInt(data.vat.vatPercent))
					$("#vat").val(data.vat.vatPercent.toFixed(1));
				else
					$("#vat").val(data.vat.vatPercent);
				$("#salePrice").val(data.saleRate);
				$("#availableQuantity").val(data.quantity);

				document.getElementById("salePrice").focus();

			}
		});
	}
	function isInt(n) {
		return Number(n) === n && n % 1 === 0;
	}
	function clearProductDetails() {
		$("#productId").val('');
		$("#productCode").val('');
		$("#productName").val('');
		$("#unit").val("0");
		$("#vat").val("0");
		$('#salePrice').val('');
	}
</script>

<script>
	var productId = new Array();
	var productName = new Array();
	var productCode = new Array();
</script>
<c:forEach var="entry" items="${list}">
	<script>
		productCode.push('${entry.productCode}');
		productId.push('${entry.productId}');
		productName.push('${entry.productName}');
	</script>
</c:forEach>
<script>
	function checkValue(id, abc) {
		for (j = 0; j < productId.length; j++) {
			if (id == productCode[j]) {
				$(abc).parent("td").next().find("input").val(productName[j]);
			}
		}
	}
</script>
<script>
	$(function() {
		var availableTags = productCode;
		$(".productCodeClass").autocomplete({
			source : availableTags
		});

	});
</script>
</head>



<body>
	<div id="wrapper">

		<!-- Navigation -->

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<!doctype html>
					<html lang="en">
<div id="wrapper">

	<!-- Navigation -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<!--style="background:#23527C;color:#FFFFFF;"-->
				<h1 class="page-header">Sale Bill</h1>
			</div>
		</div>
		<form:form class="mws-form" Commandname="addProduct"
        						name="addProductForm" id="myForm" modelAttribute="addProduct"
        						action="${addProductUrl}" method="post">
		<!-- Accordian Start -->
		<div class="bs-example">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne">CUSTOMER</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse ">
						<div class="panel-body">
							<div class="col-xs-3">
								<label>Customer Name</label> <select id="customerNames"
									style="display: none;">
									<c:forEach varStatus="theCount" items="${customerList}"
										var="customer">
										<option value="${customer.id}">${customer.customerName}</option>
									</c:forEach>
								</select> <input type="text" id="customerName" name="customerName"
									class="form-control" placeholder="Customer Name"> <input
									type="hidden" id="customerId" name="customerId">

							</div>
							<div class="col-xs-3">
								<label>Mobile No.</label> <select id="customerNamesWithMobile"
									style="display: none;">
									<c:forEach varStatus="theCount" items="${customerList}"
										var="customer">
										<option value="${customer.id}">${customer.customerName}&nbsp;&nbsp;&nbsp;${customer.mobileNo}</option>
									</c:forEach>
								</select> <input type="number" id="mobileNo" name="mobileNo"
									class="form-control" placeholder="Mobile No."  pattern="\d{3}[\-]\d{3}[\-]\d{4}" required>
							</div>

							<div class="col-xs-3">
								<label>Address </label><input type="text" id="address"
									name="address" class="form-control" placeholder="Address ">
							</div>


						</div>
						<div class="container"
							style="padding-bottom: 2%; margin-left: 40%;">

							<button type="button" onclick="clearCustomerDetails();"
								class="btn btn-info">
								<spring:message code="label.page.clear" />
							</button>
                            <button type="button" onclick="javascript:getCustomerDetailsById($('#mobileNo').val());"
                                class="btn btn-info">
                                <spring:message code="label.page.search" />
                            </button>
                        </div>
					</div>

				</div>
			</div>

			<div class="panel-group" id="accordion1">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion1"
								href="#collapseOne1">PRODUCT</a>
						</h4>
					</div>
					<div id="collapseOne1" class="panel-collapse collapse ">
						<div class="panel-body">
							<div class="col-xs-3">
								<label>Product Category</label> <select id="productCategory" onchange="getProductDetailsByCatId(this.value)">
									<c:forEach varStatus="theCount" items="${categoryList}"
										var="category">
										<option value="${category.categoryId}">${category.categoryName}</option>
									</c:forEach>
								</select>  <input
									type="hidden" name="productId" id="productId">

							</div>
							<div class="col-xs-3">
								<label>Product Name</label> <select id="productNames" onchange="getProductDetailsById(this.value)">
                                 <option>select Value</option>
								</select>
								<input type="hidden" name="productName" id="productName">
								<input type="hidden" name="productCode" id="productCode">
								<input type="hidden" name="vat" id="vat">
								<input type="hidden" name="unit" id="unit">
								<input type="hidden" name="allRow" id="allRow">
							</div>

							<div class="col-xs-3">
								<label>Sale Price</label><input type="text" id="salePrice"
									name="salePrice" class="form-control" placeholder="Sale Price">
							</div>
							<div class="col-xs-3">
                                <label>Available Quantity</label><input type="text" id="availableQuantity"
                                    name="availableQuantity" class="form-control">
                            </div>
							<div class="col-xs-3">
								<label>Quantity</label><input type="text" id="quantity"
									name="quantity" class="form-control" placeholder="Quantity"
									onkeydown="if (event.keyCode == 13)return addrow();">
							</div>



						</div>
						<div class="container"
							style="padding-bottom: 2%; margin-left: 40%;">

							<button type="button" id="save" name="save"
								class="btn btn-primary" onclick="return addrow();">
								<spring:message code="label.page.saveButton" />
							</button>

							<button type="reset" class="btn btn-info">
								<spring:message code="label.page.clear" />
							</button>


						</div>
					</div>

				</div>
			</div>

		</div>

		<div>
			<table id="table2" border="1px" cellpadding="3">
				<tr>
					<th width="6%">Sr.</th>
					<th width="15%">Product Code</th>
					<th width="15%">Product Name</th>
					<th width="6%">Qty</th>
					<th width="7%">Unit</th>
					<th width="12%">Sale Rate/Unit</th>
					<th width="6%">Vat(%)</th>
					<th width="9%">Vat Amount</th>
					<th width="12%">Total</th>


					<th width="5%"><button type="button"
							onclick="return addrow();">
							<img src="<%=request.getContextPath()%>/resources/images/add.png">
						</button> <input type="hidden" id="lastid" value="1"> <input
						type="hidden" id="deleterow1" value=""></th>
				</tr>


			</table>

		</div>
	</div>
	<!-- /.container-fluid -->
	<br>




	<!-- /.panel -->
	<div class="row">
		<div class="polowersec">
			<div class="poleft">
				<div class="col-xs-9 PO">
					<label>Delivery date :</label> <input type="text"
						class="form-control" name="deliveryDate" id="datepickerdelivery"
						placeholder="Delivery date">

				</div>
				<div class="col-xs-9 PO">
					<label>Paid Amount</label> <input type="text" id="paidAmount"
						name="paidAmount" class="form-control " placeholder="Paid Amount">
				</div>


			</div>

			<div class="poright">
				<div class="POrightinner">
					<div class="col-xs-9 PO">
						<label>Total</label> <input type="text" id="totalAmount"
							name="totalAmount" class="form-control" placeholder="Total">
					</div>


					<div class="col-xs-9 PO">
						<label>Service Tax(%)</label> <select id="serviceTax"
							name="serviceTax" class="form-control" style="width: 100px;"
							onchange="calculateTotal();">
							<option value="0">Service Tax</option>
							<c:forEach items="${serviceTaxList}" var="serviceTax"
								varStatus="theCount">
								<option value="${serviceTax.serviceTaxPercent}">${serviceTax.serviceTaxPercent}</option>
							</c:forEach>
						</select> <label for="serviceTaxAmount" id="serviceTaxAmount">0</label>
					</div>
					<div class="col-xs-9 PO">


						<label>Vat(%)</label> <select id="vatTax" name="vatTax"
							class="form-control" style="width: 100px;"
							onchange="calculateTotal();">
							<option value="0">Vat</option>
							<c:forEach items="${vatList}" var="vat" varStatus="theCount">
								<option value="${vat.vatPercent}">${vat.vatPercent}</option>
							</c:forEach>
						</select> <label for="vatTaxAmount" id="vatTaxAmount">0</label>

					</div>
					<div class="col-xs-9 PO">
						<label>Net Amount</label> <input type="text" class="form-control"
							id="netAmount" name="netAmount" placeholder="Net Amount">
					</div>



				</div>
			</div>
		</div>
		<br>



	</div>
	<div>
		<input type="submit" value="Submit" class="btn btn-success">
	</div>
	</table>
    </form:form>
	<!-- /.col-lg-12 -->

	<script>
	var saleData  = [];
		function addrow() {

			var productIdText = $("#productId").val();
			var productCodeText = $("#productCode").val();
			var productNameText = $("#productName").val();
			var unitText = $("#unit").val();
			var vatText = $("#vat").val();
			var quantityText = $("#quantity").val();
			var salePriceText = $("#salePrice").val();
			total = Math.round((quantityText * salePriceText) * 100) / 100;

			var totalAmountDeductedVatAmount = Math
					.round((total / (1 + (vatText / 100))) * 100) / 100;

			var vatAmountRs = Math
					.round((total - totalAmountDeductedVatAmount) * 100) / 100;

            saleData.push({
                         "productId": productIdText,
                         "quantity": productCodeText,
                         "salePrice":salePriceText,
                         "totalAmount":totalAmountDeductedVatAmount,
                         "saleOrderID":""
                     });
            $("#allRow").val(saleData);
            console.log(saleData)
            console.log($("#allRow").val())
			var table = document.getElementById("table2");
			var rowCount = table.rows.length;
			var row1 = rowCount;
			var row = table.insertRow(rowCount);
			var lastid = document.getElementById("lastid").value;
			document.getElementById("lastid").value = eval(lastid) + 1;
			rowCount = eval(eval(lastid) + 1);
			//code for Yarn Composition cell in fabric compostion table
			var cell1 = row.insertCell(0);
			var srno = "<td style='margin-bottom:5px;' align='center'>" + row1
					+ "</td>";
			cell1.innerHTML = srno;

			var cell2 = row.insertCell(1);
			var productCode1 = "<td style='margin-bottom:5px;' align='center'>"
					+ productCodeText + "</td>";
			cell2.innerHTML = productCode1;

			var cell3 = row.insertCell(2);
			var productName = "<td style='margin-bottom:5px;' align='center'>"
					+ productNameText + "</td>";
			cell3.innerHTML = productName;

			var cell4 = row.insertCell(3);
			var quantity = "<td style='margin-bottom:5px;' align='center'>"
					+ quantityText + "</td>";
			cell4.innerHTML = quantity;

			var cell5 = row.insertCell(4);
			var unit = "<td style='margin-bottom:5px;' align='center'>"
					+ unitText + "</td>";
			cell5.innerHTML = unit;

			var cell6 = row.insertCell(5);
			var saleRate = "<td style='margin-bottom:5px;' align='center'>"
					+ salePriceText + "</td>";
			cell6.innerHTML = saleRate;

			var cell7 = row.insertCell(6);
			var vatPerc = "<td style='margin-bottom:5px;' align='center'>"
					+ vatText + "</td>";
			cell7.innerHTML = vatPerc;

			var cell8 = row.insertCell(7);
			var vatAmount = "<td style='margin-bottom:5px;' align='center'>"
					+ vatAmountRs + "</td>";
			cell8.innerHTML = vatAmount;

			var cell9 = row.insertCell(8);
			var totalTable = "<td style='margin-bottom:5px;' align='center'>"
					+ total + "</td>";
			cell9.innerHTML = totalTable;

			var cell10 = row.insertCell(9);
			cell10.innerHTML = "<td ><button type='button'  class='sm-btn btn-danger' onclick='deleterow(this);'><i class='icon-minus'>del</i></button></td>";

			calculateTotal();

			/*var availableTags = productCode;

			$("#table2 tr").each(function() {
				$(this).find("td:first").next().find("input").autocomplete({
					source : availableTags
				});
			});*/

		}
		function deleterow(o) {
			var p = o.parentNode.parentNode.rowIndex;
			document.getElementById("table2").deleteRow(p);
			var k = 1;
			var tbllen = document.getElementById("lastid").value;
			for (var i = 1; i <= tbllen; i++) {
				if (document.getElementById("srno" + i) != null)
					document.getElementById("srno" + i).value = k++;
			}
		}

		function calculateTotal() {
			var cells = Array.prototype.slice.call(document.getElementById(
					"table2").getElementsByTagName("td"));
			var total = 0.0;
			for ( var i in cells) {

				//alert("Value of ="+i);+"  value of element="+cells[i].innerHTML);
				//    alert("My contents is \"" + cells[i].innerHTML + "\"");
				if (i % 10 == 8) {
					total = total + parseFloat(cells[i].innerHTML);
				}
			}

			var serviceTaxPerc = $("#serviceTax").val();

			
			
			var vatTaxPerc = $("#vatTax").val();
			

			var serviceTaxAmount = Math
					.round((total * (serviceTaxPerc / 100)) * 100) / 100;
			
			var vatTaxAmount = Math.round((total * (vatTaxPerc / 100)) * 100) / 100;
			
			var netAmount = Math
					.round((total + serviceTaxAmount + vatTaxAmount) * 100) / 100;

			
			$("label[for='vatTaxAmount']").html(vatTaxAmount);
			$("label[for='serviceTaxAmount']").html(serviceTaxAmount);
			$("#vatTaxAmount").val(vatTaxAmount);
			$("#serviceTaxAmount").val(serviceTaxAmount);
			$("#totalAmount").val(total);
			$("#netAmount").val(netAmount);

		}
	</script>



	<script>
		$("#datepicker").datepicker({
			format : 'dd-mm-yyyy'
		}).datepicker("setValue", new Date());
	</script>

	<style>
.polowersec {
	width: 100%;
	/*background: red;*/
}

.poleft {
	float: left;
	width: 45%;
	height: auto;
}

.poright {
	float: left;
	right: 0px;
	width: 55%;
	height: auto;
	/*background: blue;*/
}

.PO {
	clear: both;
}

.PO input {
	width: 100px;
	height: 24px;
	padding: 3px 8px;
	height: 24px;
}

.POrightinner {
	padding-left: 58%; //
	float: right;
}

.POrightinner input {
	border-radius: 0px;
}
}
</style>
</body>
</html>