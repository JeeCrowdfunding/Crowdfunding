package m1.cf.db;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CONTRIBUTION")
public class Contribution implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id_contribution")
	private long id;
	
	private float montant;
	
	private Date contribuer_le;
	

	public float getMontant() {
		return montant;
	}

	public void setMontant(float montant) {
		this.montant = montant;
	}

	public long getId() {
		return id;
	}

	public Contribution() {
		super();
	}

	public Contribution(float montant) {
		super();
		this.montant = montant;
		this.contribuer_le= new Date(System.currentTimeMillis());
	}

	public Date getContribuer_le() {
		return contribuer_le;
	}
	
	

}
