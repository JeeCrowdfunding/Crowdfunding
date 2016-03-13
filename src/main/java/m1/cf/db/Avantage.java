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
import javax.persistence.Table;

@Entity
@Table(name="AVANTAGE")
public class Avantage implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id_avantage")
	private long id;
	
	private float montant;
	
	private String description;
	
	@ManyToOne
    @JoinColumn(name="id_projet")
	private Projet projet;
	
	@ManyToMany(mappedBy="avantages")
	private Set<User> users = new HashSet<User>();
	public float getMontant() {
		return montant;
	}
	public void setMontant(float montant) {
		this.montant = montant;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Projet getProjet() {
		return projet;
	}
	public void setProjet(Projet projet) {
		this.projet = projet;
	}
	public Avantage(){}
	public long getId() {
		return id;
	}
	public Avantage(float montant, String description) {
		super();
		this.montant = montant;
		this.description = description;
	}
}
