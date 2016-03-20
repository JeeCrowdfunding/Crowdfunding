package m1.cf.db;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="APOURCATEGORIE")

public class APourCategorie implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id_apourcategorie")
	private long id;
	
	 @ManyToOne
	    @JoinColumn(name="id_projet")
		private Projet projet;
	 
	 @ManyToOne
	    @JoinColumn(name="id_categorie")
		private Categorie categorie;
	 
	public APourCategorie(){}

	public APourCategorie(Projet p, Categorie c){
		projet=p;
		categorie=c;
	}
	
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Projet getProjet() {
		return projet;
	}

	public void setProjet(Projet projet) {
		this.projet = projet;
	}

	public Categorie getCategorie() {
		return categorie;
	}

	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	 
	 
	 
	
}
