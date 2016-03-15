package m1.cf.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import m1.cf.db.UserRepo;
import m1.cf.db.User;

@Controller
@EnableWebMvc
public class GController {

	
	@Autowired
	private UserRepo utilisateurRepo;

	// mni tkteb index.html f navigator ghadi texecuta hadi w trje3 lik la page index.jsp
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {
		return "inscription";
	}

	// mni tsift chi 9lwa b POST l add.html ghadi texecuta hadi
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public String add(@ModelAttribute(value = "nom") String nom, @ModelAttribute(value = "prenom")String prenom, 
			@ModelAttribute(value = "email") String email, @ModelAttribute(value = "numtel") String numtel, 
			@ModelAttribute(value = "mdp") String mdp, @ModelAttribute(value = "confmdp") String confmdp) {
		if(mdp.equals(confmdp)){
		User user = new User(nom, prenom, email, numtel, mdp);
		utilisateurRepo.saveAndFlush(user);
		return "success";
		}
		return "9laoui";
	}

}