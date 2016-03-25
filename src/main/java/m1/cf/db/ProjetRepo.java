package m1.cf.db;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;

@Component 
public interface ProjetRepo extends JpaRepository<Projet, Long> {
	   /*@Query("SELECT p FROM Projet p ORDER BY id_projet DESC LIMIT 0, 1")
	   	public List<Projet> getListProjet();
	    //public List<Projet> findByName(@Param("titre") String titre);*/
		public List<Projet> findByTitreContaining(String titre, Pageable page);
		public Page<Projet> findByUser(User u, Pageable page);
}
