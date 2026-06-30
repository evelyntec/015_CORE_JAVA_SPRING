<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Detalle del Artista</title>
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

	.tarjeta {
		background: #fff;
		max-width: 540px;
		width: 100%;
		border-radius: 24px;
		padding: 40px;
		box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
	}

	h1 {
		color: #0b8793;
		font-size: 32px;
		margin-bottom: 10px;
	}

	.biografia {
		color: #666;
		font-style: italic;
		margin-bottom: 25px;
		padding-bottom: 20px;
		border-bottom: 2px solid #4ecdc4;
		line-height: 1.5;
	}

	h2 {
		color: #360033;
		font-size: 20px;
		margin-bottom: 15px;
	}

	.lista-canciones {
		list-style: none;
	}

	.lista-canciones li {
		padding: 12px 18px;
		background: #f4f9f9;
		border-radius: 12px;
		margin-bottom: 10px;
		color: #0b8793;
		font-weight: bold;
		border-left: 4px solid #4ecdc4;
	}

	.sin-canciones {
		color: #999;
		font-style: italic;
	}

	.volver {
		display: inline-block;
		margin-top: 28px;
		padding: 12px 26px;
		background: linear-gradient(135deg, #360033, #0b8793);
		color: #fff;
		text-decoration: none;
		border-radius: 30px;
		font-weight: bold;
		transition: transform 0.3s ease, box-shadow 0.3s ease;
	}

	.volver:hover {
		transform: translateY(-3px);
		box-shadow: 0 10px 20px rgba(11, 135, 147, 0.4);
	}
</style>
</head>
<body>
	<div class="tarjeta">
		<h1>${artista.nombre} ${artista.apellido}</h1>
		<p class="biografia">${artista.biografia}</p>
		<h2>Canciones de este artista</h2>
		<ul class="lista-canciones">
			<c:forEach var="cancion" items="${artista.canciones}">
				<li>${cancion.titulo}</li>
			</c:forEach>
			<c:if test="${empty artista.canciones}">
				<li class="sin-canciones">Este artista todavia no tiene canciones registradas.</li>
			</c:if>
		</ul>
		<a class="volver" href="/artistas">Volver a lista de artistas</a>
	</div>
</body>
</html>