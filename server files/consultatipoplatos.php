<?php 

//$conexion = mysql_connect("localhost", "adminwb", "Lounge140") or die ("Error conexión BD");
//mysql_select_db('wasabi', $conexion)or die('No se encuentra la base de datos');
$conexion = mysql_connect("localhost", "brain140_adminwb", "Lounge140") or die ("Error conexión BD");
mysql_select_db('brain140_wasabi', $conexion)or die('No se encuentra la base de datos');

//mysql_set_charset(utf8);
$consulta = "SELECT id_tipoPlato, nombre FROM wsb_tipoPlato";
$resultado = mysql_query($consulta, $conexion) or die ('Error en SQL: '.$consulta);

if($resultado)
{
	$registros = array();
	if(mysql_num_rows($resultado)){
		while ($unRegistro = mysql_fetch_assoc($resultado)) {
			$registros[] = array(
				'id_tipoPlato' => $unRegistro['id_tipoPlato'],
				'nombre' => $unRegistro['nombre'],
				);
			
		}
	}
	
	header('Content-type: application/json; charset=utf-8');
	echo '{"tipo_platos":'.json_encode($registros).'}';
	//echo json_encode($registros);
}