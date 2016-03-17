package m1.cf.db;

import java.io.Serializable;
import java.security.MessageDigest;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="USER")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id_user")
	private long id;
	
	@Column(name = "nom")
	private String nom;
	
	@Column(name = "prenom")
	private String prenom;
	
	@Column(name = "email", unique = true)
	private String email;
	
	@Column(name = "mdp")
	private String mdp;
	
	@Column(name = "numtel", unique = true)
	private String numtel;
	
	
	
	
	@OneToMany(mappedBy="user")
	private Set<Projet> projets;
	
	@OneToMany( mappedBy="user" )
	private Set<Contribution> contribution;
	
	public Set<Projet> getProjets() {
		return projets;
	}

	public void setProjets(Set<Projet> projets) {
		this.projets = projets;
	}

	

	
	
	/*@ManyToMany(cascade = {CascadeType.ALL})
	 @JoinTable(name="CONTRIBUTION", joinColumns={@JoinColumn(name="id_user")}, inverseJoinColumns={@JoinColumn(name="id_avantage")})
	private Set<Avantage> avantages = new HashSet<Avantage>(); */
	
	public long getId() {
		return id;
	}
	
	public User(String nom, String prenom, String email, String mdp, String numtel) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.mdp = encryptedPassword(mdp);
		this.numtel = numtel;
	}
	
	public User(){}
	
	public String getNom() {
		return nom;
	}
	
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public String getPrenom() {
		return prenom;
	}
	
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getMdp() {
		return mdp;
	}
	
	public void setMdp(String mdp) {
		this.mdp = encryptedPassword(mdp);
	}
	
	public String getNumtel() {
		return numtel;
	}
	
	public boolean isUser(String mdp){
		if(this.mdp.equals(encryptedPassword(mdp)))
			return true;
		return false;
	}
	
	public void setNumtel(String numtel) {
		this.numtel = numtel;
	}
	
	private String encryptedPassword(String pass){
		byte[] plainText = pass.getBytes();
        MessageDigest md = null;
        try {		
            md = MessageDigest.getInstance("SHA");
        } catch (Exception e) {
            e.printStackTrace();
        }
		
        md.reset();		
        md.update(plainText);
        byte[] encodedPassword = md.digest();

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < encodedPassword.length; i++) {
            if ((encodedPassword[i] & 0xff) < 0x10) {
                sb.append("0");
            }

            sb.append(Long.toString(encodedPassword[i] & 0xff, 16));
        }
        return sb.toString();
	}
}