package com.evelyn.modelos;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

@Entity
@Table(name = "canciones")
public class Cancion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Size(min = 5, message = "El titulo debe tener al menos 5 caracteres")
	private String titulo;

	@Size(min = 3, message = "El album debe tener al menos 3 caracteres")
	private String album;

	@Size(min = 3, message = "El genero debe tener al menos 3 caracteres")
	private String genero;

	@Size(min = 3, message = "El idioma debe tener al menos 3 caracteres")
	private String idioma;

	@Column(updatable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date fechaDeCreacion;

	@Temporal(TemporalType.TIMESTAMP)
	private Date fechaDeActualizacion;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "artista_id")
	private Artista artista;

	public Cancion() {
	}

	@PrePersist
	protected void alCrear() {
		this.fechaDeCreacion = new Date();
		this.fechaDeActualizacion = new Date();
	}

	@PreUpdate
	protected void alActualizar() {
		this.fechaDeActualizacion = new Date();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getIdioma() {
		return idioma;
	}

	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}

	public Date getFechaDeCreacion() {
		return fechaDeCreacion;
	}

	public void setFechaDeCreacion(Date fechaDeCreacion) {
		this.fechaDeCreacion = fechaDeCreacion;
	}

	public Date getFechaDeActualizacion() {
		return fechaDeActualizacion;
	}

	public void setFechaDeActualizacion(Date fechaDeActualizacion) {
		this.fechaDeActualizacion = fechaDeActualizacion;
	}

	public Artista getArtista() {
		return artista;
	}

	public void setArtista(Artista artista) {
		this.artista = artista;
	}

}