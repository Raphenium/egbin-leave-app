<!-- DataTable Bootstrap Script -->
<script src="${js}/angular.js"></script>

<!-- DataTable Bootstrap Script -->
<script src="${js}/productsController.js"></script>
<div class="container" ng-app="ShoppingApp" ng-controller="ProductController as pCtrl" >

	<div class="row" ng-init="pCtrl.fetchProducts()">

		<div class="col-md-3">
			<%@include file="./shared/sidebar.jsp"%>
		</div>

		<div class="col-md-9">

			<div class="row carousel-holder">

				<div class="col-md-12">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							<li data-target="#carousel-example-generic" data-slide-to="3"></li>
						</ol>
						<div class="carousel-inner">
							
							<div class="item active">
								<img class="slide-image" src="${images}/banner1.jpg"
									alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="${images}/banner2.jpg"
									alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="${images}/banner3.jpg"
									alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="${images}/banner4.jpg"
									alt="">
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				</div>

			</div>

				<div class="row">
                	<div class="col-xs-12">
                		<h3>LEAVE APPLICATION FOR EGBIN POWER STATION</h3>
                		<hr/>
                	</div>
                </div>

                
				
				<div class="row">
                	<div class="col-xs-12">
                		<h3>YOU CAN REQUEST FOR LEAVE AND ADMIN CAN MANAGE STAFF WITH THIS APP</h3>
                		<hr/>
                	</div>
                </div>
               <div class="row is-table-row">
                	
                   
                   

                </div>

		</div>

	</div>

</div>
<!-- /.container -->
