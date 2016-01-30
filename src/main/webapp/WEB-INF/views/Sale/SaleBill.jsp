<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<head>
        <jsp:include page="/WEB-INF/views/body.jsp"></jsp:include>
	    <jsp:include page="/WEB-INF/views/menu.jsp"></jsp:include>
     <spring:url value="/addManufacturing"  var ="ProductDeleteurl"/>
     </head>

	<div id="wrapper">

        <!-- Navigation -->
     
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                   <!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">

<script>
var productId = new Array();
var productName=new Array();
var productCode=new Array();
</script>
<c:forEach  var="entry" items="${list}">
<script>
productCode.push('${entry.productCode}');
productId.push('${entry.productId}');
productName.push('${entry.productName}');

</script>
</c:forEach>
<script>
function checkValue(id,abc)
{
	for(j=0;j<productId.length;j++){
		if(id==productCode[j]){	
		$(abc).parent("td").next().find("input").val(productName[j]);
		}
	}	
}
</script>
<script>
$(function() {
var availableTags = productCode;
$( ".productCodeClass" ).autocomplete({source: availableTags});

});
</script>
</head>



<body>
<div id="wrapper">

        <!-- Navigation -->
    <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12" ><!--style="background:#23527C;color:#FFFFFF;"-->
                        <h1 class="page-header">Sale Bill</h1>
                    </div>
                   </div>
                   <!-- Accordian Start -->
                   <div class="bs-example">
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">CUSTOMER</a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse ">
                <div class="panel-body">
                    <div class="col-xs-3">
								<label>First Name</label><input type="text"  id="firstName" name ="firstName" class="form-control" placeholder="FirstName">
								
							  </div>
							  <div class="col-xs-3">
							  <label>Middle Name</label><input type="text"  id="middleName" name ="middleName" class="form-control" placeholder="MiddleName">
							</div>
							<div class="col-xs-3">	
								<label>Last Name</label><input type="text"  id="lastName" name ="lastName" class="form-control" placeholder="LastName">
								</div>
							<div class="col-xs-3" >
								<label>Tin No.</label><input type="text" id="tinNo" name="tinNo"  class="form-control" placeholder="Tin No.">
				    </div>
							<div class="col-xs-3">
										<label>Address Line1</label><input type="text"  id="addressLine1" name="addressLine1" class="form-control" placeholder="Address Line1">
										<!--<textarea rows="1" class="form-control"></textarea>-->
							</div>
							<div class="col-xs-3">
										<label>Address Line2</label><input type="text" id="addressLine2" name="addressLine2" class="form-control" placeholder="Address Line2">
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
									<%-- <c:forEach items="${stateCityList}" var="stateCityList"
										varStatus="theCount">
										<option value="${cityList.cityName}">${cityList.cityName}</option>
									</c:forEach> --%>
							</select>
                </div>
					<div class="col-xs-3" >
								<label>Pin No.</label><input type="text" id="pinNo" name="pinNo"  class="form-control" placeholder="Pin No.">
				    </div>
					<div class="col-xs-3">
								<label>Telephone No.</label><input type="text" id="telephoneNo" name="telephoneNo"  class="form-control" placeholder="Phone No.">
				    </div>
				    <div class="col-xs-3">
								<label>Phone No 1.</label><input type="text" id="phoneNo1" name="phoneNo1"  class="form-control" placeholder="Phone No 1.">
				    </div>
				    <div class="col-xs-3">
								<label>Phone No 2.</label><input type="text" id="phoneNo2" name="phoneNo2"  class="form-control" placeholder="Phone No 2.">
				    </div>
				     <div class="col-xs-3">
								<label>Email .</label><input type="text" id="email" name="email"  class="form-control" placeholder="Email Id 2.">
				    </div>
					<div class="col-xs-3">
								<label>Credit Balance</label><input type="text"  id="creditBalance" name="creditBalance"  class="form-control" placeholder="0.0" value="0.0">
				    </div>
					<div class="col-xs-3">
								<label>Debit Balance</label><input type="text"  id="debitBalance" name="debitBalance"  class="form-control" placeholder="0.0" value="0.0">
				    </div>
				    <div class="col-xs-3">
								<label>Credit Limit</label><input type="text"  id="creditLimit" name="creditLimit"  class="form-control" placeholder="0.0" value="0.0">
				    </div>
					</div>
                </div>
                
            </div>
        </div>
        
</div>
                   <!--Accordian End  -->
		<!-- 	  <div class="col-xs-3">
					<label for="tags">Product Code</label>
					<input id="tags" onChange="checkValue(this.value)" class="form-control" >
			  </div>
			 <div class="col-xs-3">
					<label for="tags">Product Name</label>
					<input id="name" class="form-control"  >
			</div> -->
			
<div>
							<table id="table2" border="1px" cellpadding="3">
								<tr>
									<th width="6%">Sr.</th>
									<th width="15%">Product Code </th>
									<th width="15%">Product Name </th>
									<th width="12%">Quntity</th>
									<th width="12%">Unit Price</th>
									<th width="12%">Amount</th>
									<th width="12%">Total</th>


									<th width="5%"><button type="button"
											onclick="return addrow();">
											<img 
												src="<%=request.getContextPath()%>/resources/images/add.png">
										</button> <input type="hidden" id="lastid" value="1"> 
										   <input type="hidden" id="deleterow1" value=""></th>
								</tr>
								<tr>
									<td><input type="text" value="1" name="srno" id="srno1"
										class="form-control required"
										style="width: 90%; background-color: white;"
										readonly="readonly"></td>
										<td><input type="text" name="productCode[]" id="productCode" onChange="checkValue(this.value,this)"
										class="required productCodeClass" style="float: none; width: 95%;"/></td>
										
										<td><input type="text" name="productName[]" id="productName"
										class="required" style="float: none; width: 95%;"
										/></td>
									  <td><input type="text" name="quantity[]" id="quantity1"
										class="required" style="float: none; width: 95%;"
										/></td>
									
									<td><input type="text" id=unit_name1 name="unitPrice[]"
										style="width: 95%;" onchange="return gettotalcost(this,this.value);"/></td>

									<td><input type="text" name="discount[]" id="discount1"
										class="required" style="width: 95%;" readonly="readonly"></td>
									<td><input type="text" name="totalCost[]" id="cost1"
										class="required" style="width: 95%;" readonly="readonly"></td>
								
									
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
									<div class="col-xs-6 PO">
										<label>Delivery date :</label> <input type="text"
											class="form-control" name="deliveryDate"  id="datepickerdelivery"    placeholder="Delivery date"  >
											
									</div>
									<div class="col-xs-6 PO">
										<label>Paid Amount</label> <input type="text"  id="paidAmount" name="paidAmount" class="form-control "
											placeholder="Paid Amount">
									</div>


								</div>

								<div class="poright">
									<div class="POrightinner">
										<div class="col-xs-6 PO">
											<label>Total</label> <input type="text" id="totalAmount" name="totalAmount" class="form-control"
												placeholder="Total">
										</div>


										<div class="col-xs-6 PO">
											<label>Service Tax</label> <input type="text"
												class="form-control "  id="serviceTax" name="serviceTax" placeholder="Service Tax" onchange="return getderviceTax(this.value);"/>
												
										</div>
										<div class="col-xs-6 PO">
											<label>Vat </label> <input type="text" id="vat"  name="vat" class="form-control "
												placeholder="Vat" onchange="return getVat(this.value);"/>
												
										</div>
										<div class="col-xs-6 PO">
											<label>Net Amount</label> <input type="text"
												class="form-control" id="netAmount" name="netAmount" placeholder="Net Amount">
										</div>


										
									</div>
								</div>
							</div>
							<br>
                              
                               
            
						</div>
						 <div><input type="submit" value="Submit" class="btn btn-success" ></div>
						</table>
						
						<!-- /.col-lg-12 -->

						<script>
							function addrow() {
								var table = document.getElementById("table2");
								var rowCount = table.rows.length;
								var row1 = rowCount;
								var row = table.insertRow(rowCount);
								var lastid = document.getElementById("lastid").value;
								document.getElementById("lastid").value = eval(lastid) + 1;
								rowCount = eval(eval(lastid) + 1);
								//code for Yarn Composition cell in fabric compostion table
								var cell1 = row.insertCell(0);
								var srno = "<td style='margin-bottom:5px;' align='center'><input type='text' name='srno' value="
										+ row1
										+ " id='srno"
										+ rowCount
										+ "' class=' form-control required' style='background-color: white;width:95%;' readonly='readonly'></td>";
								cell1.innerHTML = srno;

								var cell2 = row.insertCell(1);
								var productCode1 = "<input type='text' name='productCode[]' id='productCode"
										+ rowCount
										+ "' class='required' style='float:none;width:95%;' onChange='checkValue(this.value,this)'>";
								cell2.innerHTML = productCode1;
							
								var cell8 = row.insertCell(2);
								var productName = "<input type='text' name='productName[]' id='productName"
										+ rowCount
										+ "' class='required' style='float:none;width:95%;' onblur='calldemo(this.id)'>";
								cell8.innerHTML = productName;
								
								var cell3 = row.insertCell(3);
								var quantity = "<input type='text' name='quantity[]' id='quantity"
										+ rowCount
										+ "' class='required' style='float:none;width:95%;' >";
								cell3.innerHTML = quantity;

								var cell4 = row.insertCell(4);
								var unit_name = "<td align='center'><input type='text' name='unitPrice[]' id='unit_name"
										+ rowCount
										+ "' class='mws-select2 medium' style='width:95%;' onchange='return gettotalcost(this,this.value);'/></td>";
								cell4.innerHTML = unit_name;

								var cell5 = row.insertCell(5);
								var discount = "<input type='text' name='discount[]' id='discount"
										+ rowCount
										+ "' class='required' style='float:none;width:95%;' readonly='readonly'>";
								cell5.innerHTML = discount;

								var cell6 = row.insertCell(6);
								var cost = "<input type='text' name='totalCost[]' id='cost"
										+ rowCount
										+ "' class='required' style='float:none;width:95%;' readonly='readonly'>";
								cell6.innerHTML = cost;

							

								var cell7 = row.insertCell(7);
								cell7.innerHTML = "<td ><button type='button'  class='sm-btn btn-danger' onclick='deleterow(this);'><i class='icon-minus'>del</i></button></td>";

								var availableTags = productCode;
								
								$("#table2 tr").each(function() {
									$(this).find("td:first").next().find("input").autocomplete({source: availableTags});
								});
							
							}
							function deleterow(o) {
								var p = o.parentNode.parentNode.rowIndex;
								document.getElementById("table2").deleteRow(p);
								var k = 1;
								var tbllen = document.getElementById("lastid").value;
								for ( var i = 1; i <= tbllen; i++) {
									if (document.getElementById("srno" + i) != null)
										document.getElementById("srno" + i).value = k++;
								}
								deletevalue();
							}
							
							
						</script>
						
  <script>
  function gettotalcost(abc,currentPrice) {
	  var amount123=amount=0;
	  
	 var qty= $(abc).parent('td').prev('td').find('input').val();
	$(abc).parent('td').next('td').find('input').val(currentPrice*qty);
	$(abc).parent('td').next('td').find('input').val();
	 var iRowCount =document.getElementById("lastid").value;

	 for(var i=1; i<=iRowCount; i++)
     {
    	 amount =document.getElementById("discount"+i).value
    	 amount123=eval(amount123)+eval(amount);
    	
     }
	 document.getElementById("totalAmount").value=amount123;
	 document.getElementById("netAmount").value=amount123;
	
     
     }
  
  </script>




<script>
   function getderviceTax(tax)
   {
	
	var totalamount=netamt=totamt=0;
	 totalamount = document.getElementById("totalAmount").value;
	 netamt =(eval(tax)*eval(totalamount))/100;
	 totamt=  eval(totalamount+netamt);
	 totamt=  (eval(netamt)+eval(totalamount));
	 document.getElementById("netAmount").value=totamt;
	
	}
   function getVat(vat)
   
    {
	 var totalamount=netamt=totamt=0;
	 totalamount = document.getElementById("totalAmount").value;
	 netamt =(eval(vat)*eval(totalamount))/100;
	 totamt=  (eval(netamt)+eval(totalamount));
	 document.getElementById("netAmount").value=totamt;
	}


       function deletevalue()
      {
    	 
    	   var iRowCount =document.getElementById("lastid").value;
    	  
    		 for(var i=1; i<=iRowCount; i++)
    	     {
    	    	 amount =document.getElementById("discount"+i).value
    	    	 amount123=eval(amount123)+eval(amount);
    	    	
    	     }
    		 document.getElementById("totalAmount").value=amount123;
    		
    	       
    	   
       }
	function getvendorInfo(vendorId) {
		if (vendorId == 0) {
			$("#phoneNo").val("");
			$("#email").val("");
			$("#addressLine1").val("");
			$("#addressLine2").val("");
		}
		$.getJSON('getVendorInfo/' + vendorId, function(data) {
			$("#phoneno").val(data.phoneno);
			$("#email").val(data.email);
			$("#Address1").val(data.addressLine1);
			$("#Address2").val(data.addressLine2);
		});
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
	right: 0px; width : 45%;
	height: auto;
	width: 45%;
	/*background: blue;*/
}

.PO {
	clear: both;
}

.PO input {
	width: 100px; height : 24px;
	padding: 3px 8px;
	height: 24px;
}

.POrightinner {
	padding-left: 200px; //
	float: right;
}

.POrightinner input {
	border-radius: 0px;
}
}
</style>			
	
</body>
</html>
		