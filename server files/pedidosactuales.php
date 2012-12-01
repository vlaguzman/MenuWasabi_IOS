<?php
include_once "consultar.php";
?>

<html>
	<head>
		<link rel="stylesheet" href="css/style.css" type="text/css">
	</head>
	<body>

		<table> 
				<tr>
					<td> ID PEDIDO </td> 
					<td> ID MESA </td> 
					<td> FECHA </td> 
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
						<td> <?= $value['totalCuenta'] ?></td> 
				
					</tr>
					<?php
				}
				?>
				
		</table>
		<h3>Seleccione el pedido que desea detallar:</h3>

		<form method="post" action="pedidosactuales.php">
			<select name="pedido_seleccionado">
				<?php 
				foreach ($registros as $key => $value) 
				{
					//var_dump($key." == ".$value['']);
					//echo "<option value='".$value[0]['id_mesa']."'>".$value[0]['id_mesa']."</option>";
					?>
					<option value="<?= $value['id_pedido'] ?>">
						<?= $value['id_pedido'] ?>
					</option>

					<?php
				}
				?>
			</select>
			<input type="submit" value="consultar" name="consultar" />
		</form>

		<?php
			if(isset($_POST['consultar'])){ 
			    include_once "consultar_detallepedido.php";
			    ?>
				<table> 
					<tr>
						<td> ID PLATO </td> 
						<td> NOMBRE </td> 
						<td> PRECIO </td> 
						<td> CANTIDAD</td>
					</tr> 
					<?php 
					foreach ($registros_detalles as $key => $detalle) 
					{
					?>
					<tr>
						<td> <?= $detalle['id_plato'] ?></td> 
						<td> <?= $detalle['nombre'] ?></td> 
						<td> <?= $detalle['precio'] ?></td> 
						<td> <?= $detalle['cantidad'] ?></td> 			
					</tr>
					<?php
				    }
				     ?>
				</table>
			    <?php
			}
		?>

	</body>
</html>