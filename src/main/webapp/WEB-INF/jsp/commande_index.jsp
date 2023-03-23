<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <a href="/accueil"><div class="textt" style="font-size: 50px;/*! top: ; *//*! margin-top: ; */position: absolute;top: 30px;/*! text-decoration: underline overline #FF3028; *//*! text-underline-offset: 20px; */color: darkcyan;">ACME</div></a>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="_csrf" content="${_csrf.token}"/>
        <meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

        <link href="/css/common.css" rel="stylesheet">

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
                                <a href ="/clients/index"><button   class="btn btn-primary " style="background-color: cadetblue; border-color: cadetblue;"> Clients </button></a>
                                <a href="/produits/index"><button   class="btn btn-primary  " style="background-color: cadetblue; border-color: cadetblue;"> Produits </button></a>
                                <button class="btn btn-primary bn53 "> Commandes </button>
                                <button class="btn btn-primary " style="background-color: cadetblue; border-color: cadetblue;"> Statistiques </button>
                            </div>
                            </br>
                            <a href="#" role="button" class="btn btn-primary add-button bn62">Ajouter Commande</a>
                            </br>
                            &nbsp;
                            <tr>
                                <th>
                                    ID
                                </th>
                                <th>
                                    ID Client
                                </th>
                                <th>
                                    ID Produit
                                </th>
                                <th>
                                    Date Commande
                                </th>
                                <th>
                                    Date Livraison
                                </th>
                                <th>
                                    Quantité Achetée
                                </th>
                                <th>

                                </th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>

                    <div class="modal fade" id="commande-modal" tabindex="-1" aria-labelledby="modal-header">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="modal-title">
                                        Commande
                                    </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">
                                    <form class="row g-3" id="commande-form" novalidate>

                                        <input class="form-control" id="commandeId" data-id="id" type="hidden"/>

                                        <div class="row">
                                            <div class="col">
                                                <label for="idClient" class="form-label">ID Client</label>
                                                <input class="form-control" id="idClient" data-id="idClient" type="text" placeholder="ID Client" required/>
                                                <div class="invalid-feedback">
                                                    ID Client is required.
                                                </div>
                                            </div>

                                            <div class="col">
                                                <label for="idProduit" class="form-label">ID Produit</label>
                                                <select name="idProduit" id="idProduit" data-id="idProduit" class="form-control" style="margin-top:7px">
                                                    <option value=""> Choisir un produit</option>
                                                    <c:forEach items="${produits}" var="produit">
                                                        <option value="${produit.getId()}">${produit.getNom()}</option>
                                                    </c:forEach>
                                                </select>
                                                <div class="invalid-feedback">
                                                    ID Produit is required.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label for="dateCreation" class="form-label">Date Création</label>
                                            <input class="form-control" id="dateCreation" data-id="dateCreation" rows="4" placeholder="Date Création">
                                        </div>

                                        <div class="mb-3">
                                            <label for="dateLivraison" class="form-label">Date Livraison</label>
                                            <input class="form-control" id="dateLivraison" data-id="dateLivraison" rows="4" placeholder="Date Livraison">
                                        </div>

                                        <div class="mb-3">
                                            <label for="quantiteProduit" class="form-label">Quantité Achetée</label>
                                            <input class="form-control" id="quantiteProduit" data-id="quantiteProduit" type="text" placeholder="Quantité Achetée"/>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">

                                    <button id="save-commande" type="button" class="btn btn-primary">
                                        Sauvegarder
                                    </button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                        Fermer
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
        <script src="/js/commande.js"></script>

    </body>
</html>