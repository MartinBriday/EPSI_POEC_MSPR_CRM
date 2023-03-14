<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
  	<title>ACME - Clients</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link href="css/common.css" rel="stylesheet">

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
							Adresse
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
                    <c:forEach var="client" items="${ clients }">
                        <tr>
                            <td>
                                <c:out value="${client.getId()}"></c:out>
                            </td>
                            <td>
                                <c:out value="${client.getNom()}"></c:out>
                            </td>
                            <td>
                                <c:out value="${client.getPrenom()}"></c:out>
                            </td>
                            <td>
                                <c:out value="${client.getDateNaissance()}"></c:out>
                            </td>
                            <td>
                                <c:out value="${client.getTelephone()}"></c:out>
                            </td>
                            <td>
                                <c:out value="${client.getNumeroRue()}"></c:out>
                            </td>
                            <td>
                                <c:out value="${client.getRue()}"></c:out>
                            </td>
                            <td>
                                <c:out value="${client.getCodePostal()}"></c:out>
                            </td>
                            <td>
                                <c:out value="${client.getVille()}"></c:out>
                            </td>
                        </tr>
                        <br>
                    </c:forEach>
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
											<label for="date_naissance" class="form-label">Date naissance</label>
											<input class="form-control" id="date_naissance" data-id="date_naissance" type="text" placeholder="Date naissance" required/>						
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
										<textarea class="form-control" id="adresse" data-id="adresse" rows="4" placeholder="Adresse"></textarea>
									</div>						
									
									<div class="mb-3">
										<label for="code_postal" class="form-label">Code Postal</label>
										<input class="form-control" id="code_postal" data-id="code_postal" type="text" placeholder="Code Postal"/>									
									</div>											

									<div class="mb-3">
										<label for="ville" class="form-label">Ville</label>
										<input class="form-control" id="ville" data-id="ville" type="text" placeholder="Ville"/>									
							    	</div>				
									
									<div class="mb-3" required>
										<label for="pays">Pays</label>
										<select class="form-control" id="pays" data-id="pays" required>
											<option value="1">France</option>
											<option value="2">Angleterre</option>											
									  </select>										
										<div class="invalid-feedback">
												Pays is required.
										</div>										  
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

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

	<script src="js/common.js"></script>
	<script src="js/client.js"></script>

  </body>
</html>