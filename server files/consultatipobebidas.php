<?php 

$conexion = mysql_connect("localhost", "brain140_adminwb", "Lounge140") or die ("Error conexión BD");
mysql_select_db('brain140_wasabi', $conexion)or die('No se encuentra la base de datos');

$consulta = "SELECT id_tipoBebida, nombre, img_silueta, img_pequena, img_principal FROM wsb_tipoBebida";
$resultado = mysql_query($consulta, $conexion) or die ('Error en SQL: '.$consulta);

if($resultado)
{
	$registros = array();
	if(mysql_num_rows($resultado)){
		while ($unRegistro = mysql_fetch_assoc($resultado)) {
			$registros[] = array(
				'id_tipoBebida' => $unRegistro['id_tipoBebida'],
				'nombre' => utf8_encode($unRegistro['nombre']),
				'img_silueta' => $unRegistro['img_silueta'],
				'img_principal'=> $unRegistro['img_principal'],
				'img_pequena'=> $unRegistro['img_pequena'],
				);
		}
	}
	header('Content-type: application/json; charset=utf-8');
	echo '{"tipoBebidas":'.json_encode($registros).'}';
	//echo json_encode($registros);
}