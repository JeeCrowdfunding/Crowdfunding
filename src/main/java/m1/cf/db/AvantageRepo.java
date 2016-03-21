package m1.cf.db;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component 
public interface AvantageRepo extends JpaRepository<Avantage, Long> {
	
	public List<Avantage> findAvantageByProjet(Projet p);
}
