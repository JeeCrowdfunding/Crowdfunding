package m1.cf.ctrl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import m1.cf.db.*;

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
	@Autowired
	private CategorieRepo categorieRepo;
	@Autowired
	private APourCategorieRepo apcRepo;
	@Autowired
	private CommentaireRepo comRepo;
	@Autowired
	private ServletContext servletContext;

	
	
	// mni tkteb index.html f navigator ghadi texecuta hadi w trje3 lik la page index.jsp
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	/* =========>  users   <========= */
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {
		return "inscription";
	}

	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String signin() {
		return "signin";
	}

	@RequestMapping(value = "/cnx", method = RequestMethod.POST)
	@ResponseBody
	public String cnx( @ModelAttribute(value = "log") String email,
			@ModelAttribute(value = "mp") String mp, HttpServletRequest request) {
		
		
		User tmp =new User(email,mp);
		User n =utilisateurRepo.findUserByEmailAndMdp(tmp.getEmail(), tmp.getMdp());
		if(n!=null) {
			HttpSession session = request.getSession();
			session.setAttribute( "SessionCR", n );
			return "ok";
		}
		else return "Login ou mot de passe invalide !";
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

	/* =========>  contribution   <========= */
	// formulaire de contribution
	@RequestMapping(value = "/contribution", method = RequestMethod.GET)
	public String cContribution() {
		return "Contribution";
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
	

		/* =========>  Les Projet  <========= */
		
		@RequestMapping(value = "/nouveauProjet", method = RequestMethod.GET)
		public String nouveauProjet(HttpServletRequest request) {
			HttpSession session = request.getSession();
			User n=(User) session.getAttribute("SessionCR");
			if(n!=null) return "NouveauProjet";
			else return "no";
		}
		
		// ajouter un nouveau projet (emprunter)
		@RequestMapping(value = "/np", method = RequestMethod.POST)
		@ResponseBody

		public String addP(@ModelAttribute(value = "titr") String titre, @ModelAttribute(value = "desc") String  description,
				@ModelAttribute(value = "montant") float  montant, @RequestParam(value = "img", required = false) MultipartFile file,
				@ModelAttribute(value = "dure") int duree, @RequestParam(value = "categorie") String[] c, HttpServletRequest request){

			if (!file.isEmpty()) {
				try {
					
					BufferedOutputStream stream = new BufferedOutputStream(
							new FileOutputStream(new File(servletContext.getRealPath("/Images/")+"/" +file.getOriginalFilename())));
	                FileCopyUtils.copy(file.getInputStream(), stream);
					stream.close();
				}
				catch (Exception e) {
					return "Erreur : You failed to upload  => "+e.getMessage();
				}
			}
			 
			User user = new User("benjbara", "adam", "benjbara@gmail.com", "06617", "123456" );
			utilisateurRepo.saveAndFlush(user);
			String name_of_dir_images="new_1";
			File k= new File(servletContext.getRealPath("/Images/")+"/"+name_of_dir_images);
			Projet P = new Projet(titre, description, montant , duree ,chemin + file.getOriginalFilename());
			P.setUser(user);
			boolean ver=true;
			if(projetRepo!=null) {projetRepo.saveAndFlush(P); }
			else ver=false;
			
			if(k.exists() && k.isDirectory()) {
				description=description.replaceAll(name_of_dir_images, ""+P.getTitre()+"_"+P.getId());
				P.setDescription(description);
				File [] files = k.listFiles();
				for(int i=0;i<files.length;i++) {
					if(description.indexOf(files[i].getName()) == -1) {
						files[i].delete();
					}
				}
				k.renameTo(new File(servletContext.getRealPath("/Images/")+"/"+P.getTitre()+"_"+P.getId()));
				projetRepo.save(P);
			}
			int nbr=Integer.parseInt(request.getParameter("nbr"));
			for(int i=1;i<=nbr;i++) {
				if(ver){
					float a=Float.parseFloat(request.getParameter("montant_av_"+i));
					Avantage av = new Avantage(a,request.getParameter("desc_av_"+i));
					av.setProjet(P);
					if(avantageRepo!=null) {avantageRepo.saveAndFlush(av); }
					else ver=false;
				}
				else break;
			}
			//boolean ver=true;
			if(ver) {

				for(int i=0;i<c.length;i++) {
					Categorie categ= categorieRepo.findOne((long) Integer.parseInt(c[i]));
					APourCategorie ac= new APourCategorie(P,categ);
					apcRepo.saveAndFlush(ac);
				}
				return "Le projet est ajouté avec succès ";
			}
			else return "Erreur: adam howa sbab ";

		}
		
		// upload une image du description de projet
		@RequestMapping(method = RequestMethod.POST, value = "/imageUpload")
		@ResponseBody
		public String imageUpload(@RequestParam("image") MultipartFile file,
									   RedirectAttributes redirectAttributes) {
			
			int user_id=1;
			File k= new File(servletContext.getRealPath("/Images/")+"/new_"+user_id);
			if (!file.isEmpty()) {
				try {			
					if(!k.exists()) k.mkdir();
					else {
						File[] fs=k.listFiles();
						for (int i=0;i<fs.length;i++) {
							fs[i].delete();
						}
					}
					BufferedOutputStream stream = new BufferedOutputStream(
							new FileOutputStream(new File(servletContext.getRealPath("/Images/")+"/"+k.getName()+"/" +file.getOriginalFilename())));
	                FileCopyUtils.copy(file.getInputStream(), stream);
					stream.close();
					return ""+servletContext.getContextPath()+"/Images/"+k.getName()+"/" +file.getOriginalFilename();
				}
				catch (Exception e) {
					return "Erreur : You failed to upload  => "+e.getMessage();
				}
			}
			else {
				return "Erreur : You failed to upload  because the file was empty";
			}

		}	
	

		@RequestMapping(value = "/afficherProjet", method = RequestMethod.GET)
		@ResponseBody
		public String afficherProjet(@ModelAttribute(value = "id_projet") int id) {
				
			Projet p=projetRepo.findOne((long) id);
				if(p!=null) { 
				
				/*return "{"
						+ "projetName: "+p.getTitre()+","
						+ "projetId: "+p.getId()+","
						+ "}";*/
				
				return "<center> "
						+ "<h1>"+p.getTitre()+"</h1>"
						+"Photo de projet : <br/> <img width=\"200\" src=\"http://localhost:8080/crowdfunding/"+p.getImage()+"\" />"
						+ "<p><h3>Déscription</h3><br/>"+p.getDescription()+"</p>"
						+ " </center>";
				}
				
				else return "No id";
		}

		@RequestMapping(value = "/projets", method = RequestMethod.GET)
		@ResponseBody
		public String projets() {
			Page<Projet> pp=projetRepo.findAll(new PageRequest(0, 10, new Sort(Sort.Direction.DESC, "id")));
			List<Projet> p= pp.getContent();
			String myP="";			
			for(int i=0;i<p.size();i++) {
				myP+= "<center> "
						+ "<h1> Projet ==> "+(i+1)+" "+p.get(i).getTitre()+"</h1>"
						+"Photo de projet : <br/> <img width=\"200\" src=\"http://localhost:8080/crowdfunding/"+p.get(i).getImage()+"\" />"
						+ " </center><br/>";
			}
				myP +="Page "+(pp.getNumber()+1)+" of "+pp.getTotalPages()+" affichage par => "+pp.getSize()+"<br/>";
				return myP;

		}	

		// rechercher un projet par son titre
		@RequestMapping(value = "/findProjet", method = RequestMethod.GET)
		@ResponseBody
		public String getProjets(@ModelAttribute(value = "titre") String titre,
				@ModelAttribute(value = "page") int page) {
			page--;
			List<Projet> p= projetRepo.findByTitreContaining(titre, new PageRequest(page, 10));
			String myP="";			
			for(int i=0;i<p.size();i++) {
				myP+= ""+p.get(i).getId()+" "+p.get(i).getTitre()+";";
			}
			if(myP!="") return myP;
			else return "Erreur : Pas de produit ...";
		}
		
		/* =========>  Les Catégotrie <========= */
		
		@RequestMapping(value = "/getCat", method = RequestMethod.GET)
		@ResponseBody
		public String getCategories() {
			List<Categorie> p= categorieRepo.findAll();
			String myP="";			
			for(int i=0;i<p.size();i++) {
				myP+= ""+p.get(i).getId()+" "+p.get(i).getTitre()+";";
			}
			if(myP!="") return myP;
			else return "Erreur : Pas de catégorie ...";
		}
		
		//ajouter une categorie
		@RequestMapping(value = "/addCategorie", method = RequestMethod.GET)
		@ResponseBody
		public String addCat( @ModelAttribute(value = "titre") String titre) {

				Categorie c= new Categorie (titre);
				if(categorieRepo.saveAndFlush(c)!=null) {
					return ""+c.getId();
				}		
				else return "Erreur : ";
		}
		
		// les projets par cartégorie
		
		@RequestMapping(value = "/proCat", method = RequestMethod.GET)
		@ResponseBody
		public String proCat( @ModelAttribute(value = "id_cat") long id, @ModelAttribute(value = "page") int page) {
				page--;
				Categorie c= categorieRepo.getOne(id);
			
				if(c!=null) {
					List<APourCategorie> p= apcRepo.findAPourCategorieByCategorie(c, new PageRequest(page, 10));
					String res="";
					for(int i=0;i<p.size();i++) {
						res+=""+p.get(i).getProjet().getTitre()+"<br/>";
					}
					return res;
				}
				else return "Erreur : ";
		}
		
		
		/* =========>  Les Commantaires <========= */
		@RequestMapping(value = "/addCommentaire", method = RequestMethod.GET)
		@ResponseBody
		public String addCom(@ModelAttribute(value = "id_projet") long id_projet, @ModelAttribute(value = "msg") String msg) {
				
				Projet p=projetRepo.getOne(id_projet);
				User u=utilisateurRepo.getOne((long) 1);
				Commentaire c=new Commentaire (u,p,msg);
				if(comRepo.saveAndFlush(c)!=null) return ""+c.getId();
				else return "Erreur : une erreur c'est produite !";
		}		
		
		@RequestMapping(value = "/getCommentaire", method = RequestMethod.GET)
		@ResponseBody
		public String getCom(@ModelAttribute(value = "id_projet") long id_projet, 
				@ModelAttribute(value = "page") int page) {
				
				page--;
				Projet p=projetRepo.getOne(id_projet);
				List<Commentaire> c= comRepo.findByProjetOrderByIdDesc(p,new PageRequest(page, 10));
				String m="";
				for(int i=0;i<c.size();i++) {
					m+=""+c.get(i).getId();
				}
				return "ok"+m;
		}		
		
		public void setServletContext(ServletContext servletContext) {
			this.servletContext = servletContext;
		}
	 		
}