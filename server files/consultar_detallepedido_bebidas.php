<?php
  
    $pedido = $_POST['pedido_seleccionado'];

$estado = "solicitado";

$conexion = mysql_connect("localhost", "brain140_adminwb", "Lounge140") or die ("Error conexión BD");
	mysql_select_db('brain140_wasabi', $conexion)or die('No se encuentra la base de datos');

	$consulta_bebidas = sprintf("SELECT t1.id_bebida, t2.nombre, t1.total_parcial, t1.cantidad FROM wsb_bebidaxpedido AS t1, wsb_bebida AS t2
       WHERE t1.id_bebida = t2.id_bebida AND t1.id_pedido='%s'", $pedido);
	$resultado_bebidas = mysql_query($consulta_bebidas, $conexion) or die ('Error en SQL: '.$consulta_bebidas);


	if($resultado_bebidas)
	{
	$registros_bebidas = array();
		if(mysql_num_rows($resultado_bebidas)){
			while ($unRegistro = mysql_fetch_assoc($resultado_bebidas)) {
				$registros_bebidas[] = $unRegistro;
			}
		}
	
	}
?>


