<?php
include_once "consultar.php";
?>
<!--
$consulta = sprintf("SELECT t1.id_pedido, t1.id_mesa, t1.totalCuenta, t1.fecha, t2.id_plato, t2.cantidad FROM wsb_pedido AS t1, wsb_platoxpedido AS t2
       WHERE t1.id_pedido = t2.id_pedido AND t1.estado='%s'", $estado);



		
-->


<html>
	<head>
		<link rel="stylesheet" href="css/style.css" type="text/css">
	</head>
	<body>
		<h3>Seleccione una mesa:</h3>

			<table> 
					<tr>
						<td> ID PEDIDO </td> 
						<td> ID MESA </td> 
						<td> FECHA </td> 
						<td>  PLATOS </td> 
						<td> TOTAL CUENTA </td> 
				
					</tr> 
				<?php 
				foreach ($registros as $key => $value) 
				{
					?>
					<tr>
						<td> <?= $value['id_pedido'] ?></td> 
						<td> <?= $value['id_mesa'] ?></td> 
						<td> <?= $value['fecha'] ?></td> 
						<td> <?= $value['platos'] ?></td> 
						 
						<td> <?= $value['totalCuenta'] ?></td> 
				
					</tr> 
					<?php
				}
				?>
			</table>

	</body>
</html>