<?php 

//$conexion = mysql_connect("localhost", "adminwb", "Lounge140") or die ("Error conexión BD");
//mysql_select_db('wasabi', $conexion)or die('No se encuentra la base de datos');
$conexion = mysql_connect("localhost", "brain140_adminwb", "Lounge140") or die ("Error conexión BD");
mysql_select_db('brain140_wasabi', $conexion)or die('No se encuentra la base de datos');

//mysql_set_charset(utf8);
$consulta = "SELECT id_bebida, nombre, id_tipoBebida, id_categoriaBebida, precio_principal, precio_media, precio_trago FROM wsb_bebida";
$resultado = mysql_query($consulta, $conexion) or die ('Error en SQL: '.$consulta);

if($resultado)
{
	$registros = array();
	if(mysql_num_rows($resultado)){
		while ($unRegistro = mysql_fetch_assoc($resultado)) {
			$registros[] = array(
				'id_bebida' => $unRegistro['id_bebida'],
				'nombre' => utf8_encode($unRegistro['nombre']),
				'id_tipoBebida' => $unRegistro['id_tipoBebida'],
				'id_categoriaBebida' => $unRegistro['id_categoriaBebida'],
				'precio_principal' => $unRegistro['precio_principal'],
				'precio_media' => $unRegistro['precio_media'],
				'precio_trago'=> $unRegistro['precio_trago'],
				);
			
		}
	}
	
	header('Content-type: application/json; charset=utf-8');
	echo '{"bebidas":'.json_encode($registros).'}';
	//echo json_encode($registros);
}