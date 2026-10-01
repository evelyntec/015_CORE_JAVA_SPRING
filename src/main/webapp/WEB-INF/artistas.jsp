<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Artistas</title>
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
		padding: 50px 20px;
		color: #fff;
	}

	.contenedor {
		max-width: 800px;
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
		color: #4ecdc4;
	}

	.lista-artistas {
		list-style: none;
		margin-top: 20px;
	}

	.lista-artistas li {
		margin-bottom: 15px;
	}

	.enlace-artista {
		display: block;
		padding: 20px 25px;
		background: rgba(255, 255, 255, 0.06);
		color: #fff;
		text-decoration: none;
		border-radius: 14px;
		font-size: 18px;
		font-weight: bold;
		border-left: 4px solid #4ecdc4;
		transition: background 0.3s ease, transform 0.2s ease, padding-left 0.3s ease;
	}

	.enlace-artista:hover {
		background: rgba(78, 205, 196, 0.2);
		transform: translateX(5px);
		padding-left: 35px;
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
		background: #4ecdc4;
		color: #360033;
		text-decoration: none;
		border-radius: 30px;
		font-weight: bold;
		font-size: 16px;
		transition: transform 0.3s ease, box-shadow 0.3s ease, background 0.3s ease;
	}

	.boton-agregar:hover {
		transform: translateY(-3px);
		box-shadow: 0 10px 20px rgba(78, 205, 196, 0.4);
		background: #fff;
	}

	.boton-canciones {
		display: inline-block;
		padding: 14px 32px;
		background: transparent;
		color: #4ecdc4;
		text-decoration: none;
		border: 2px solid #4ecdc4;
		border-radius: 30px;
		font-weight: bold;
		font-size: 16px;
		transition: transform 0.3s ease, background 0.3s ease, color 0.3s ease;
	}

	.boton-canciones:hover {
		transform: translateY(-3px);
		background: #4ecdc4;
		color: #360033;
	}
</style>
</head>
<body>
	<div class="contenedor">
		<h1>Lista de <span>Artistas</span></h1>
		<ul class="lista-artistas">
			<c:forEach var="artista" items="${artistas}">
				<li>
					<a class="enlace-artista" href="/artistas/detalle/${artista.id}">
						${artista.nombre} ${artista.apellido}
					</a>
				</li>
			</c:forEach>
		</ul>
		<div class="contenedor-boton">
			<a class="boton-agregar" href="/artistas/formulario/agregar/0">Agregar Artista</a>
			<a class="boton-canciones" href="/canciones">Ir a canciones</a>
		</div>
	</div>
</body>
</html>