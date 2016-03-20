package m1.cf.db;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component 
public interface UserRepo extends JpaRepository<User, Long> {
	
	public User findUserByEmailAndMdp(String email, String mp);
}
