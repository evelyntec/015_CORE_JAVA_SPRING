package com.evelyn.controladores;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.evelyn.modelos.Artista;
import com.evelyn.modelos.Cancion;
import com.evelyn.servicios.ServicioArtistas;
import com.evelyn.servicios.ServicioCanciones;

@Controller
public class ControladorCanciones {

	@Autowired
	private ServicioCanciones servicioCanciones;

	@Autowired
	private ServicioArtistas servicioArtistas;

	@GetMapping("/canciones")
	public String desplegarCanciones(Model modelo) {
		List<Cancion> listaDeCanciones = servicioCanciones.obtenerTodasLasCanciones();
		modelo.addAttribute("canciones", listaDeCanciones);
		return "canciones";
	}

	@GetMapping("/canciones/detalle/{idCancion}")
	public String desplegarDetalleCancion(@PathVariable("idCancion") Long idCancion, Model modelo) {
		Cancion cancion = servicioCanciones.obtenerCancionPorId(idCancion);
		modelo.addAttribute("cancion", cancion);
		return "detalleCancion";
	}

	@GetMapping("/canciones/formulario/agregar/{idCancion}")
	public String formularioAgregarCancion(@PathVariable("idCancion") Long idCancion, @ModelAttribute("cancion") Cancion cancion, Model modelo) {
		List<Artista> listaDeArtistas = servicioArtistas.obtenerTodosLosArtistas();
		modelo.addAttribute("artistas", listaDeArtistas);
		return "agregarCancion";
	}

	@PostMapping("/canciones/procesa/agregar")
	public String procesarAgregarCancion(@Valid @ModelAttribute("cancion") Cancion cancion, BindingResult resultado, @RequestParam("artistaId") Long artistaId, Model modelo) {
		if (resultado.hasErrors()) {
			List<Artista> listaDeArtistas = servicioArtistas.obtenerTodosLosArtistas();
			modelo.addAttribute("artistas", listaDeArtistas);
			return "agregarCancion";
		} else {
			Artista artista = servicioArtistas.obtenerArtistaPorId(artistaId);
			cancion.setArtista(artista);
			servicioCanciones.agregarCancion(cancion);
			return "redirect:/canciones";
		}
	}

	@GetMapping("/canciones/formulario/editar/{idCancion}")
	public String formularioEditarCancion(@PathVariable("idCancion") Long idCancion, Model modelo) {
		Cancion cancion = servicioCanciones.obtenerCancionPorId(idCancion);
		modelo.addAttribute("cancion", cancion);
		return "editarCancion";
	}

	@PostMapping("/canciones/procesa/editar/{idCancion}")
	public String procesarEditarCancion(@PathVariable("idCancion") Long idCancion, @Valid @ModelAttribute("cancion") Cancion cancion, BindingResult resultado) {
		if (resultado.hasErrors()) {
			return "editarCancion";
		} else {
			cancion.setId(idCancion);
			servicioCanciones.actualizaCancion(cancion);
			return "redirect:/canciones";
		}
	}

	@PostMapping("/canciones/eliminar/{idCancion}")
	public String procesarEliminarCancion(@PathVariable("idCancion") Long idCancion) {
		servicioCanciones.eliminaCancion(idCancion);
		return "redirect:/canciones";
	}

}