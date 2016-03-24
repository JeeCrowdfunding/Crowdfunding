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
@Table(name="LIKEPROJECT")
public class LikeProject implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id_like")
	private long id;
	
	 @ManyToOne
	    @JoinColumn(name="id_projet")
	 	private Projet projet;
	
	 @ManyToOne
	    @JoinColumn(name="id_user")
	 	private User user;
	
	int liked;
	
	int dislike;
	
	
	

	public LikeProject(Projet projet, User user, int liked, int dislike) {
		super();
		this.projet = projet;
		this.user = user;
		this.liked = liked;
		this.dislike = dislike;
	}
	
	public LikeProject() {
	}
	
	
	public Projet getProjet() {
		return projet;
	}

	public void setProjet(Projet projet) {
		this.projet = projet;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

	public int getDislike() {
		return dislike;
	}

	public void setDislike(int dislike) {
		this.dislike = dislike;
	}
	
	
}
