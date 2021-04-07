<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="container">

	<c:if test="${not empty message}">	
		<div class="row">			
			<div class="col-xs-12 col-md-offset-2 col-md-8">			
				<div class="alert alert-info fade in">${message}</div>				
			</div>
		</div>
	</c:if>

	<div class="row">

		<div class="col-md-offset-2 col-md-8">

			<div class="panel panel-primary">

				<div class="panel-heading">

					<h4>Staff Management</h4>

				</div>

				<div class="panel-body">
					<sf:form class="form-horizontal" modelAttribute="product" action="${contextRoot}/manageStaff/product" method="POST">
						<div class="form-group">
							<label class="control-label col-md-4">First Name</label>
							<div class="col-md-8">
								<sf:input type="text" path="firstName" class="form-control"
									placeholder="Staff First Name" />
								<sf:errors path="firstName" cssClass="help-block" element="em"/> 
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4">Last Name</label>
							<div class="col-md-8">
								<sf:input type="text" path="lastName" class="form-control"
									placeholder="Staff Last Name" /> 
								<sf:errors path="lastName" cssClass="help-block" element="em"/>	
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Sick Leave Entitled to</label>
							<div class="col-md-8">
								<sf:input type="number" path="sickLeaveBallance" class="form-control"
									placeholder="Default Sick Leave is 10 days" />
								<sf:errors path="sickLeaveBallance" cssClass="help-block" element="em"/>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Exam Leave Entitled to</label>
							<div class="col-md-8">
								<sf:input type="number" path="examLeaveBallance" class="form-control"
									placeholder="Default Exam Leave is 5 days" />
								<sf:errors path="examLeaveBallance" cssClass="help-block" element="em"/> 
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4">Annual Leave Entitled to</label>
							<div class="col-md-8">
								<sf:input type="number" path="annualLeaveBallance" class="form-control"
									placeholder="Default Annual Leave is 20 days" />
								<sf:errors path="annualLeaveBallance" cssClass="help-block" element="em"/> 
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Level</label>
							<div class="col-md-8">
								<sf:input type="number" path="level" class="form-control"
									placeholder="Default level is 0" />
								<sf:errors path="level" cssClass="help-block" element="em"/> 
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-4">Assign Line Manager</label>
							<div class="col-md-8">
								<sf:select path="managerId" items="${lineManagers}" itemLabel="firstName" itemValue="id" class="form-control"/>							
								<sf:hidden path="id"/>
							</div>
							
						</div>


					
						<div class="form-group">
							
							<div class="col-md-offset-4 col-md-4">
							
								<input type="submit" name="submit" value="Save" class="btn btn-primary"/>
								
							</div>
						</div>						
										
					</sf:form>

				</div>

			</div>

		</div>

	</div>
	
	<hr/>	
	<h1>All Staff</h1>
	<hr/>
	
	<div class="row">
				
		
		<div class='col-xs-12'>
		
		
			<table id="staffTable" class="table table-condensed table-bordered">
							
				<thead>					
					<tr>					
						<th>First Name</th>
						<th>Last Name</th>
						<th>Annual Leave Bal</th>
						<th>Sick Leave Bal</th>
						<th>Exam Leave Bal</th>
						<th>Edit</th>	
						<th>Delete</th>	
					</tr>					
				</thead>
				
				<tfoot>
					<tr>					
						<th>First Name</th>
						<th>Last Name</th>
						<th>Annual Leave Bal</th>
						<th>Sick Leave Bal</th>
						<th>Exam Leave Bal</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>									
				</tfoot>
				
							
			</table>
		
		
		</div>
	
	
	</div>

</div>