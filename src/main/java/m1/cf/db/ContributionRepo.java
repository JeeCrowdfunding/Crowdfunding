package m1.cf.db;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component 
public interface ContributionRepo extends JpaRepository<Contribution, Long> {
	
	public List<Contribution> findContributionByAvantage(Avantage a);
}
