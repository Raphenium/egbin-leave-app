package net.kzn.onlineshopping.controller;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.kzn.onlineshopping.exception.ProductNotFoundException;

import net.kzn.shoppingbackend.dao.CategoryDAO;
import net.kzn.shoppingbackend.dao.EpmRepObjAttrDAO;
import net.kzn.shoppingbackend.dao.ProductDAO;
import net.kzn.shoppingbackend.dao.RalphObj1DAO;
import net.kzn.shoppingbackend.dao.ServiceProviderDAO;
import net.kzn.shoppingbackend.dao.StackedDAO;
import net.kzn.shoppingbackend.dao.UserDAO;
import net.kzn.shoppingbackend.dto.Cart;
import net.kzn.shoppingbackend.dto.Category;
import net.kzn.shoppingbackend.dto.EpmRepObjAttr;
import net.kzn.shoppingbackend.dto.Leave1;
import net.kzn.shoppingbackend.dto.Product;
import net.kzn.shoppingbackend.dto.RalphObj1;
import net.kzn.shoppingbackend.dto.Stacked;
import net.kzn.shoppingbackend.dto.User;


@Controller
public class PageController {
	
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	 @Autowired
	 private PasswordEncoder passwordEncoder;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ServiceProviderDAO serviceProviderDAO;
	
	@Autowired
	private StackedDAO stackedDAO;
	
	@Autowired
	private EpmRepObjAttrDAO epmRepObjAttrDAO;
	
	@Autowired
	private RalphObj1DAO ralphObj1DAO;
	

	
	@RequestMapping(value = {"/", "/home", "/index"})
	public ModelAndView index(@RequestParam(name="logout",required=false)String logout) {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","Home");
		
		logger.info("Inside PageController index method - INFO");
		logger.debug("Inside PageController index method - DEBUG");
		
		//passing the list of categories
		
		
		if(logout!=null) {
			mv.addObject("message", "You have successfully logged out!");			
		}
		
		mv.addObject("userClickHome",true);
		return mv;				
	}
	
	@RequestMapping(value = "/about")
	public ModelAndView about() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","About Us");
		mv.addObject("userClickAbout",true);
		return mv;				
	}	
	
	@RequestMapping(value = "/contact")
	public ModelAndView contact() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","Contact Us");
		mv.addObject("userClickContact",true);
		return mv;				
	}	
	
	
	/*
	 * Methods to load all the products and based on category
	 * */
	
	@RequestMapping(value = "/show/all/products")
	public ModelAndView showAllProducts() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","All Products");
		
		//passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		
		mv.addObject("userClickAllProducts",true);
		return mv;				
	}	
	
	@RequestMapping(value = "/show/restaurants")
	public ModelAndView showAllRestaurants() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","Restaurants");
		
		mv.addObject("serviceProvider", serviceProviderDAO.list());
		
		mv.addObject("userClickAllRestaurants",true);
		return mv;				
	}	
	
	
	@RequestMapping(value = "/show/category/{id}/products")
	public ModelAndView showCategoryProducts(@PathVariable("id") int id) {		
		ModelAndView mv = new ModelAndView("page");
		
		// categoryDAO to fetch a single category
		Category category = null;
		
		category = categoryDAO.get(id);
		
		mv.addObject("title",category.getName());
		
		//passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		
		// passing the single category object
		mv.addObject("category", category);
		
		mv.addObject("userClickCategoryProducts",true);
		return mv;				
	}	
	
	
	/*
	 * Viewing a single product
	 * */
	
	@RequestMapping(value = "/show/{id}/product") 
	public ModelAndView showSingleProduct(@PathVariable int id) throws ProductNotFoundException {
		
		ModelAndView mv = new ModelAndView("page");
		
		Product product = productDAO.get(id);
		
		if(product == null) throw new ProductNotFoundException();
		
		// update the view count
		product.setViews(product.getViews() + 1);
		productDAO.update(product);
		//---------------------------
		
		mv.addObject("title", product.getName());
		mv.addObject("product", product);
		
		mv.addObject("userClickShowProduct", true);
		
		
		return mv;
		
	}
	
	
	/**
	 * @return
	 */
	@RequestMapping(value="/membership")
	public ModelAndView register() {
		ModelAndView mv= new ModelAndView("page");
		
		logger.info("Page Controller membership called!");
		
		return mv;
	}
	
	
	
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam(name="error", required = false)	String error,
			@RequestParam(name="logout", required = false) String logout) {
		 
		ModelAndView mv= new ModelAndView("login");
		
		mv.addObject("title", "Login");
		if(error!=null) {
			mv.addObject("message", "Username and Password is invalid!");
		}
		if(logout!=null) {
			mv.addObject("logout", "You have logged out successfully!");
		}
		return mv;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		// Invalidates HTTP Session, then unbinds any objects bound to it.
	    // Removes the authentication from securitycontext 		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
		
		return "redirect:/login?logout";
	}	
	
	
	@RequestMapping(value="/access-denied")
	public ModelAndView accessDenied() {
		ModelAndView mv = new ModelAndView("error");		
		mv.addObject("errorTitle", "Aha! Caught You.");	
		mv.addObject("errorDescription", "You are not authorized to view this page!");		
		mv.addObject("title", "403 Access Denied");		
		return mv;
	}	
	
	
	
	@RequestMapping(value="/charts/bar", method = RequestMethod.GET )
	public String barChart(Model model) { 
		List<Stacked> mem = stackedDAO.list();
	    model.addAttribute("mem", mem);
        return "chart";
	}
	
	@RequestMapping(value="/charts/stacked", method = RequestMethod.GET )
	public String stackedChart(Model model) { 
		List<Stacked> mem = stackedDAO.list();
	    model.addAttribute("mem", mem);
        return "stackedChart";
	}
	
	@RequestMapping(value="/charts/histogram", method = RequestMethod.GET )
	public String histogramChart(Model model) { 
		List<Stacked> mem = stackedDAO.list();
	    model.addAttribute("mem", mem);
        return "multiSeries";
	}
	
	@RequestMapping(value="/charts/pieChart", method = RequestMethod.GET )
	public String pieChart(Model model) { 
		List<Stacked> mem = stackedDAO.list();
	    model.addAttribute("mem", mem);
        return "pieChart";
	}
	
	@RequestMapping(value="/charts/dashboard", method = RequestMethod.GET )
	public String dashboard(Model model) { 
		List<Stacked> mem = stackedDAO.list();
		List<String> mda= new ArrayList<>();
		
		List<Double> salary= new ArrayList<>();
		
		List<Double> staff= new ArrayList<>();
	    model.addAttribute("mem", mem);
	  
	    for(int i = 0; i < mem.size(); i++) {
            
            mda.add("'" +mem.get(i).getMda() + "'");
            salary.add(mem.get(i).getSalary());
            staff.add(mem.get(i).getStaff());
        }
	    model.addAttribute("mda", mda);
	    model.addAttribute("salary", salary);
	    model.addAttribute("staff", staff);
	    
	    Stacked nStacked = new Stacked();
		nStacked.setId(1);
		nStacked.setSalary(8000);

		model.addAttribute("stacked", nStacked);
	    
        return "chartjs";
	}

//	@RequestMapping(value = "/charts/mdaStaffData", method= RequestMethod.POST)
//    public String mdaData(Model model, @RequestParam(name="label", required = false) String label){
//		System.out.println("got here......");
//        List<Object[]> staffList = staffDetailsDAO.list();
//        model.addAttribute("staffList",staffList);
//        model.addAttribute("label",label);
//       return "chartjs";    
//    }
	
	@RequestMapping(value = "/multiselect", method= RequestMethod.GET)
    public String multiSelect(Model model){
		List<EpmRepObjAttr> rep = epmRepObjAttrDAO.list();
	    model.addAttribute("rep", rep);
        return "multiselect";    
    }
	
  @RequestMapping(value = "/multiselect", method= RequestMethod.POST)
  public String mdaData(Model model, @RequestParam(name="label", required = false) int[] collect){
		System.out.println("got here......");
     return "multiselect";    
  }
  
  @RequestMapping(value = "/multisele", method= RequestMethod.GET)
  public String multiSele(Model model){
		List<RalphObj1> rap = ralphObj1DAO.list();
		System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + rap);
	    model.addAttribute("rap", rap);
      return "multiselect";
  }
}