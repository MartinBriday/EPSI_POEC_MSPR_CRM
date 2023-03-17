<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
  	<title>ACME - Clients</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link href="/css/common.css" rel="stylesheet">

  </head>
  <body>

    <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover" id="client-table">
				<thead>
					<tr>
						<th>
							#
						</th>
						<th>
							Nom
						</th>
						<th>
							Prenom
						</th>
						<th>
							Date naissance
						</th>
						<th>
							Telephone
						</th>
						<th>
							Numéro de rue
						</th>
						<th>
							Rue
						</th>
						<th>
							Code Postal
						</th>
						<th>
							Ville
						</th>
						<th>

						</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<nav>
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
			</nav>


			<a href="#" role="button" class="btn btn-primary add-button">Add</a>
			
			<div class="modal fade" id="client-modal" tabindex="-1" aria-labelledby="modal-header">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="modal-title">
								Client
							</h5> 
							<button type="button" class="btn-close" data-bs-dismiss="modal">
								
							</button>
						</div>
						<div class="modal-body">
							<form class="row g-3" id="client-form" novalidate>
				
									<input class="form-control" id="clientId" data-id="id" type="hidden"/>									
				
									
									<div class="row">
										<div class="col">
											<label for="nom" class="form-label">Nom</label>
											<input class="form-control" id="nom" data-id="nom" type="text" placeholder="Nom" required/>									
											<div class="invalid-feedback">
												Nom is required.
											</div>								
										</div>	
									
										<div class="col">
											<label for="prenom" class="form-label">Prenom</label>
											<input class="form-control" id="prenom" data-id="prenom" type="text" placeholder="Prenom" required/>									
											<div class="invalid-feedback">
												Prenom is required.
											</div>												
										</div>		
								    </div>
									
									<div class="row">
										<div class="col">
											<label for="dateNaissance" class="form-label">Date naissance</label>
											<input class="form-control" id="dateNaissance" data-id="dateNaissance" type="text" placeholder="Date naissance" required/>
											<div class="invalid-feedback">
												Date naissance is required.
											</div>	
										</div>		
										
										<div class="col">
											<label for="telephone" class="form-label">Telephone</label>
											<input class="form-control" id="telephone" data-id="telephone" type="text" placeholder="Telephone">						
										</div>		
									</div>
									
									<div class="mb-3">
										<label for="adresse" class="form-label">Adresse</label>
										<textarea class="form-control" id="rue" data-id="rue" type="text" rows="4" placeholder="Rue"></textarea>
									</div>						
									
									<div class="mb-3">
										<label for="codePostal" class="form-label">Code Postal</label>
										<input class="form-control" id="codePostal" data-id="codePostal" type="text" placeholder="Code Postal"/>
									</div>											

									<div class="mb-3">
										<label for="ville" class="form-label">Ville</label>
										<input class="form-control" id="ville" data-id="ville" type="text" placeholder="Ville"/>									
							    	</div>				
									
									<div class="mb-3" required>
										<label for="numeroRue" class="form-label">Numéro rue</label>
                                        <input class="form-control" id="numeroRue" data-id="numeroRue" type="text" placeholder="Numéro Rue"/>
									</div>
					
							</form>
						</div>
						<div class="modal-footer">
							 
							<button id="save-client" type="button" class="btn btn-primary">
								Save
							</button> 
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
								Close
							</button>
						
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

	<script src="/js/common.js"></script>
	<script src="/js/client.js"></script>

  </body>
</html>