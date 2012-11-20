<?php 

$numero_mesa = $_GET["numero"];
//$conexion = mysql_connect("localhost", "adminwb", "Lounge140") or die ("Error conexión BD");
//mysql_select_db('wasabi', $conexion)or die('No se encuentra la base de datos');
$conexion = mysql_connect("localhost", "brain140_adminwb", "Lounge140") or die ("Error conexión BD");
mysql_select_db('brain140_wasabi', $conexion)or die('No se encuentra la base de datos');

//mysql_set_charset(utf8);
$consulta = sprintf("SELECT id_estado FROM wsb_mesa WHERE numero='%s'", $numero_mesa);
$resultado = mysql_query($consulta, $conexion) or die ('Error en SQL: '.$consulta);

if($resultado)
{
	$registros = array();
	if(mysql_num_rows($resultado)){
		while ($unRegistro = mysql_fetch_assoc($resultado)) {
			$registros[] = array(
				'estado' => $unRegistro['id_estado'],
				);
		}
	}
	header('Content-type: application/json; charset=utf-8');
	echo '{"mesa":'.json_encode($registros).'}';
	//echo json_encode($registros);
}