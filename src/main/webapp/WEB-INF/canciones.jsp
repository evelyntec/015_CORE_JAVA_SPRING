<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Mis Canciones</title>
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}

	body {
		font-family: 'Trebuchet MS', sans-serif;
		background: linear-gradient(135deg, #2b1055, #7597de);
		min-height: 100vh;
		padding: 50px 20px;
		color: #fff;
	}

	.contenedor {
		max-width: 900px;
		margin: 0 auto;
		background: rgba(255, 255, 255, 0.08);
		backdrop-filter: blur(10px);
		border-radius: 20px;
		padding: 40px;
		box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
		border: 1px solid rgba(255, 255, 255, 0.18);
	}

	h1 {
		text-align: center;
		font-size: 38px;
		margin-bottom: 30px;
		letter-spacing: 2px;
		text-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
	}

	h1 span {
		color: #ffd86b;
	}

	table {
		width: 100%;
		border-collapse: collapse;
		margin-top: 20px;
	}

	thead tr {
		background: rgba(255, 216, 107, 0.85);
		color: #2b1055;
	}

	th, td {
		padding: 16px 20px;
		text-align: left;
	}

	tbody tr {
		background: rgba(255, 255, 255, 0.06);
		transition: background 0.3s ease, transform 0.2s ease;
	}

	tbody tr:hover {
		background: rgba(255, 255, 255, 0.18);
		transform: scale(1.01);
	}

	tbody tr:not(:last-child) {
		border-bottom: 1px solid rgba(255, 255, 255, 0.1);
	}

	.enlace-detalle {
		display: inline-block;
		padding: 8px 18px;
		background: #ffd86b;
		color: #2b1055;
		text-decoration: none;
		border-radius: 30px;
		font-weight: bold;
		transition: background 0.3s ease, color 0.3s ease;
	}

	.enlace-detalle:hover {
		background: #fff;
		color: #7597de;
	}

	.contenedor-boton {
		text-align: center;
		margin-top: 35px;
		display: flex;
		gap: 15px;
		justify-content: center;
		flex-wrap: wrap;
	}

	.boton-agregar {
		display: inline-block;
		padding: 14px 32px;
		background: #ffd86b;
		color: #2b1055;
		text-decoration: none;
		border-radius: 30px;
		font-weight: bold;
		font-size: 16px;
		transition: transform 0.3s ease, box-shadow 0.3s ease, background 0.3s ease;
	}

	.boton-agregar:hover {
		transform: translateY(-3px);
		box-shadow: 0 10px 20px rgba(255, 216, 107, 0.4);
		background: #fff;
	}

	.boton-artistas {
		display: inline-block;
		padding: 14px 32px;
		background: transparent;
		color: #ffd86b;
		text-decoration: none;
		border: 2px solid #ffd86b;
		border-radius: 30px;
		font-weight: bold;
		font-size: 16px;
		transition: transform 0.3s ease, background 0.3s ease, color 0.3s ease;
	}

	.boton-artistas:hover {
		transform: translateY(-3px);
		background: #ffd86b;
		color: #2b1055;
	}
</style>
</head>
<body>
	<div class="contenedor">
		<h1>Lista de <span>Canciones</span></h1>
		<table>
			<thead>
				<tr>
					<th>Titulo</th>
					<th>Autor</th>
					<th>Detalle</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cancion" items="${canciones}">
					<tr>
						<td>${cancion.titulo}</td>
						<td>${cancion.artista.nombre} ${cancion.artista.apellido}</td>
						<td>
							<a class="enlace-detalle" href="/canciones/detalle/${cancion.id}">Detalle</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="contenedor-boton">
			<a class="boton-agregar" href="/canciones/formulario/agregar/0">Agregar Cancion</a>
			<a class="boton-artistas" href="/artistas">Ir a artistas</a>
		</div>
	</div>
</body>
</html>