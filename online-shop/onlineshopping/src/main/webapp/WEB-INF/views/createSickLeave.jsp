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

					<h4>Create Sick Leave</h4>

				</div>

				<div class="panel-body">
					<sf:form class="form-horizontal" modelAttribute="product" action="${contextRoot}/manageStaff/${2}/update" method="POST">
						

						<div class="form-group">
							<label class="control-label col-md-4">Level</label>
							<div class="col-md-8">
								<sf:input type="number" path="days" class="form-control"
									placeholder="Default level is 0" />
								<sf:errors path="days" cssClass="help-block" element="em"/> 
							</div>
						</div>


						<div class="form-group col-md-4" style = "margin-left:0px; margin-top:30px">
						<label class="control-label">Start Date</label>
						<sf:input path="startDate" type="date" />
						</div>
						
						<div class="form-group col-md-4" style = "margin-left:10px; margin-top:30px">
						<label class="control-label">End Date</label>
						<sf:input path="endDate" type="date" />
						</div>
						
						<div class="form-group col-md-4" style = "margin-left:10px; margin-top:30px; margin-bottom:30px">
						<label class="control-label">Resumption Date</label>
						<sf:input path="resumptionDate" type="date" />
					
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


</div>
