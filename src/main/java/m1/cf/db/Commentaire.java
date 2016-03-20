package m1.cf.db;
import java.io.Serializable;
import java.util.Date;
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
@Table(name="COMMENTAIRE")
public class Commentaire {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id_commentaire")
	private long id;
	
	 @ManyToOne
	    @JoinColumn(name="id_user")
		private  User user;
	 
	 @ManyToOne
	    @JoinColumn(name="id_projet")
		private Projet projet;
	 
	 @Column(columnDefinition = "text")
	 private String msg; 
	 
	 private Date cree_le;
	 
	 public Commentaire() {
		 this.cree_le = new Date(System.currentTimeMillis());
	 }
	 
	 public Commentaire(User u, Projet p, String m) {
		 super();
		 this.cree_le = new Date(System.currentTimeMillis());
		 user=u;
		 projet=p;
		 msg=m;
	 }

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Projet getProjet() {
		return projet;
	}

	public void setProjet(Projet projet) {
		this.projet = projet;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Date getCree_le() {
		return cree_le;
	}

	public void setCree_le(Date cree_le) {
		this.cree_le = cree_le;
	}
	 
}
