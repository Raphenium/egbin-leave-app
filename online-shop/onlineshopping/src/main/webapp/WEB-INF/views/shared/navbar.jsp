<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
	<script>
		window.userRole = '${userModel.role}';
	</script>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${contextRoot}/home">Egbin Plc</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                
                
                    
                    <li class="dropdown" id="userModel">
						  <a class="btn btn-default dropdown-toggle" href="javascript:void(0)" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						    Request Leave
						    <span class="caret"></span>
						  </a>
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
		                    
			                    <li id="cart">
			                        <a href="${contextRoot}/manageStaff/annualLeave">
			                        	Annual Leave
			                        </a>
			                    </li>		     
			                	<li role="separator" class="divider"></li>	
			                	
			                	<li id="cart">
			                        <a href="${contextRoot}/manageStaff/sickLeave">
			                        	Sick Leave
			                        </a>
			                    </li>		     
			                	<li role="separator" class="divider"></li>                                   
		                    
							<li id="logout">
		                        <a href="${contextRoot}/manageStaff/examLeave">Exam Leave</a>
		                    </li>                    			    	
						  </ul>		
						</li>   
						
						<li id="leaveHis">
	                        <a href="${contextRoot}/manageStaff/leaveHistory">Leave History</a>
	                    </li>
                    
                    
					<security:authorize access="hasAuthority('ADMIN')">
	                    <li id="manageProduct">
	                        <a href="${contextRoot}/manageStaff/product">Manage Staff</a>
	                    </li>		
	                    
	                    <li id="manageLeave">
	                        <a href="${contextRoot}/manageStaff/approval">Approval History</a>
	                    </li>				
					</security:authorize>
                </ul>
			    
			    <ul class="nav navbar-nav navbar-right">
			    	<security:authorize access="isAnonymous()">
	                    <li id="signup">
	                        <a href="${contextRoot}/membership">Sign Up</a>
	                    </li>
						<li id="login">
	                        <a href="${contextRoot}/login">Login</a>
	                    </li> 			    	
			    	</security:authorize>
			    	<security:authorize access="isAuthenticated()">
						<li class="dropdown" id="userModel">
						  <a class="btn btn-default dropdown-toggle" href="javascript:void(0)" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						    ${userModel.fullName}
						    <span class="caret"></span>
						  </a>
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
		                    
							<li id="logout">
		                        <a href="${contextRoot}/logout">Logout</a>
		                    </li>                    			    	
						  </ul>		
						</li>    			    
			    	</security:authorize>                    
			    </ul>                
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

