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

import com.evelyn.modelos.Artista;
import com.evelyn.servicios.ServicioArtistas;

@Controller
public class ControladorArtistas {

	@Autowired
	private ServicioArtistas servicioArtistas;

	@GetMapping("/artistas")
	public String desplegarArtistas(Model modelo) {
		List<Artista> listaDeArtistas = servicioArtistas.obtenerTodosLosArtistas();
		modelo.addAttribute("artistas", listaDeArtistas);
		return "artistas";
	}

	@GetMapping("/artistas/detalle/{idArtista}")
	public String desplegarDetalleArtista(@PathVariable("idArtista") Long idArtista, Model modelo) {
		Artista artista = servicioArtistas.obtenerArtistaPorId(idArtista);
		modelo.addAttribute("artista", artista);
		return "detalleArtista";
	}

	@GetMapping("/artistas/formulario/agregar/{idArtista}")
	public String formularioAgregarArtista(@PathVariable("idArtista") Long idArtista, @ModelAttribute("artista") Artista artista) {
		return "agregarArtista";
	}

	@PostMapping("/artistas/procesa/agregar")
	public String procesarAgregarArtista(@Valid @ModelAttribute("artista") Artista artista, BindingResult resultado) {
		if (resultado.hasErrors()) {
			return "agregarArtista";
		} else {
			servicioArtistas.agregarArtista(artista);
			return "redirect:/artistas";
		}
	}

}