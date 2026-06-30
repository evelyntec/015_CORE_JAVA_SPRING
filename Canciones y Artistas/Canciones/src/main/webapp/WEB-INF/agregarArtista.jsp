<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Agregar Artista</title>
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}

	body {
		font-family: 'Trebuchet MS', sans-serif;
		background: linear-gradient(135deg, #360033, #0b8793);
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
		box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
	}

	h1 {
		color: #0b8793;
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

	input[type="text"], textarea {
		width: 100%;
		padding: 12px 16px;
		border: 2px solid #e0e0e0;
		border-radius: 12px;
		font-size: 15px;
		font-family: 'Trebuchet MS', sans-serif;
		transition: border 0.3s ease;
	}

	input[type="text"]:focus, textarea:focus {
		outline: none;
		border-color: #0b8793;
	}

	textarea {
		resize: vertical;
		min-height: 90px;
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
		background: linear-gradient(135deg, #360033, #0b8793);
		color: #fff;
		border: none;
		border-radius: 30px;
		font-size: 16px;
		font-weight: bold;
		cursor: pointer;
		transition: transform 0.3s ease, box-shadow 0.3s ease;
	}

	.boton-guardar:hover {
		transform: translateY(-2px);
		box-shadow: 0 10px 20px rgba(11, 135, 147, 0.4);
	}

	.volver {
		display: block;
		text-align: center;
		margin-top: 22px;
		color: #0b8793;
		text-decoration: none;
		font-weight: bold;
		transition: color 0.3s ease;
	}

	.volver:hover {
		color: #360033;
	}
</style>
</head>
<body>
	<div class="formulario-contenedor">
		<h1>Agregar Nuevo Artista</h1>
		<form:form action="/artistas/procesa/agregar" method="post" modelAttribute="artista">
			<div class="campo">
				<form:label path="nombre">Nombre</form:label>
				<form:input path="nombre" type="text"/>
				<form:errors path="nombre" class="error"/>
			</div>
			<div class="campo">
				<form:label path="apellido">Apellido</form:label>
				<form:input path="apellido" type="text"/>
				<form:errors path="apellido" class="error"/>
			</div>
			<div class="campo">
				<form:label path="biografia">Biografia</form:label>
				<form:textarea path="biografia"/>
				<form:errors path="biografia" class="error"/>
			</div>
			<button type="submit" class="boton-guardar">Guardar Artista</button>
		</form:form>
		<a class="volver" href="/artistas">Volver a lista de artistas</a>
	</div>
</body>
</html>