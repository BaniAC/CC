package es.upm.dit.geoloc.dao.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;

@Entity
@Table(name = "usuarios")
public class User implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -144978489789589L;
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	private double id;
	@Column(name = "EMAIL", unique = true, nullable = false, length = 100)
	private String email;
	//private DATE createdAt;
	
	
	public User() {		
		
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	
	public double getId() {
		return id;
	}


	public void setId(double id) {
		this.id = id;
	}

}
