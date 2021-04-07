<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="container">

	<c:if test="${not empty message}">	
		<div class="row">			
			<div class="col-xs-12 col-md-offset-2 col-md-8">			
				<div class="alert alert-info fade in">${message}</div>				
			</div>
		</div>
	</c:if>

	<hr/>	
	<h1>LEAVE HISTORY</h1>
	<hr/>
	
	<div class="row">
				
		
		<div class='col-xs-12'>
		
		
			<table id="leaveHistory" class="table table-condensed table-bordered">
							
				<thead>					
					<tr>	
						<th>First Name</th>	
						<th>Last Name</th>			
						<th>Start Date</th>
						<th>End Date</th>
						<th>Resumption Date</th>	
						<th>Status</th>
						
					</tr>					
				</thead>
				
				<tfoot>
					<tr>					
						<th>First Name</th>	
						<th>Last Name</th>			
						<th>Start Date</th>
						<th>End Date</th>
						<th>Resumption Date</th>	
						<th>Status</th>
					</tr>									
				</tfoot>
				
							
			</table>
		
		
		</div>
	
	
	</div>

</div>