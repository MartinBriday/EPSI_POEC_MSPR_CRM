<?php
$data = file_get_contents("php://input");
$data = json_decode($data);
$data = (array)$data;

header('Content-type:application/json;charset=utf-8');

if (!isset($data['id']) || $data['id'] == null || $data['id'] == '') {
    $data['id'] = 1234;
}

$countries = (array)json_decode(file_get_contents ("countries.json"));
if (array_key_exists($data['pays'], $countries)) {
    $data['pays_display'] = $countries[$data['pays']];
}

echo json_encode($data);
