<?php
$estado = "solicitado";

$conexion = mysql_connect("localhost", "brain140_adminwb", "Lounge140") or die ("Error conexión BD");
mysql_select_db('brain140_wasabi', $conexion)or die('No se encuentra la base de datos');

 
//$consulta = sprintf("SELECT t1.id_pedido, t1.id_mesa, t1.totalCuenta, t1.fecha, t2.id_plato, t2.cantidad FROM wsb_pedido AS t1, wsb_platoxpedido AS t2
//       WHERE t1.id_pedido = t2.id_pedido AND t1.estado='%s'", $estado);

$consulta = sprintf("SELECT * FROM wsb_pedido");
$resultado = mysql_query($consulta, $conexion) or die ('Error en SQL: '.$consulta);

//$resultado = mysql_num_rows($resultado)

if($resultado)
{
$registros = array();
$platos_array = array();
	if(mysql_num_rows($resultado)){

		while ($unRegistro = mysql_fetch_assoc($resultado)) {

			$registros[] = $unRegistro;

			$pedido = $unRegistro['id_pedido'];
			
			$consulta2 = sprintf("SELECT id_plato FROM wsb_platoxpedido WHERE id_pedido=%s", $pedido);
			$resultado2 = mysql_query($consulta2, $conexion) or die ('Error en SQL: '.$consulta2);

			if($resultado2){
				
				if(mysql_num_rows($resultado2)){
					
					while ( $unRegistro2 = mysql_fetch_assoc($resultado2)) {
						$platos_array[] =  $unRegistro2 ;
					}
					

				}

			}
			else{
				echo "La defecamos en la segunda consulta";
			}

		}

		var_dump($registros);
		var_dump($platos_array);
	}
	
}


?>