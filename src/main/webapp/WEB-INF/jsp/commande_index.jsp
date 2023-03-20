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
			<table class="tab" id="commande-table">
			
				<thead>
				 
					<div class="toolbar">
						<a href ="client.html" class="btn btn-primary "> Client </a>
    					<a href="produit.html"><button class="btn btn-primary  ">Produit  </button></a>
						<button class="btn btn-primary bn53 "> Commande </button>
    					<button class="btn btn-primary "> Statistique </button>
    					
					</div>
				</br>
				<a href="#" role="button" class="btn btn-primary add-button">Ajouter Commande</a>
			
			<div class="modal fade" id="commande-modal" tabindex="-1" aria-labelledby="modal-header">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="modal-title">
								Commande
							</h5> 
							<button type="button" class="btn-close" data-bs-dismiss="modal">
								
							</button>
						</div>
						<div class="modal-body">
							<form class="row g-3" id="commande-form" novalidate>
				
									<input class="form-control" id="commandeId" data-id="id" type="hidden"/>									
				
									
									<div class="row">
										<div class="col">
											<label for="nom" class="form-label">N°Commande</label>
											<input class="form-control" id="N°Commande" data-id="N°Commande" type="text" placeholder="Nom" required/>									
											<div class="invalid-feedback">
												Nom is required.
											</div>								
										</div>	
									
										<div class="col">
											<label for="prenom" class="form-label">ID_Client</label>
											<input class="form-control" id="ID_Client" data-id="ID_Client" type="text" placeholder="Prenom" required/>									
											<div class="invalid-feedback">
												Prenom is required.
											</div>												
										</div>		
								    </div>
									
									<div class="row">
										<div class="col">
											<label for="date_naissance" class="form-label">ID_Produit</label>
											<input class="form-control" id="ID_Produit" data-id="ID_Produit" type="text" placeholder="Date naissance" required/>						
											<div class="invalid-feedback">
												Date naissance is required.
											</div>	
										</div>		
										
										<div class="col">
											<label for="telephone" class="form-label">Date_Commande</label>
											<input class="form-control" id="Date_Commande" data-id="Date_Commande" type="text" placeholder="Telephone">						
										</div>		
									</div>
									
									<div class="mb-3">
										<label for="adresse" class="form-label">Date_Livraison</label>
										<input class="form-control" id="Date_Livraison" data-id="Date_Livraison" rows="4" placeholder="Adresse"></textarea>
									</div>						
									
									<div class="mb-3">
										<label for="code_postal" class="form-label">Quantité_Acheté</label>
										<input class="form-control" id="Quantité_Acheté" data-id="Quantité_Acheté" type="text" placeholder="Code Postal"/>									
									</div>											

									
					
							</form>
						</div>
						<div class="modal-footer">
							 
							<button id="save-commande" type="button" class="btn btn-primary">
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
							N°commande
						</th>
						<th>
							ID_Client
						</th>
						<th>
							ID_Produit
						</th>
						<th>
							Date_Commande
						</th>
						<th>
							Date_Livraison
						</th>
						<th>
							Quantité_Acheté
						</th>
						
						
					</tr>
				</thead>
				
			</table>
			


			
			
		</div>
	</div>
</div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

	<script src="js/common.js"></script>
	<script src="js/commande.js"></script>

  </body>
</html>