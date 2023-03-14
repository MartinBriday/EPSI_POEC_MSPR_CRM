<?php
$data = [
    [
        "id" => 1,
        "nom" => "Terieur",
        "prenom" => "Alain",
        "date_naissance" => "01/01/1970",
        "telephone" => "01 23 45 67 89",
        "adresse" => "123 Rue de Merde",
        "code_postal" => "12300",
        "ville" => "ville",
        "pays" => 1,
        "pays_display" => "France"
    ],
    [
        "id" => 2,
        "nom" => "Terieur",
        "prenom" => "Alex",
        "date_naissance" => "01/01/1970",
        "telephone" => "01 23 45 67 89",
        "adresse" => "123 Rue de Merde",
        "code_postal" => "49300",
        "ville" => "ville",
        "pays" => 1,
        "pays_display" => "France"
    ],
];

header('Content-type:application/json;charset=utf-8');
echo json_encode($data);