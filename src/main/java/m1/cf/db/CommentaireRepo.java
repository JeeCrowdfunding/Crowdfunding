package m1.cf.db;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component 
public interface CommentaireRepo extends JpaRepository<Commentaire, Long> {
	
	public List<Commentaire> findByProjetOrderByIdDesc(Projet p);
	public List<Commentaire> findByProjetOrderByIdDesc(Projet p, Pageable page);
}
