<?php

$id_mesa = $_GET["mesa"];
$total = $_GET["total"];
$estado = $_GET["estado"];
$num_platos = $_GET["cantidadplatos"];

$conexion = mysql_connect("localhost", "brain140_adminwb", "Lounge140") or die ("Error conexión BD");
mysql_select_db('brain140_wasabi', $conexion)or die('No se encuentra la base de datos');
//$conexion = mysql_connect("localhost", "adminwb", "Lounge140") or die ("Error conexión BD");
//mysql_select_db('wasabi', $conexion)or die('No se encuentra la base de datos');


$query = sprintf("INSERT INTO wsb_pedido (id_mesa, totalCuenta, estado) VALUES (%s,%s,'%s')", $id_mesa, $total, $estado);
//mysql_query("UPDATE wsb_plato SET precio='"+$precio+"' WHERE FirstName='Peter' AND LastName='Griffin'");
$result = mysql_query($query);

if (!$result) {
    $message  = 'Invalid query: ' . mysql_error() . "\n";
    $message .= 'Whole query: ' . $query;
    die($message);
}

$rs = mysql_query("SELECT MAX(id_pedido) FROM wsb_pedido");
if ($row = mysql_fetch_row($rs)) {
	$id_pedido = trim($row[0]);
}	

echo "Last id: $last_id";

for ($num=1; $num<=$num_platos ; $num++) { 
	$plato = $_GET["plato".$num];
	$cant = $_GET["cantidad".$num];
	echo "plato: $plato";

	$query = sprintf("INSERT INTO wsb_platoxpedido (id_pedido, id_plato, cantidad) VALUES (%s,%s,%s)", $id_pedido, $plato, $cant);
	$result = mysql_query($query);

	if (!$result) {
    	$message  = 'Invalid query: ' . mysql_error() . "\n";
    	$message .= 'Whole query: ' . $query;
    	die($message);
	}
}
// Check result
// This shows the actual query sent to MySQL, and the error. Useful for debugging.
mysql_close($conexion);

?>