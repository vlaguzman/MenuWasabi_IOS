<?php 

	$tipo_bebida = $_GET["tipo"];

	$conexion = mysql_connect("localhost", "brain140_adminwb", "Lounge140") or die ("Error conexión BD");
	mysql_select_db('brain140_wasabi', $conexion)or die('No se encuentra la base de datos');

	//mysql_set_charset(utf8);
	$consulta = sprintf("SELECT nombre, precio_principal FROM wsb_bebida WHERE id_tipoBebida='%s'", $tipo_bebida);
	$resultado = mysql_query($consulta, $conexion) or die ('Error en SQL: '.$consulta);

	if($resultado)
	{
		$registros = array();
		if(mysql_num_rows($resultado)){
			while ($unRegistro = mysql_fetch_assoc($resultado)) {
				$registros[] = array(
					'nombre' => utf8_encode($unRegistro['nombre']),
					'precio_principal' => $unRegistro['precio_principal'],
					);
			}
		}
		header('Content-type: application/json; charset=utf-8');
		echo '{"bebidas":'.json_encode($registros).'}';
		//echo json_encode($registros);
	}
?>