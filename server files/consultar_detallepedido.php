<?php
  
    $pedido = $_POST['pedido_seleccionado'];

$estado = "solicitado";

$conexion = mysql_connect("localhost", "brain140_adminwb", "Lounge140") or die ("Error conexión BD");
	mysql_select_db('brain140_wasabi', $conexion)or die('No se encuentra la base de datos');

	$consulta_detalles = sprintf("SELECT t1.id_plato, t2.nombre, t1.total_parcial, t1.cantidad FROM wsb_platoxpedido AS t1, wsb_plato AS t2
       WHERE t1.id_plato = t2.id_plato AND t1.id_pedido='%s'", $pedido);
	$resultado_detalles = mysql_query($consulta_detalles, $conexion) or die ('Error en SQL: '.$consulta_detalles);


	if($resultado_detalles)
	{
	$registros_detalles = array();
		if(mysql_num_rows($resultado_detalles)){
			while ($unRegistro = mysql_fetch_assoc($resultado_detalles)) {
				$registros_detalles[] = $unRegistro;
			}
		}
	
	}

?>


