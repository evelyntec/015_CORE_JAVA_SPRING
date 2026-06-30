package com.evelyn.servicios;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.evelyn.modelos.Artista;
import com.evelyn.repositorios.RepositorioArtistas;

@Service
public class ServicioArtistas {

	@Autowired
	private RepositorioArtistas repositorioArtistas;

	public List<Artista> obtenerTodosLosArtistas() {
		return repositorioArtistas.findAll();
	}

	public Artista obtenerArtistaPorId(Long id) {
		Optional<Artista> artistaOptional = repositorioArtistas.findById(id);
		if (artistaOptional.isPresent()) {
			return artistaOptional.get();
		} else {
			return null;
		}
	}

	public Artista agregarArtista(Artista artista) {
		return repositorioArtistas.save(artista);
	}

}