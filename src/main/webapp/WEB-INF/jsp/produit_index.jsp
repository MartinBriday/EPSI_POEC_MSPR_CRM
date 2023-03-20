<!DOCTYPE html>
<html>
	<style>
		table {
		  width: 100%;
		  border-collapse: collapse;
		}
		table, th, td {
		  border: 1px solid black;
		}
		thead {
		  background-color: cadetblue;
		  color: #ffffff;
		}
		th {
		  text-align: center;
		  height: 50px;
		}
		tbody tr:nth-child(odd) {
		  background: #ffffff;
		}
		tbody tr:nth-child(even) {
		  background: #f4f4f4;
		}
	  </style>
 
<div class="loop-wrapper">
	<div class="mountain"></div>
	<div class="hill"></div>
	<div class="tree"></div>
	<div class="tree"></div>
	<div class="tree"></div>
	<div class="rock"></div>
	<div class="truck"></div>
	<div class="wheels"></div>
  </div> 
	

  <div class="textt" style="font-size: 50px;/*! top: ; *//*! margin-top: ; */position: absolute;top: 30px;/*! text-decoration: underline overline #FF3028; *//*! text-underline-offset: 20px; */color: darkcyan;">ACME</div>


	  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

	<link href="css/common.css" rel="stylesheet">

  </head>
</br>
&nbsp;
  <body>

    <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<table class="tab" id="produit-table" >
			
				<thead>
					<div class="toolbar">
						<a href ="client.html" class="btn btn-primary "> Client </a>
    					<a><button class="btn btn-primary add-button-prod bn53">Produit  </button></a>
						<a href="commande.html"><button class="btn btn-primary "> Commande </button></a>
    					<button class="btn btn-primary "> Statistique </button>
    					
					</div>
					
				</br>
				<a href="#" role="button" class="btn btn-primary add-button  ">Ajouter Produit</a>
			
			<div class="modal fade " id="produit-modal" tabindex="-1" aria-labelledby="modal-header">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="modal-title">
								Produit
							</h5> 
							<button type="button" class="btn-close" data-bs-dismiss="modal">
								
							</button>
						</div>
						<div class="modal-body">
							<form class="row g-3" id="produit-form" novalidate>
				
									<input class="form-control" id="produitId" data-id="id" type="hidden"/>									
				
									
									<div class="row">
										<div class="col">
											<label for="nom" class="form-label">Nom</label>
											<input class="form-control" id="nom" data-id="nom" type="text" placeholder="References" required/>									
											<div class="invalid-feedback">
												Nom is required.
											</div>								
										</div>	
									
										<div class="col">
											<label for="Marque" class="form-label">Marque</label>
											<input class="form-control" id="Marque" data-id="Marque" type="text" placeholder="Marque" required/>									
											<div class="invalid-feedback">
												Prenom is required.
											</div>												
										</div>		
								    </div>
									
									<div class="row">
										<div class="col">
											<label for="Catégorie" class="form-label">Catégorie</label>
											<input class="form-control" id="Catégorie" data-id="Catégorie" type="text" placeholder="Catégorie" required/>						
											<div class="invalid-feedback">
												Date naissance is required.
											</div>	
										</div>		
										
										<div class="col">
											<label for="Prix" class="form-label">Prix</label>
											<input class="form-control" id="Prix" data-id="Prix" type="text" placeholder="Prix">						
										</div>		
									</div>
									
									<div class="mb-3">
										<label for="TVA" class="form-label">TVA</label>
										<input class="form-control" id="TVA" data-id="TVA" rows="4" placeholder="TVA"></input>
									</div>						
									
									<div class="mb-3">
										<label for="Quantité_Stock" class="form-label">Quantité_Stock</label>
										<input class="form-control" id="Quantité_Stock" data-id="Quantité_Stock" type="text" placeholder="Quantité_Stock"/>									
									</div>											

									<div class="mb-3">
										<label for="Description" class="form-label">Description</label>
										<textarea class="form-control" id="Description" data-id="Description" type="text" placeholder="Description"></textarea>									
							    	</div>	
									
									
									
					
							</form>
						</div>
						<div class="modal-footer">
							 
							<button id="save-produit" type="button" class="btn btn-primary">
								Save
							</button> 
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
								Close
							</button>
						
						</div>
					</div>
					
				</div>
				
			</div>
		</br>
				&nbsp;
				<tr>
					<th>
						ID
					</th>
					<th>
						Nom
					</th>
					<th>
						Marque
					</th>
					<th>
						Catégorie
					</th>
					<th>
						Prix
					</th>
					<th>
						TVA
					</th>
					<th>
						Quantité_Stock
					</th>
					<th>
						Description
					</th>
				
					
					
				</tr>
				</thead>
				<tbody>
							
				</tbody>
			</table>
			


			
			
		</div>
	</div>
</div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

	<script src="js/common.js"></script>
	<script src="js/produit.js"></script>

  </body>
</html>