package m1.cf.db;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;

@Component 
public interface LikeProjectRepo extends JpaRepository<LikeProject, Long> {

		public LikeProject findLikeProjectByUserAndProjet(User u, Projet p);
		public List<LikeProject> findLikeProjectByProjet(Projet p);
}
