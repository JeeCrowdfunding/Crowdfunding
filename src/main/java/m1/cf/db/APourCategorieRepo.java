package m1.cf.db;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component 
public interface APourCategorieRepo extends JpaRepository<APourCategorie, Long> {

		public List<APourCategorie> findAPourCategorieByCategorie(Categorie c, Pageable page);
}
