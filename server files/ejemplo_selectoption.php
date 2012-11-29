			<select>
				<?php 
			foreach ($registros as $key => $value) 
				{
					//var_dump($key." == ".$value['']);
					//echo "<option value='".$value[0]['id_mesa']."'>".$value[0]['id_mesa']."</option>";
					?>
					<option value="<?= $value[0]['id_mesa'] ?>">
						<?= $value[0]['id_mesa'] ?>
					</option>

					<?php
				}
				?>
			</select>