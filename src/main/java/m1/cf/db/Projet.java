package m1.cf.db;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="PROJET")
public class Projet implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id_projet")
	private long id;
	
	private String titre;
	
	@Column(columnDefinition = "text")
	private String description;
	
	private float montant;
	
	private int duree;
	
	private Date cree_le;
	
	private String image;
	
	@ManyToOne
    @JoinColumn(name="id_user")
	private User user;

	@ManyToOne
    @JoinColumn(name="id_categorie")
	private Categorie categorie;
	
	@OneToMany(mappedBy="projet")
	private Set<Avantage> avantages;
	
	public long getId() {
		return id;
	}

	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getMontant() {
		return montant;
	}

	public void setMontant(float montant) {
		this.montant = montant;
	}

	public int getDuree() {
		return duree;
	}

	public void setDuree(int duree) {
		this.duree = duree;
	}

	public Date getCree_le() {
		return cree_le;
	}

	public Projet(String titre, String description, float montant, int duree, String image) {
		super();
		this.titre = titre;
		this.description = description;
		this.montant = montant;
		this.duree = duree;
		this.cree_le = new Date(System.currentTimeMillis());
		this.image = image;
	}
	
	public Projet(){}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public Categorie getCategorie() {
		return categorie;
	}

	public void setUser(Categorie categorie) {
		this.categorie = categorie;
	}	
	
}
