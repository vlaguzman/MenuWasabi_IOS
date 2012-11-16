<?php 

//$conexion = mysql_connect("localhost", "adminwb", "Lounge140") or die ("Error conexión BD");
//mysql_select_db('wasabi', $conexion)or die('No se encuentra la base de datos');
$conexion = mysql_connect("localhost", "brain140_adminwb", "Lounge140") or die ("Error conexión BD");
mysql_select_db('brain140_wasabi', $conexion)or die('No se encuentra la base de datos');

//mysql_set_charset(utf8);
$consulta = "SELECT id_plato, nombre, descripcion, id_tipoplato, precio, img_pequena, img_grande, img_pequena, img_principal FROM wsb_plato";
$resultado = mysql_query($consulta, $conexion) or die ('Error en SQL: '.$consulta);

if($resultado)
{
	$registros = array();
	if(mysql_num_rows($resultado)){
		while ($unRegistro = mysql_fetch_assoc($resultado)) {
			$registros[] = array(
				'id_plato' => $unRegistro['id_plato'],
				'nombre' => $unRegistro['nombre'],
				'descripcion' => utf8_encode($unRegistro['descripcion']),
				'id_tipoplato' => $unRegistro['id_tipoplato'],
				'precio' => $unRegistro['precio'],
				'img_grande' => $unRegistro['img_grande'],
				'img_pequena'=> $unRegistro['img_pequena'],
				'img_principal'=> $unRegistro['img_principal'],

				);
			
		}
	}
	
	header('Content-type: application/json; charset=utf-8');
	echo '{"platos":'.json_encode($registros).'}';
	//echo json_encode($registros);
}