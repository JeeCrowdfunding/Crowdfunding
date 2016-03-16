package m1.cf.db;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component 
public interface ProjetRepo extends JpaRepository<Projet, Long> {
	
}
