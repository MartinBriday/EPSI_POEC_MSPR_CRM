<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

        <link href="/css/common.css" rel="stylesheet">

    </head>
  
    </br>
    &nbsp;
    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="toolbar">
                        <a  href="/clients/index"><button   class="btn btn-primary " style="background-color: cadetblue; border-color: cadetblue;"> Clients </button></a>
                        <a href="/produits/index"><button   class="btn btn-primary " style="background-color: cadetblue; border-color: cadetblue;"> Produits </button></a>
                        <a href="/commandes/index"><button   class="btn btn-primary " style="background-color: cadetblue; border-color: cadetblue;"> Commandes </button></a>
                        <button class="btn btn-primary " style="background-color: cadetblue; border-color: cadetblue;"> Statistiques </button>
                    </div>
                    </br>
                    <div>
                        <img src="/images/111.png" class="deco-image"/>
                    </div>
                    </br>
                    <div class="block">
                        <span><h2 class="titre">Customer Relationship Management</h2></span>

                        <p class="parag">
                            La gestion de la relation client, ou gestion des relations avec la clientèle,
                            est l'ensemble des outils et techniques destinés à tenir compte des souhaits et des attentes des clients et des prospects,
                            afin de les satisfaire et de les fidéliser en leur offrant ou proposant des services.
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

        <script src="/js/common.js"></script>

    </body>
</html>