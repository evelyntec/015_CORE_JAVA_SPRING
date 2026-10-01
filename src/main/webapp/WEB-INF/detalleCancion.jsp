<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Detalle de la Cancion</title>
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}

	body {
		font-family: 'Trebuchet MS', sans-serif;
		background: linear-gradient(135deg, #11998e, #38ef7d);
		min-height: 100vh;
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 40px 20px;
	}

	.tarjeta {
		background: #fff;
		max-width: 480px;
		width: 100%;
		border-radius: 24px;
		padding: 40px;
		box-shadow: 0 20px 50px rgba(0, 0, 0, 0.25);
		position: relative;
		overflow: hidden;
	}

	.tarjeta::before {
		content: "";
		position: absolute;
		top: -60px;
		right: -60px;
		width: 160px;
		height: 160px;
		background: linear-gradient(135deg, #11998e, #38ef7d);
		border-radius: 50%;
		opacity: 0.18;
	}

	h1 {
		color: #11998e;
		font-size: 30px;
		margin-bottom: 25px;
		border-bottom: 3px solid #38ef7d;
		padding-bottom: 12px;
	}

	.dato {
		display: flex;
		justify-content: space-between;
		padding: 14px 0;
		border-bottom: 1px dashed #d4d4d4;
	}

	.etiqueta {
		font-weight: bold;
		color: #555;
	}

	.valor {
		color: #11998e;
		font-weight: 600;
		text-align: right;
	}

	.contenedor-acciones {
		display: flex;
		gap: 12px;
		margin-top: 30px;
		flex-wrap: wrap;
	}

	.boton-editar {
		flex: 1;
		text-align: center;
		padding: 12px 20px;
		background: linear-gradient(135deg, #f7971e, #ffd200);
		color: #5a3d00;
		text-decoration: none;
		border-radius: 30px;
		font-weight: bold;
		transition: transform 0.3s ease, box-shadow 0.3s ease;
	}

	.boton-editar:hover {
		transform: translateY(-3px);
		box-shadow: 0 10px 20px rgba(247, 151, 30, 0.4);
	}

	.boton-eliminar {
		flex: 1;
		padding: 12px 20px;
		background: linear-gradient(135deg, #eb3349, #f45c43);
		color: #fff;
		border: none;
		border-radius: 30px;
		font-weight: bold;
		font-size: 15px;
		font-family: 'Trebuchet MS', sans-serif;
		cursor: pointer;
		transition: transform 0.3s ease, box-shadow 0.3s ease;
	}

	.boton-eliminar:hover {
		transform: translateY(-3px);
		box-shadow: 0 10px 20px rgba(235, 51, 73, 0.4);
	}

	.formulario-eliminar {
		flex: 1;
		display: flex;
	}

	.volver {
		display: block;
		text-align: center;
		margin-top: 20px;
		padding: 12px 26px;
		background: linear-gradient(135deg, #11998e, #38ef7d);
		color: #fff;
		text-decoration: none;
		border-radius: 30px;
		font-weight: bold;
		transition: transform 0.3s ease, box-shadow 0.3s ease;
	}

	.volver:hover {
		transform: translateY(-3px);
		box-shadow: 0 10px 20px rgba(17, 153, 142, 0.4);
	}
</style>
</head>
<body>
	<div class="tarjeta">
		<h1>${cancion.titulo}</h1>
		<div class="dato">
			<span class="etiqueta">Artista</span>
			<span class="valor">${cancion.artista.nombre} ${cancion.artista.apellido}</span>
		</div>
		<div class="dato">
			<span class="etiqueta">Album</span>
			<span class="valor">${cancion.album}</span>
		</div>
		<div class="dato">
			<span class="etiqueta">Genero</span>
			<span class="valor">${cancion.genero}</span>
		</div>
		<div class="dato">
			<span class="etiqueta">Idioma</span>
			<span class="valor">${cancion.idioma}</span>
		</div>
		<div class="dato">
			<span class="etiqueta">Fecha de creacion</span>
			<span class="valor">${cancion.fechaDeCreacion}</span>
		</div>
		<div class="dato">
			<span class="etiqueta">Fecha de actualizacion</span>
			<span class="valor">${cancion.fechaDeActualizacion}</span>
		</div>
		<div class="contenedor-acciones">
			<a class="boton-editar" href="/canciones/formulario/editar/${cancion.id}">Actualizar</a>
			<form class="formulario-eliminar" action="/canciones/eliminar/${cancion.id}" method="post">
				<button type="submit" class="boton-eliminar">Eliminar</button>
			</form>
		</div>
		<a class="volver" href="/canciones">Volver a lista de canciones</a>
	</div>
</body>
</html>