package com.evelyn.servicios;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.evelyn.modelos.Cancion;
import com.evelyn.repositorios.RepositorioCanciones;

@Service
public class ServicioCanciones {

	@Autowired
	private RepositorioCanciones repositorioCanciones;

	public List<Cancion> obtenerTodasLasCanciones() {
		return repositorioCanciones.findAll();
	}

	public Cancion obtenerCancionPorId(Long id) {
		Optional<Cancion> cancionOptional = repositorioCanciones.findById(id);
		if (cancionOptional.isPresent()) {
			return cancionOptional.get();
		} else {
			return null;
		}
	}

	public Cancion agregarCancion(Cancion cancion) {
		return repositorioCanciones.save(cancion);
	}

	public Cancion actualizaCancion(Cancion cancion) {
		return repositorioCanciones.save(cancion);
	}

	public void eliminaCancion(Long id) {
		repositorioCanciones.deleteById(id);
	}

}