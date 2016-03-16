package m1.cf.ctrl;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor;

import m1.cf.db.UserRepo;
import m1.cf.db.Avantage;
import m1.cf.db.AvantageRepo;
import m1.cf.db.Contribution;
import m1.cf.db.ContributionRepo;
import m1.cf.db.Projet;
import m1.cf.db.ProjetRepo;
import m1.cf.db.User;

@Controller
@EnableWebMvc
public class GController {

	//static String chemin = "/home/etudiant/Documents/crowdfunding/Crowdfunding/src/main/webapp/Images/";
	static String chemin = "./Images/";
	@Autowired
	private UserRepo utilisateurRepo;
	
	@Autowired
	private ProjetRepo projetRepo;
	
	@Autowired
	private AvantageRepo avantageRepo;
	@Autowired
	private ContributionRepo contributionRepo;

	private ServletContext servletContext;

	
	@RequestMapping(value = "/nouveauProjet", method = RequestMethod.GET)
	public String nouveauProjet() {
		return "NouveauProjet";
	}
	
	// pour ajouter un nouveau avantage
	@RequestMapping(value = "/nouveauAvantage", method = RequestMethod.GET)
	public String nouveauAvantage() {
		return "Avantage";
	}

	// mni tkteb index.html f navigator ghadi texecuta hadi w trje3 lik la page index.jsp
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	// formulaire de contribution
	@RequestMapping(value = "/contribution", method = RequestMethod.GET)
	public String cContribution() {
		return "Contribution";
	}
	
	// ajouter un nouveau projet (emprunter)
	@RequestMapping(value = "/np", method = RequestMethod.POST)
	@ResponseBody
	public String addP(@ModelAttribute(value = "titr") String titre, @ModelAttribute(value = "desc")String description,
			@ModelAttribute(value = "montant") float montant, @RequestParam(value = "img", required = false) MultipartFile image,
			@ModelAttribute(value = "dure") int duree){
		
		
		if (!image.isEmpty()) {
			try {
			//validateImage(image);
			 
			} catch (RuntimeException re) {
			//bindingResult.reject(re.getMessage());
			//return "redirect:/person?new";
			return "veillez choisir une image .jpg ou .png";
			}
			 
			try {
			saveImage( image.getOriginalFilename(), image);
			} catch (IOException e) {
			//bindingResult.reject(e.getMessage());
			return "cant save this file";
			}
			}
			//return "image";
		
		 
		User user = new User("benjbara", "adam", "benjbara@gmail.com", "06617", "123456" );
		utilisateurRepo.saveAndFlush(user);
		Projet P = new Projet(titre, description, montant , duree ,chemin + image.getOriginalFilename());
		//Projet p2 new Projet(titre, description, montant, duree, image)
		P.setUser(user);
		if(projetRepo!=null) {projetRepo.saveAndFlush(P); return "redirect:/Avantage"; }
		else return "no";
		
	}
	
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

	
	//ajouter un nouveau avantage
	@RequestMapping(value = "/av", method = RequestMethod.POST)
	@ResponseBody
	public String addAv(@ModelAttribute(value = "desc") String description, @ModelAttribute(value = "montant")float montant) {

	
		User user = new User("benjbara13", "adam", "benjbara@gmail.com", "06617", "123456" );
		utilisateurRepo.saveAndFlush(user);
		Projet P = new Projet("titre", "description", 16.5f , 12 ,"image");
		
		P.setUser(user);
		projetRepo.saveAndFlush(P);
		
		
		
	Avantage av = new Avantage(montant,description);
	av.setProjet(P);
	avantageRepo.saveAndFlush(av);
	
	

	
		return "avantage ajoute";
		}
	
	
	//ajouter une contribution
		@RequestMapping(value = "/contribuer", method = RequestMethod.POST)
		@ResponseBody
		public String addCont( @ModelAttribute(value = "montant")float montant) {
		//return	"redirect:/allpersons";
		
			User user = new User("driss", "ben", "benjbara@gmail.com", "06617", "123456" );
			User user2 = new User("ddd", "s44", "sjdf@gmail.com", "060617", "1234756" );
			
			utilisateurRepo.saveAndFlush(user);
			utilisateurRepo.saveAndFlush(user2);
			
			Projet P = new Projet("titre", "description", 16.5f , 12 ,"image");
			
			P.setUser(user);
			projetRepo.saveAndFlush(P);
			
			
			
		Avantage av = new Avantage(montant,"description");
		av.setProjet(P);
		avantageRepo.saveAndFlush(av);
		
		Contribution con = new Contribution(montant); 
		con.setAvantage(av);
		con.setUser(user2);
		
		contributionRepo.saveAndFlush(con);
	     
		
		
		if(contributionRepo!=null)	return "success";
		else return "objet vide";
			}
	
	
	
	
	 
	private void validateImage(MultipartFile image) {
	if ( (!image.getContentType().equals("image/jpeg") ) || ( !image.getContentType().equals("image/png") )  ) {
	throw new RuntimeException("Only JPG images are accepted");
	}
	}
	 
	public void setServletContext(ServletContext servletContext) {
	this.servletContext = servletContext;
	 
	}
	 
	private void saveImage(String filename, MultipartFile image)
	throws RuntimeException, IOException {
	try {

	File file = new File(chemin + filename);
	 
	FileUtils.writeByteArrayToFile(file, image.getBytes());
	System.out.println("Go to the location:  " + file.toString()
	+ " on your computer and verify that the image has been stored.");
	} catch (IOException e) {
	throw e;
	}
	}
	
	

}