<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Editar Cancion</title>
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}

	body {
		font-family: 'Trebuchet MS', sans-serif;
		background: linear-gradient(135deg, #f7971e, #ffd200);
		min-height: 100vh;
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 40px 20px;
	}

	.formulario-contenedor {
		background: #fff;
		max-width: 520px;
		width: 100%;
		border-radius: 22px;
		padding: 40px;
		box-shadow: 0 20px 50px rgba(0, 0, 0, 0.25);
	}

	h1 {
		color: #e07b00;
		font-size: 30px;
		margin-bottom: 28px;
		text-align: center;
		letter-spacing: 1px;
	}

	.campo {
		margin-bottom: 20px;
	}

	label {
		display: block;
		margin-bottom: 8px;
		color: #444;
		font-weight: bold;
		font-size: 15px;
	}

	input[type="text"] {
		width: 100%;
		padding: 12px 16px;
		border: 2px solid #e0e0e0;
		border-radius: 12px;
		font-size: 15px;
		transition: border 0.3s ease;
	}

	input[type="text"]:focus {
		outline: none;
		border-color: #f7971e;
	}

	.error {
		color: #e63946;
		font-size: 13px;
		margin-top: 6px;
		display: block;
	}

	.boton-guardar {
		width: 100%;
		padding: 14px;
		margin-top: 10px;
		background: linear-gradient(135deg, #f7971e, #ffd200);
		color: #5a3d00;
		border: none;
		border-radius: 30px;
		font-size: 16px;
		font-weight: bold;
		cursor: pointer;
		transition: transform 0.3s ease, box-shadow 0.3s ease;
	}

	.boton-guardar:hover {
		transform: translateY(-2px);
		box-shadow: 0 10px 20px rgba(247, 151, 30, 0.4);
	}

	.volver {
		display: block;
		text-align: center;
		margin-top: 22px;
		color: #e07b00;
		text-decoration: none;
		font-weight: bold;
		transition: color 0.3s ease;
	}

	.volver:hover {
		color: #5a3d00;
	}
</style>
</head>
<body>
	<div class="formulario-contenedor">
		<h1>Editar Cancion</h1>
		<form:form action="/canciones/procesa/editar/${cancion.id}" method="post" modelAttribute="cancion">
			<div class="campo">
				<form:label path="titulo">Titulo</form:label>
				<form:input path="titulo" type="text"/>
				<form:errors path="titulo" class="error"/>
			</div>
			<div class="campo">
				<form:label path="album">Album</form:label>
				<form:input path="album" type="text"/>
				<form:errors path="album" class="error"/>
			</div>
			<div class="campo">
				<form:label path="genero">Genero</form:label>
				<form:input path="genero" type="text"/>
				<form:errors path="genero" class="error"/>
			</div>
			<div class="campo">
				<form:label path="idioma">Idioma</form:label>
				<form:input path="idioma" type="text"/>
				<form:errors path="idioma" class="error"/>
			</div>
			<button type="submit" class="boton-guardar">Actualizar Cancion</button>
		</form:form>
		<a class="volver" href="/canciones">Volver a lista de canciones</a>
	</div>
</body>
</html>