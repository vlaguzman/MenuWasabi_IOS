<?php

$id = $_GET["id"];
$precio = $_GET["precio"];

$conexion = mysql_connect("localhost", "brain140_adminwb", "Lounge140") or die ("Error conexión BD");
mysql_select_db('brain140_wasabi', $conexion)or die('No se encuentra la base de datos');
//$conexion = mysql_connect("localhost", "adminwb", "Lounge140") or die ("Error conexión BD");
//mysql_select_db('wasabi', $conexion)or die('No se encuentra la base de datos');


$query = sprintf("UPDATE wsb_plato SET precio='%s' WHERE id_plato='%s'", $precio, $id);
//mysql_query("UPDATE wsb_plato SET precio='"+$precio+"' WHERE FirstName='Peter' AND LastName='Griffin'");

$result = mysql_query($query);

// Check result
// This shows the actual query sent to MySQL, and the error. Useful for debugging.
if (!$result) {
    $message  = 'Invalid query: ' . mysql_error() . "\n";
    $message .= 'Whole query: ' . $query;
    die($message);
}

mysql_close($conexion);
?>