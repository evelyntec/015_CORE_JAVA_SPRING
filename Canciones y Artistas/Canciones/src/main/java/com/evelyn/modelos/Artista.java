package com.evelyn.modelos;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

@Entity
@Table(name = "artistas")
public class Artista {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Size(min = 2, message = "El nombre debe tener al menos 2 caracteres")
	private String nombre;

	@Size(min = 2, message = "El apellido debe tener al menos 2 caracteres")
	private String apellido;

	@Size(min = 5, message = "La biografia debe tener al menos 5 caracteres")
	private String biografia;

	@Column(updatable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date fechaDeCreacion;

	@Temporal(TemporalType.TIMESTAMP)
	private Date fechaDeActualizacion;

	@OneToMany(mappedBy = "artista", fetch = FetchType.LAZY)
	private List<Cancion> canciones;

	public Artista() {
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

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getBiografia() {
		return biografia;
	}

	public void setBiografia(String biografia) {
		this.biografia = biografia;
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

	public List<Cancion> getCanciones() {
		return canciones;
	}

	public void setCanciones(List<Cancion> canciones) {
		this.canciones = canciones;
	}

}