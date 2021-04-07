<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Readable Theme -->
<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">

<link href="${css}/myapp.css" rel="stylesheet">

<link href="${css}/singleMultiselect.css" rel="stylesheet">

<!-- jQuery -->
<script src="${js}/jquery.js"></script>

<script src="${js}/jquery.validate.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${js}/bootstrap.min.js"></script>

<link href="${js}/MultiSelect/css/multi-select.css" media="screen" rel="stylesheet" type="text/css">
</head>
<body style="background-color:#ECECEC">
<!-- <h2>CUSTOM REPORT GENERATOR</h2> -->
<div class="container-fluid">
<div class="row" style="background-color:#DBFFE4;  padding-bottom:50px; padding-top:50px; margin-top:-90px;">
	<div class="col-md-4" style="background-color:#F5F5F5; margin-left:170px; padding-left:65px; padding-bottom:50px; padding-top:50px; box-shadow: -5px -5px 20px #DBFFE4, 5px 5px 20px #DBFFE4">
    <select id="my-select" name="my-select[]">
    <c:forEach items="${rep}" var="rep">
            <option data-dd='${rep.defDispName}' data-my='${rep.prefDispName}' id='${rep.defDispName}' value='${rep.defDispName}' onclick="($('${rep.defDispName}'))">${rep.defDispName}</option>
    </c:forEach>
    </select>
    </div> 
    
    <div class="form-group col-md-5" style="background-color:#F5F5F5; width:615px; padding-left:70px; padding-right:50px; padding-bottom:50px; padding-top:50px; margin-top:1px; margin-left:20px; box-shadow:-5px -5px 20px #FFF, 5px 5px 20px #BABECC;" id = "filter" ><strong>Select To Filter Options:</strong></div> 
	<div class="form-group col-md-2" id="drop" style="width:230px; margin-left:-310px; margin-top:39px">
		<select class="form-control" id="dropBtn">
		
		</select>
	</div>
      
</div>

<div class="row" style="margin-top:-259px;">
	<div class="col-md-5" id = "filter-section" style="margin-top:-159px; background-color:#F5F5F5; margin-left:700px; height:155px; box-shadow: -5px -5px 20px #FFF, 5px 5px 20px #BABECC;">
   
   <div class="btn-group col-md-4" id="birthdayss" style="margin-top:58px; margin-left:-10px; box-shadow: -5px -5px 20px $color-white, 5px 5px 20px $color-shadow;" onclick = "testme(this.id)">
  <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:290px; ">
    SET DATE
  </button>
  <div class="dropdown-menu dropdown-menu-left" style="margin-left:15px; width:290px;">
  <input type="radio" id="greater" name="birth" value="greater" onclick="test2(this.id)">
  <label for="greater">GREATER THAN</label><br>
  <input type="radio" id="less" name="birth" value="less" onclick="test2(this.id)">
  <label for="male">LESS THAN </label><br>
  <input type="radio" id="greater-equal" name="birth" value="greater-equal" onclick="test2(this.id)">
  <label for="male">GREATER THAN OR EQUAL TO</label><br>
  <input type="radio" id="less-equal" name="birth" value="less-equal" onclick="test2(this.id)">
  <label for="male">LESS THAN OR EQUAL TO </label><br>
  <input type="radio" id="between" name="birth" value="between" onclick="test2(this.id)">
  <label for="between">BETWEEN</label><br>
  </div>
</div>

<div class="btn-group col-md-4" id="first-name" style="margin-left:-10px; margin-top:58px" onclick = "ntest(this.id)">
  <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:290px; ">
    SET NAME FILTER
  </button>
  <div class="dropdown-menu dropdown-menu-left" style="margin-left:15px; width:290px;">
  <input type="radio" id="similar" name="names" value="similar" onclick="test2(this.id)">
  <label for="similar">SIMILAR TO</label><br>
  <input type="radio" id="equal" name="names" value="equal" onclick="test2(this.id)">
  <label for="equal">EQUAL TO </label><br>
  </div>
</div>

<div class="btn-group col-md-4" id="last-name" style="margin-left:-10px; margin-top:58px" onclick = "newtest(this.id)">
  <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:290px; ">
    SET FILTER
  </button>
  <div class="dropdown-menu dropdown-menu-left" style="margin-left:15px; width:290px;">
  <input type="radio" id="similar" name="names" value="similar" onclick="lastname(this.id)">
  <label for="similar">SIMILAR TO</label><br>
  <input type="radio" id="equal" name="names" value="equal" onclick="lastname(this.id)">
  <label for="equal">EQUAL TO </label><br>
  </div>
</div>

<div class="btn-group col-md-4" id="email" style="margin-left:-10px; margin-top:58px" onclick = "newtest(this.id)">
  <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:290px; ">
    SET FILTER
  </button>
  <div class="dropdown-menu dropdown-menu-left" style="margin-left:15px; width:290px;">
  <input type="radio" id="similar" name="names" value="similar" onclick="email(this.id)">
  <label for="similar">SIMILAR TO</label><br>
  <input type="radio" id="equal" name="names" value="equal" onclick="email(this.id)">
  <label for="equal">EQUAL TO </label><br>
  </div>
</div>


<div class="btn-group col-md-4" id="initials" style="margin-left:-10px; margin-top:58px" onclick = "newtest(this.id)">
  <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:290px; ">
    SET INITIALS FILTER
  </button>
  <div class="dropdown-menu dropdown-menu-left" style="margin-left:15px; width:290px;">
  <input type="radio" id="similar" name="namess" value="similar" onclick="init(this.id)">
  <label for="similar">SIMILAR TO</label><br>
  <input type="radio" id="equal" name="namess" value="equal" onclick="init(this.id)">
  <label for="equal">EQUAL TO </label><br>
  </div>
</div>


<div class="btn-group col-md-4" id="gsm-number" style="margin-left:-10px; margin-top:58px" onclick = "newtest(this.id)">
  <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:290px; ">
    SET FILTER
  </button>
  <div class="dropdown-menu dropdown-menu-left" style="margin-left:15px; width:290px;">
  <input type="radio" id="similar" name="names" value="similar" onclick="gsmNumber(this.id)">
  <label for="similar">SIMILAR TO</label><br>
  <input type="radio" id="equal" name="names" value="equal" onclick="gsmNumber(this.id)">
  <label for="equal">EQUAL TO </label><br>
  </div>
</div>


<div class="btn-group col-md-4" id="emptype" style="margin-left:120px; margin-top:58px" onclick = "testing(this.id)">
  <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:290px; ">
    SELECT EMPLOYEE TYPE
  </button>
  <div class="dropdown-menu dropdown-menu-left" style="margin-left:15px; width:290px;">
  <input type="checkbox" value ="" class="empl">
  <label for="greater">SELECT ALL</label><br>
  <input type="checkbox" id="civil" name="emp" value="civil servant" class="check">
  <label for="greater">CIVIL SERVANT</label><br>
  <input type="checkbox" id="political" name="emp" value="political appointment" class="check">
  <label for="male">POLITICAL APPOINTMENT </label><br>
  <input type="checkbox" id="health" name="emp" value="health" class="check">
  <label for="male">HEALTH</label><br>
  <input type="checkbox" id="vet" name="emp" value="vet" class="check">
  <label for="male">VETINARY </label><br>
  <input type="checkbox" id="conhess" name="emp" value="conhess" class="check">
  <label for="between">CONHESS</label><br>
  </div>
</div>



<div class="btn-group col-md-4" id="marital" style="margin-left:120px; margin-top:58px" onclick = "maritalTest(this.id)">
  <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:290px; ">
    SELECT MARITAL STATUS
  </button>
  <div class="dropdown-menu dropdown-menu-left" style="margin-left:15px; width:290px;">
  <input type="checkbox" value ="" class="marital">
  <label for="greater">SELECT ALL</label><br>
  <input type="checkbox" id="single" name="marital" value="single" class="maritalStatus">
  <label for="single">SINGLE</label><br>
  <input type="checkbox" id="married" name="marital" value="married" class="maritalStatus">
  <label for="married">MARRIED </label><br>
  <input type="checkbox" id="divorced" name="marital" value="divorced" class="maritalStatus">
  <label for="divorced">DIVORCED</label><br>
  </div>
</div>


<div class="btn-group col-md-4" id="bank-name" style="margin-left:120px; margin-top:58px" onclick = "bankNameTest(this.id)">
  <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:290px; ">
    SELECT BANK NAME
  </button>
  <div class="dropdown-menu dropdown-menu-left" style="margin-left:15px; width:290px;">
  <input type="checkbox" value ="" class="bank">
  <label for="greater">SELECT ALL</label><br>
  <input type="checkbox" id="GTB" name="bank" value="GTB" class="bankName">
  <label for="GTB">GTB</label><br>
  <input type="checkbox" id="First Bank" name="bank" value="First Bank" class="bankName">
  <label for="First Bank">FIRST BANK </label><br>
  <input type="checkbox" id="Access Bank" name="bank" value="Access Bank" class="bankName">
  <label for="Access Bank">Access Bank</label><br>
  </div>
</div>

   
   
<div class="form-group" id="single-date" style = "margin-left:340px; margin-top:60px">
<input type="date" id="one" name="one">
<button type="button" id="submit" class="btn btn-success">OK</button>
</div>

<div class="form-group" id="between-date" style = "margin-left:340px; margin-top:40px;">
<input type="date" id="two" name="two"><br> 
AND <br> <input type="date" id="three" name="three">
<button type="button" id="submit2" class="btn btn-success" style="margin-top:-54px">OK</button>
</div>

<div class="form-group" id="name" style="margin-left:330px; margin-top:60px; width:200px;">
<input class="form-control" id="inputname" name="inputname">
<button type="button" id="submitname" class="btn btn-success" style="margin-left:210px; margin-top:-40px">OK</button>
</div> 

<div class="form-group" id="name1" style="margin-left:330px; margin-top:60px; width:200px;">
<input class="form-control" id="inputname1" name="inputname1">
<button type="button" id="submitname1" class="btn btn-success" style="margin-left:210px; margin-top:-40px">OK</button>
</div>

<div class="form-group" id="name2" style="margin-left:330px; margin-top:60px; width:200px;">
<input class="form-control" id="inputname2" name="inputname2">
<button type="button" id="submitname2" class="btn btn-success" style="margin-left:210px; margin-top:-40px">OK</button>
</div>

<div class="form-group" id="name3" style="margin-left:330px; margin-top:60px; width:200px;">
<input class="form-control" id="inputname3" name="inputname3">
<button type="button" id="submitname3" class="btn btn-success" style="margin-left:210px; margin-top:-40px">OK</button>
</div>


<div class = "" id="detailss" style="margin-left:340px; margin-top:-110px">

</div>
   
   </div>
   </div>



</div>

<div class="container row">

	
	
	







<!-- <div class="btn form-group col-md-4" id="multiple-checkbox" style="margin-top:-7px; margin-right:100px;">
	<strong>Select Employee Type:</strong>
    <select id="multiple-checkboxes" multiple="multiple">
        <option data-id="civil" value="civil servant">Civil Servant</option>
        <option data-id="political" value="political appointment">Political Appointment </option>
        <option data-id="health" value="health">Health</option>
        <option data-id="vet" value="vet">Vetinary</option>
    </select>
</div> -->


</div>








<div class = "container">
<table style="margin-top:50px; margin-left:-25px" class="table table-bordered table-striped" id="new-table">
  <thead class="thead-dark" id="new-head">
  <tr>
  <th style = "width:30%">OPTION</th>
  <th style = "width:30%">FILTER BY</th>
  <th style = "width:40%">VALUE</th>
  </tr>
   
  </thead>
  <tbody id="new-body">
   
  </tbody>
</table>
</div>

<table class="table" id="detail-table">
  <thead id="detail-head">
   
  </thead>
  <tbody id="detail-body">
   
  </tbody>
</table>

<!-- <button type="button" id="details" class="btn btn-success" style="margin-top:20px; margin-bottom:20px; margin-left:300px;">NEXT</button>  -->
   
    <script src="${js}/MultiSelect/js/jquery.multi-select.js" type="text/javascript"></script>
   <script src="${js}/singleMultiselect.js" type="text/javascript"></script>
   <script>
   
   var test = [];
   var collectId = [];
   var dispName = [];
   var server = [];
   var firstNameData = [];
   var birthDayData = [];
   var lastNameData = [];
   var emailData = [];
   var initialsData = [];
   var gsmNumberData = [];
   var bankNameValues=[];
   var maritalValues=[];
   var employeeTypeValues=[];
   var collect = [];
   var controllers = [gsmNumberData,initialsData,emailData,firstNameData,birthDayData,lastNameData,collectId,employeeTypeValues,maritalValues,bankNameValues];
  /*  var controller = [gsmNumberData,initialsData,emailData,firstNameData,birthDayData,lastNameData,collectId, values, maritalValues];
  */  var type = [];
   var type2 = [];
   var birthdate = [];
   
   function countInArray(array, what) {
	    var count = 0;
	    for (var i = 0; i < array.length; i++) {
	        if (array[i] === what) {
	            count++;
	        }
	    }
	    return count;
	}
   
   $(".empl").change(function(){
	  $(".check").prop("checked",$(this).prop("checked"));
	  var empArray = []; 
      $(".check:checked").each(function() { 
          empArray.push($(this).val()); 
      }); 
      employeeTypeValues = empArray;
      
      $('tr[id="EMPLOYEE TYPE"]').empty();
	  let currrent_col =  $('[id="EMPLOYEE TYPE"]').val();
      $('#new-body').append('<tr id = "EMPLOYEE TYPE"><td>'+currrent_col+'</td> <td>TYPE</td> <td>'+employeeTypeValues.join(' - ')+'</td></tr>');
      
	   });
   
   $(".marital").change(function(){
		  $(".maritalStatus").prop("checked",$(this).prop("checked"));
		  var maritalArray = []; 
	      $(".maritalStatus:checked").each(function() { 
	          maritalArray.push($(this).val()); 
	      }); 
	      maritalValues = maritalArray;
	      
	      $('tr[id="MARITAL STATUS"]').empty();
		  let currrent_col =  $('[id="MARITAL STATUS"]').val();
	      $('#new-body').append('<tr id = "MARITAL STATUS"><td>'+currrent_col+'</td> <td>TYPE</td> <td>'+maritalValues.join(' - ')+'</td></tr>');
	    
		   });
   
   $(".bank").change(function(){
		  $(".bankName").prop("checked",$(this).prop("checked"));
		  var bankArray = []; 
	      $(".bankName:checked").each(function() { 
	          bankArray.push($(this).val()); 
	      }); 
	      bankNameValues = bankArray;
	      
	      $('tr[id="BANK NAME"]').empty();
		  let currrent_col =  $('[id="BANK NAME"]').val();
	      $('#new-body').append('<tr id = "BANK NAME"><td>'+currrent_col+'</td> <td>TYPE</td> <td>'+bankNameValues.join(' - ')+'</td></tr>');
	    
		   });
   
   
    /* var details = document.getElementById('details');
	details.onclick = function(evt) {
	    var jsonUrl = window.contextRoot+'/multiselect';
	    $.ajax({
	        method: 'POST',
	        url: jsonUrl,
	        data:  {
	    		label: controllers
	        },
	        success : function(response) {
	        	alert(controllers);
	        },
	        error : function(e) {
	           alert('Error: ' + e);
	        }
	    });
	  };   */
	  
	  
	  /* $('.searchable').multiSelect({
	   		selectableHeader: "<input type='text' class='search-input' autocomplete='off' placeholder='try \"12\"'>",
	   	  selectionHeader: "<input type='text' class='search-input' autocomplete='off' placeholder='try \"4\"'>",
	   	  afterInit: function(ms){
	   	    var that = this,
	   	        $selectableSearch = that.$selectableUl.prev(),
	   	        $selectionSearch = that.$selectionUl.prev(),
	   	        selectableSearchString = '#'+that.$container.attr('id')+' .ms-elem-selectable:not(.ms-selected)',
	   	        selectionSearchString = '#'+that.$container.attr('id')+' .ms-elem-selection.ms-selected';

	   	    that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
	   	    .on('keydown', function(e){
	   	      if (e.which === 40){
	   	        that.$selectableUl.focus();
	   	        return false;
	   	      }
	   	    });

	   	    that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
	   	    .on('keydown', function(e){
	   	      if (e.which == 40){
	   	        that.$selectionUl.focus();
	   	        return false;
	   	      }
	   	    });
	   	  },
	   	  afterSelect: function(){
	   	    this.qs1.cache();
	   	    this.qs2.cache();
	   	  },
	   	  afterDeselect: function(){
	   	    this.qs1.cache();
	   	    this.qs2.cache();
	   	  }
	   		}); */
   
   	$('#my-select').multiSelect({
   		
		   afterSelect: function(values){
			   
		 
			   if(collectId.indexOf(values) < 0){ 
				 collectId.push(values);
        		} 
			
			   $("#dropBtn").empty();
	        	 $('#dropBtn').append('<option class="btn btn-light" style="width:300px;">- SELECT COLUMN -</option>');
	        	  for (i=0;i<collectId.length;i++) {  
	        		if (collectId[i] != undefined && countInArray(collectId, collectId[i]) == 1){	
	        		   $('#dropBtn').append('<option class="btn btn-light" data-name="' + collectId[i] + '" data-id="' + collectId[i] + '" type="button" onclick="test2(this.id)" style="width:300px;">' + collectId[i] + '</option>');
	        		   
	        		   $('#detail-body').append('<tr><td id="' + collectId[i] + '">' + collectId[i] + '</td><td></td></tr>');	
	        		}
	        		}
	        	  $('#drop').show();	 
	        	   $('#details').show();
	        	   $('#filter').show();
			   
			  }, 
			   
			  afterDeselect: function(values){
				 
				 
				  
				  /* if(collectId.indexOf("INITIALS")<0){
					  var x = controller.indexOf(initialsData);
			          controller.splice(x,1);
			   			alert(controller);
			   		} */
				  
				 /*  for (i=0;i<collectId.length;i++) { 
					  if(collectId[i] === "INITIALS"){
						  var x = controller.indexOf(initialsData);
				          controller.splice(x,1);
				          
					  }
				  } */
				  
				    /*  if(collectId.includes("EMAIL")){
			   			}else{
			   			 emailData = []; 	
				   			controller = [gsmNumberData,initialsData,emailData,firstNameData,birthDayData,lastNameData,collectId, values, maritalValues];
				   		
			   			} */
			   		
			   		  for (i=0;i<collectId.length;i++) { 
						  if(collectId[i] == values.toString() && values.toString() == "EMAIL"){
							  emailData = [];
						/* 	 var controller = [gsmNumberData,initialsData,emailData,firstNameData,birthDayData,lastNameData,collectId, values, maritalValues]; 
						 */  }
					  }   
			   			
			   			for (i=0;i<collectId.length;i++) { 
							  if(collectId[i] == values.toString() && values.toString() == "INITIALS"){
								  initialsData = [];
							/* 	 var controller = [gsmNumberData,initialsData,emailData,firstNameData,birthDayData,lastNameData,collectId, values, maritalValues]; 
							 */  }
						  }   
			   			
			   			for (i=0;i<collectId.length;i++) { 
							  if(collectId[i] == values.toString() && values.toString() == "FIRST NAME"){
								  firstNameData = [];
							/* 	 var controller = [gsmNumberData,initialsData,emailData,firstNameData,birthDayData,lastNameData,collectId, values, maritalValues]; 
						 */	  }
						  }   
			   			
			   			for (i=0;i<collectId.length;i++) { 
							  if(collectId[i] == values.toString() && values.toString() == "LAST NAME"){
								  lastNameData = [];
								/*  var controller = [gsmNumberData,initialsData,emailData,firstNameData,birthDayData,lastNameData,collectId, values, maritalValues]; 
							 */  }
						  }   
			   			
			   			for (i=0;i<collectId.length;i++) { 
							  if(collectId[i] == values.toString() && values.toString() == "GSM NUMBER"){
								  gsmNumberData = [];
								}
						  }   
			   			
			   			for (i=0;i<collectId.length;i++) { 
							  if(collectId[i] == values.toString() && values.toString() == "EMPLOYEE TYPE"){
								  employeeTypeValues = [];
								}
						  } 
			   			
			   			for (i=0;i<collectId.length;i++) { 
							  if(collectId[i] == values.toString() && values.toString() == "MARITAL STATUS"){
								  maritalValues = [];
								}
						  } 
			   			
			   			for (i=0;i<collectId.length;i++) { 
							  if(collectId[i] == values.toString() && values.toString() == "BANK NAME"){
								  bankNameValues = [];
								}
						  } 
			   			
					  for (i=0;i<collectId.length;i++) { 
						  if(collectId[i] == values.toString()){
							  delete(collectId[i]);
							  }
					  }
					  
					   var controller = [gsmNumberData,initialsData,emailData,firstNameData,birthDayData,lastNameData,collectId,employeeTypeValues,maritalValues,bankNameValues]; 
					  controllers.splice(0, 9, controller); 
					  /* var controller = [gsmNumberData,initialsData,emailData,firstNameData,birthDayData,lastNameData,collectId, values, maritalValues]; 
					 */  
			  
				  
				  
				  $("#dropBtn").empty();
		        	 $('#dropBtn').append('<option class="btn btn-light" style="width:300px;">- SELECT COLUMN -</option>');
		        	  for (i=0;i<collectId.length;i++) {
		        		if (collectId[i] != undefined && countInArray(collectId, collectId[i]) == 1){	
		        		   $('#dropBtn').append('<option class="btn btn-light" id="' + collectId[i] + '" data-name="' + collectId[i] + '" data-id="' + collectId[i] + '" type="button" onclick="test900(this.id)" style="width:300px;">' + collectId[i] + '</option>');
		        		   
		        		   $('#detail-body').append('<tr><td id="' + collectId[i] + '">' + collectId[i] + '</td><td></td></tr>');
		        			
		        		}
		        		}
		        	  $('#drop').show();	 
		        	   $('#details').show();
		        	   $('#filter').show();
				  
		        	   
		        	   
		        	   for (i=0;i<collectId.length;i++) { 	
				   if(collectId.indexOf(values) == -1){
					  $('tr[id="'+values+'"]').empty();
					  $('#first-name').hide();
					  $('#name').hide();
					  $('#detailss').hide();
					  $('#birthdayss').hide();
					  $('#single-date').hide();
					  $('#between-date').hide();
					  $('#last-name').hide();
					  $('#emptype').hide();
					  $('#marital').hide();
					  $('#bank-name').hide();
				  } 
		        	   }
			  } 
	});
   
   	$('#select-all').click(function(){
  	$('#my-select').multiSelect('select_all');
  			return false;
		});
	$('#deselect-all').click(function(){
  	$('#my-select').multiSelect('deselect_all');
  			return false;
		});

	   
	   $('#details').hide();
	   $('#drop').hide();
	   $('#mydate').hide();
	   $('#birthdayss').hide();
	   $('#multiple-checkbox').hide();
	   $('#detail-table').hide();
	   $('#single-date').hide();
	   $('#between-date').hide();
	   $('#first-name').hide();
	   $('#name').hide();
	   $('#filter').hide();
	   $('#new-table').hide();
	   $('#emptype').hide();
	   $('#last-name').hide(); 
	   $('#marital').hide();
	   $('#bank-name').hide();
	   $('#name1').hide();
	   $('#name2').hide();
	   $('#name3').hide();
	   $('#email').hide();
	   $('#initials').hide();
	   $('#gsm-number').hide();
	   $('#filter-section').hide();
	   
	 
	   
	  
	    $('#dropBtn').change(function(){
		   console.log("checking...");
		   let option = $("#dropBtn option:selected");
		   var aa = option.data('name');
		   var bb = option.data('id');
		   console.log("selected option: "+aa +"selected  id: "+bb)
		   type2.splice(0, 1, bb);
		   
		   
		   if(test.indexOf(aa) === -1){
			   test.push(aa);
	         } 	
		   
		   if (aa === "BIRTHDAY"){
			   $('#detailss').empty();
			   $('#filter-section').show();
        	   $('#birthdayss').show(); 
        	   $('#name').hide();
        	   $('#name2').hide();
        	   $('#name1').hide();
        	   $('#name3').hide();
        	   if($('#birthdayss').show()){
        		   $('#multiple-checkbox').hide(); 
        		   $('#first-name').hide();
        		   $('#name').hide();
        		   $('#emptype').hide(); 
        		   $('#last-name').hide(); 
        		   $('#marital').hide();
        		   $('#bank-name').hide();
        		   $('#email').hide();
        		   $('#initials').hide();
        		   $('#gsm-number').hide();
        	   } 
		   }		  
		   else if (aa === "FIRST NAME"){
			   $('#detailss').empty();
			   $('#filter-section').show();
        	   $('#first-name').show(); 
        	   $('#name').hide();
        	   $('#name2').hide();
        	   $('#name1').hide();
        	   $('#name3').hide();
        	   if($('#first-name').show()){
        		   $('#birthdayss').hide();
        		   $('#single-date').hide();
        		   $('#between-date').hide();
        		   $('#emptype').hide(); 
        		   $('#last-name').hide();
        		   $('#marital').hide();
        		   $('#bank-name').hide();
        		   $('#email').hide();
        		   $('#initials').hide();
        		   $('#gsm-number').hide();
        	   }
			   
		   }else if(aa === "EMPLOYEE TYPE"){
			   $('#emptype').show();
			   $('#filter-section').show();
        	   $('#detailss').empty();
        	   if($('#emptype').show()){
        		   $('#birthdayss').hide();
        		   $('#single-date').hide();
        		   $('#between-date').hide();
        		   $('#first-name').hide();
        		   $('#name').hide();
        		   $('#last-name').hide();
        		   $('#marital').hide(); 
        		   $('#bank-name').hide();
        		   $('#email').hide();
        		   $('#initials').hide();
        		   $('#gsm-number').hide();
        	   }
		   }else if(aa === "BANK NAME"){
			   $('#bank-name').show(); 
			   $('#filter-section').show();
        	   $('#detailss').empty();
        	   if($('#bank-name').show()){
        		   $('#birthdayss').hide();
        		   $('#single-date').hide();
        		   $('#between-date').hide();
        		   $('#first-name').hide();
        		   $('#name').hide();
        		   $('#last-name').hide();
        		   $('#emptype').hide();
        		   $('#marital').hide();
        		   $('#email').hide();
        		   $('#initials').hide();
        		   $('#gsm-number').hide();
        	   }
		   }else if(aa === "MARITAL STATUS"){
			   $('#marital').show(); 
			   $('#filter-section').show();
        	   $('#detailss').empty();
        	   
        	   if($('#marital').show()){
        		   $('#birthdayss').hide();
        		   $('#single-date').hide();
        		   $('#between-date').hide();
        		   $('#first-name').hide();
        		   $('#name').hide();
        		   $('#last-name').hide();
        		   $('#emptype').hide();
        		   $('#bank-name').hide();
        		   $('#email').hide();
        		   $('#initials').hide();
        		   $('#gsm-number').hide();
        	   }
		   }else if(aa === "LAST NAME"){
			   $('#detailss').empty();
			   $('#filter-section').show();
        	   $('#last-name').show(); 
        	   $('#name').hide();
        	   $('#name').hide();
        	   $('#name2').hide();
        	   $('#name1').hide();
        	   $('#name3').hide();
        	   if($('#last-name').show()){
        		   $('#birthdayss').hide();
        		   $('#single-date').hide();
        		   $('#between-date').hide();
        		   $('#emptype').hide(); 
        		   $('#first-name').hide(); 
        		   $('#marital').hide();
        		   $('#bank-name').hide();
        		   $('#email').hide();
        		   $('#initials').hide();
        		   $('#gsm-number').hide();
        	   }    
		   }else if(aa === "GSM NUMBER"){
			   $('#detailss').empty();
			   $('#filter-section').show();
        	   $('#gsm-number').show(); 
        	   $('#name').hide();
        	   $('#name2').hide();
        	   $('#name1').hide();
        	   $('#name3').hide();

        	   if($('#gsm-number').show()){
        		   $('#birthdayss').hide();
        		   $('#single-date').hide();
        		   $('#between-date').hide();
        		   $('#emptype').hide(); 
        		   $('#first-name').hide(); 
        		   $('#marital').hide();
        		   $('#bank-name').hide();
        		   $('#email').hide();
        		   $('#initials').hide();
        		   $('#last-name').hide();
        	   }
		   }else if(aa === "EMAIL"){
			   $('#detailss').empty();
			   $('#filter-section').show();
        	   $('#email').show(); 
        	   $('#name').hide();
        	   $('#name2').hide();
        	   $('#name1').hide();
        	   $('#name3').hide();

        	   if($('#email').show()){
        		   $('#birthdayss').hide();
        		   $('#single-date').hide();
        		   $('#between-date').hide();
        		   $('#emptype').hide(); 
        		   $('#first-name').hide(); 
        		   $('#marital').hide();
        		   $('#bank-name').hide();
        		   $('#last-name').hide(); 
        		   $('#gsm-number').hide();
        		   $('#initials').hide();
        	   }
		   }else if(aa === "INITIALS"){
			   $('#detailss').empty();
			   $('#filter-section').show();
        	   $('#initials').show(); 
        	   $('#name').hide();
        	   $('#name2').hide();
        	   $('#name1').hide();
        	   

        	   if($('#initials').show()){
        		   $('#birthdayss').hide();
        		   $('#single-date').hide();
        		   $('#between-date').hide();
        		   $('#emptype').hide(); 
        		   $('#first-name').hide(); 
        		   $('#marital').hide();
        		   $('#bank-name').hide();
        		   $('#last-name').hide(); 
        		   $('#gsm-number').hide();
        		   $('#last-name').hide();
        		   $('#email').hide();
        	   }
		   }
		   
		  console.log(test);
	   });
	   
	   var temp = temp + 1;
	   function test2(clickedID){
		   	
		    if(clickedID == "greater" || clickedID == "less" || clickedID == "less-equal" || clickedID == "greater-equal"){
		    	if(clickedID == "greater"){
		    		$('#detailss').show();
		    		$('#detailss').empty();
		    	$('#detailss').append('<strong>Greater Than</strong>');
		    	}
		    	
		    	if(clickedID == "less"){
		    		$('#detailss').show();
		    		$('#detailss').empty();
		    		$('#detailss').append('<strong>Less Than</strong>');
			    	}
		    	
		    	if(clickedID == "less-equal"){
		    		$('#detailss').show();
		    		$('#detailss').empty();
		    		$('#detailss').append('<strong>Less Than or Equal to</strong>');
			    	}
		    	
		    	if(clickedID == "greater-equal"){
		    		$('#detailss').show();
		    		$('#detailss').empty();
		    		$('#detailss').append('<strong>Greater Than or Equal to</strong>');
			    	}
		    	
		    	$('#submit').on('click', function(){
		    		 var date = new Date($('#one').val());
		    		day = date.getDate();
		    		month = date.getMonth() + 1;
		    		year = date.getFullYear();
		    		singlebirth = clickedID + " " + [day, month, year].join('/');
		    		
		    			birthdate.splice(0, 1, singlebirth);
		    			
		    			$('tr[id="BIRTHDAY"]').empty();
		    			
			 					let currrent_col =  $("#BIRTHDAY").val();
			 					let currrent_filter_by =  $("#BIRTHDAY").val();
			 					if($('#one').val() != null){
		    		let current_val = $('#one').val();
		    		let cred = {
		       				"options":"BIRTHDAY",
		       				"filterBy": clickedID,
		       				"value": current_val
		       		};
		    		
		    		birthDayData.splice(0, 1, singlebirth);
		    		
		    		$('#new-body').append('<tr id ="BIRTHDAY"><td>'+currrent_col+'</td> <td>'+clickedID+'</td> <td>'+current_val+'</td></tr>');
		    	}		   	
		    	});
		    		$('#between-date').hide();
		    		$('#single-date').show(); 
		    		$('#name2').hide();
				   $('#name1').hide();
				   $('#name').hide();
				   $('#name3').hide();
		    }
		    	
		  
		    if(clickedID == "between"){
		    	if(clickedID == "between"){
		    		$('#detailss').empty();
		    		$('#detailss').append('<strong>Select date Range</strong>');
			    	}
		    	
		    	$('#submit2').on('click', function(){
		    		var date2 = new Date($('#two').val());
		    		day2 = date2.getDate();
		    		month2 = date2.getMonth() + 1;
		    		year2 = date2.getFullYear();
		    		
		    		var date3 = new Date($('#three').val());
		    		day3 = date3.getDate();
		    		month3 = date3.getMonth() + 1;
		    		year3 = date3.getFullYear();
		    		
		    		birthday = clickedID + " " + [day2, month2, year2].join('/') + " and " + [day3, month3, year3].join('/');
		    		
		    			birthdate.splice(0, 1, birthday);
		    			
		    			$('tr[id="BIRTHDAY"]').empty();
		 					   
		 					  let currrent_col =  $("#BIRTHDAY").val();
		 					 if($('#two').val() != null && $('#three').val() != null){
		    		let current_val1 = $('#two').val();
		    		let current_val2 = $('#three').val();
		    		
		    		let cred = {
		       				"options":"BIRTHDAY",
		       				"filterBy": clickedID,
		       				"value": current_val1+' AND '+current_val2
		       		};
		    		
		    		birthDayData.splice(0, 1, birthday);
		    		
		    		$('#new-body').append('<tr id = "BIRTHDAY"><td>'+currrent_col+'</td> <td>'+ clickedID +'</td> <td>'+current_val1+' AND '+current_val2+'</td> </tr>');
		 	        	    
		    	};
		    	
		    });
		    	$('#between-date').show();
		    	$('#single-date').hide();
		    }
		    
		    
		    if(clickedID == "similar" || clickedID == "equal"){
		    	$('#name').show();
		    	if(clickedID == "similar"){
		    		$('#detailss').show();
		    		$('#detailss').empty();
		    	$('#detailss').append('<strong>Similar to</strong>');
		    	}
		    	
		    	if(clickedID == "equal"){
		    		$('#detailss').show();
		    		$('#detailss').empty();
		    		$('#detailss').append('<strong>Equal to</strong>');
			    	}
		    	
		    	$('#submitname').on('click', function(){
		    		
		    		birthdate.splice(0, 1, $('#inputname').val());
	    			
	    			
	    			
	 					  $('tr[id="FIRST NAME"]').empty();
	 					  let currrent_col =  $('[id="FIRST NAME"]').val();
		 					if($('#inputname').val() != null){
	    		let current_val = $('#inputname').val();
	    		let serverData = "FIRST NAME" + clickedID + " to " + current_val;
	    		
	    		let cred = {
	       				"options":"FIRST NAME",
	       				"filterBy": clickedID,
	       				"value": current_val
	       		};
	    		
	    		firstNameData.splice(0, 1, serverData);
	    		
	    		$('#new-body').append('<tr id = "FIRST NAME"><td>'+currrent_col+'</td> <td>'+clickedID+'</td> <td>'+current_val+'</td></tr>');
	    	}
		    	});
		    }
	   }
	 			
	   
	   function lastname(clickedID){
		   if(clickedID == "similar" || clickedID == "equal"){
			   $('#name1').show();
			   $('#name').hide();
			   $('#name2').hide();
			   $('#name3').hide();
		    	if(clickedID == "similar"){
		    		$('#detailss').show();
		    		$('#detailss').empty();
		    	$('#detailss').append('<strong>Similar to</strong>');
		    	}
		    	
		    	if(clickedID == "equal"){
		    		$('#detailss').show();
		    		$('#detailss').empty();
		    		$('#detailss').append('<strong>Equal to</strong>');
			    	}
		    	
					$('#submitname1').on('click', function(){
		    		
		    		birthdate.splice(0, 1, $('#inputname1').val());
	    			
		 					  $('tr[id="LAST NAME"]').empty();
		 					  let currrent_col1 =  $('[id="LAST NAME"]').val();
			 					if($('#inputname1').val() != null){
		    		let current_val1 = $('#inputname1').val();
		    		let serverData1 = "LAST NAME" + clickedID + " to " + current_val1
		    		
		    		let cred = {
		       				"options":"LAST NAME",
		       				"filterBy": clickedID,
		       				"value": current_val1
		       		};
		    		
		    		lastNameData.splice(0, 1, serverData1);
		    	
		    		$('#new-body').append('<tr id = "LAST NAME"><td>'+currrent_col1+'</td> <td>'+clickedID+'</td> <td>'+current_val1+'</td></tr>');
		    	}
						});
		    }
		   
	   }
	   
	   
	   function email(clickedID){
		   if(clickedID == "similar" || clickedID == "equal"){
			   $('#name2').show(); 
			   $('#name1').hide();
			   $('#name').hide();
			   $('#name3').hide();
		    	if(clickedID == "similar"){
		    		$('#detailss').show();
		    		$('#detailss').empty();
		    	$('#detailss').append('<strong>Similar to</strong>');
		    	}
		    	
		    	if(clickedID == "equal"){
		    		$('#detailss').show();
		    		$('#detailss').empty();
		    		$('#detailss').append('<strong>Equal to</strong>');
			    	}
		    	
					$('#submitname2').on('click', function(){
		    		
		    		birthdate.splice(0, 1, $('#inputname2').val());
	    			
		    		$('tr[id="EMAIL"]').empty();
					  let currrent_col2 =  $('[id="EMAIL"]').val();
	 					if($('#inputname2').val() != null){
  		let current_val2 = $('#inputname2').val();
  		
  		let serverData2 = "EMAIL" + clickedID + " to " + current_val2
  		
  		let cred = {
   				"options":"EMAIL",
   				"filterBy": clickedID,
   				"value": current_val2
   		};
  		
  		emailData.splice(0, 1, serverData2);
  	
  		$('#new-body').append('<tr id = "EMAIL"><td>'+currrent_col2+'</td> <td>'+clickedID+'</td> <td>'+current_val2+'</td></tr>');
  }
						});
		    }
	   }
	   
	   
	   function init(clickedID){
		   if(clickedID == "similar" || clickedID == "equal"){
			   $('#name3').show();
			   $('#name1').hide();
			   $('#name').hide();
			   $('#name2').hide();
		    	if(clickedID == "similar"){
		    		$('#detailss').show();
		    		$('#detailss').empty();
		    	$('#detailss').append('<strong>Similar to</strong>');
		    	}
		    	
		    	if(clickedID == "equal"){
		    		$('#detailss').show();
		    		$('#detailss').empty();
		    		$('#detailss').append('<strong>Equal to</strong>');
			    	}
		    	
					$('#submitname3').on('click', function(){
		    		
		    		birthdate.splice(0, 1, $('#inputname3').val());
	    			
		    		 $('tr[id="INITIALS"]').empty();
					  var currrent_col3 =  $('[id="INITIALS"]').val();
	 					if($('#inputname3').val() != null){
   		var current_val3 = $('#inputname3').val();
   		
   		var serverData3 = "INITIALS" + clickedID + " to " + current_val3
   		let cred = {
   				"options":"INITIALS",
   				"filterBy": clickedID,
   				"value": current_val3
   		};
   		initialsData.splice(0, 1, serverData3);
   		
   		$('#new-body').append('<tr id = "INITIALS"><td>'+currrent_col3+'</td> <td>'+clickedID+'</td> <td>'+current_val3+'</td> </tr>');
   	 			console.log(initialsData);
	 					}
						});
		    }   
	   }   
	   
	   function gsmNumber(clickedID){
		   if(clickedID == "similar" || clickedID == "equal"){
			   $('#name3').show();
			   $('#name1').hide();
			   $('#name').hide();
			   $('#name2').hide();
		    	if(clickedID == "similar"){
		    		$('#detailss').show();
		    		$('#detailss').empty();
		    	$('#detailss').append('<strong>Similar to</strong>');
		    	
		    	}
		    	
		    	if(clickedID == "equal"){
		    		$('#detailss').show();
		    		$('#detailss').empty();
		    		$('#detailss').append('<strong>Equal to</strong>');
			    	}
		    	
					$('#submitname3').on('click', function(){
		    		
		    		birthdate.splice(0, 1, $('#inputname3').val());
	    			
		    		$('tr[id="GSM NUMBER"]').empty();
					  let currrent_col4 =  $('[id="GSM NUMBER"]').val();
	 					if($('#inputname').val() != null){
  		let current_val4 = $('#inputname').val();
  		
  		let cred = {
   				"options":"GSM NUMBER",
   				"filterBy": clickedID,
   				"value": current_val4
   		};
  		
  		let serverData4 = "GSM NUMBER" + clickedID + " to " + current_val4
  		gsmNumberData.splice(5, 1, serverData4);
  		
  		$('#new-body').append('<tr id = "GSM NUMBER"><td>'+currrent_col4+'</td> <td>'+clickedID+'</td> <td>'+current_val4+'</td></tr>');
   	 }
						});
		    }
		   
	   }
		   
	   
		    	
						/* $('#submitname1').on('click', function(){
		    		
		    		birthdate.splice(0, 1, $('#inputname1').val());
	    			
		 					  $('tr[id="LAST NAME"]').empty();
		 					  let currrent_col1 =  $('[id="LAST NAME"]').val();
			 					if($('#inputname1').val() != null){
		    		let current_val1 = $('#inputname1').val();
		    		let serverData1 = "LAST NAME" + clickedID + " to " + current_val
		    		server[2] = serverData1
		    		server.splice(2, 1, server[2]);
		    		alert(server); 
		    		$('#new-body').append('<tr id = "LAST NAME"><td>'+currrent_col1+'</td> <td>'+clickedID+'</td> <td>'+current_val1+'</td></tr>');
		    	}
						});			
	    			
	    			
		 					  $('tr[id="EMAIL"]').empty();
		 					  let currrent_col2 =  $('[id="EMAIL"]').val();
			 					if($('#inputname').val() != null){
		    		let current_val2 = $('#inputname').val();
		    		
		    		let serverData2 = "EMAIL" + clickedID + " to " + current_val
		    		server[3] = serverData2
		    		server.splice(3, 1, server[3]);
		    		alert(server); 
		    		$('#new-body').append('<tr id = "EMAIL"><td>'+currrent_col2+'</td> <td>'+clickedID+'</td> <td>'+current_val2+'</td></tr>');
		    	}
			 				
	    		
		 					  $('tr[id="INITIALS"]').empty();
		 					  let currrent_col3 =  $('[id="INITIALS"]').val();
			 					if($('#inputname').val() != null){
		    		let current_val3 = $('#inputname').val();
		    		
		    		let serverData3 = "INITIALS" + clickedID + " to " + current_val
		    		server[4] = serverData3
		    		server.splice(4, 1, server[4]);
		    		alert(server); 
		    		$('#new-body').append('<tr id = "INITIALS"><td>'+currrent_col3+'</td> <td>'+clickedID+'</td> <td>'+current_val3+'</td></tr>');
		    	}
			 				
		 					  $('tr[id="GSM NUMBER"]').empty();
		 					  let currrent_col4 =  $('[id="GSM NUMBER"]').val();
			 					if($('#inputname').val() != null){
		    		let current_val4 = $('#inputname').val();
		    		
		    		let serverData4 = "GSM NUMBER" + clickedID + " to " + current_val
		    		server[5] = serverData4
		    		server.splice(5, 1, server[5]);
		    		alert(server); 
		    		$('#new-body').append('<tr id = "GSM NUMBER"><td>'+currrent_col4+'</td> <td>'+clickedID+'</td> <td>'+current_val4+'</td></tr>');
		    	}
			 			
		    	});
		    	
		    	$('#name').show();
		    }
		  } */
	   
	   $('#my-select').change(function(){
		   var dew = $(this).val();
		   let option = $("#my-select option:selected");
		   var ff = option.data('dd');
		   var mim = option.data('my');
		   dispName.push(ff)
		   type.push(mim)   
	   });
	   
	   function testme(clickedID){
		   if(clickedID == "birthdayss"){
			   $('#new-table').show();
		   }
	   }
	   
	   function ntest(clickedID){
		   if(clickedID == "first-name"){
			   $('#new-table').show();
		   }
	   }
	   
	   function newtest(clickedID){
			   $('#new-table').show();
	   }
	   
	   function last(clickedID){
		 if(clickedID == "LAST NAME"){
			 
		 }
   }
	   
	   
	   function maritalTest(clickedID){
		   if(clickedID == "marital"){
			   $('#new-table').show();
		   }
	   }
	   
	   function bankNameTest(clickedID){
		   if(clickedID == "bank-name"){
			   $('#new-table').show();
		   }
	   }
	   
	   function testing(clickedID){
		   if(clickedID == "emptype"){
			   $('#new-table').show();
		   }
	   }
	   
	   function approw(clickedID){
		   if(clickedID == "submit"){
			   $('#new-body').append('<tr><td>' + collectId[i] + '</td><td></td></tr>');
		   }
	   }
	   
	   
	   

	   $(".check").change(function(){
	       if($(this).is(":checked"))
	    	   employeeTypeValues.push($(this).val());
	       else{
	          var x = employeeTypeValues.indexOf($(this).val());
	          employeeTypeValues.splice(x,1);
	       }
	       
	       $('tr[id="EMPLOYEE TYPE"]').empty();
				  let currrent_col =  $('[id="EMPLOYEE TYPE"]').val();
		$('#new-body').append('<tr id = "EMPLOYEE TYPE"><td>'+currrent_col+'</td> <td>TYPE</td> <td>'+employeeTypeValues.join(' - ')+'</td></tr>');      
	   });
	     
	   

	   $(".maritalStatus").change(function(){
	       if($(this).is(":checked"))
	          maritalValues.push($(this).val());
	       else{
	          var x = maritalValues.indexOf($(this).val());
	          maritalValues.splice(x,1);
	       }
	       
	       $('tr[id="MARITAL STATUS"]').empty();
			
				  let currrent_col =  $('[id="MARITAL STATUS"]').val();
					
	
		$('#new-body').append('<tr id = "MARITAL STATUS"><td>'+currrent_col+'</td> <td>STATUS</td> <td>'+maritalValues.join(' - ')+'</td></tr>');
		   });
	   
	   
	   

	   $(".bankName").change(function(){
	       if($(this).is(":checked"))
	          bankNameValues.push($(this).val());
	       else{
	          var x = bankNameValues.indexOf($(this).val());
	          bankNameValues.splice(x,1);
	       }
	      
	       $('tr[id="BANK NAME"]').empty();
			
				  let currrent_col =  $('[id="BANK NAME"]').val();
		$('#new-body').append('<tr id ="BANK NAME"><td>'+currrent_col+'</td> <td>NAME</td> <td>'+bankNameValues.join(' - ')+'</td></tr>');
			  
	   });
	  
	   
</script>

<script src="${js}/ajaxCsrf.js"></script>
</body>
</html>