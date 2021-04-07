package net.kzn.onlineshopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.security.crypto.password.PasswordEncoder;

import net.kzn.onlineshopping.service.LeaveService;
import net.kzn.onlineshopping.util.FileUtil;
import net.kzn.onlineshopping.validator.ProductValidator;
import net.kzn.shoppingbackend.dao.CategoryDAO;
import net.kzn.shoppingbackend.dao.LeaveDAO;
import net.kzn.shoppingbackend.dao.ProductDAO;
import net.kzn.shoppingbackend.dao.StaffRecordDAO;
import net.kzn.shoppingbackend.dao.UserDAO;
import net.kzn.shoppingbackend.dto.Category;
import net.kzn.shoppingbackend.dto.Leave1;
import net.kzn.shoppingbackend.dto.Product;
import net.kzn.shoppingbackend.dto.StaffRecord;
import net.kzn.shoppingbackend.dto.User;

@Controller
@RequestMapping("/manageStaff")
public class StaffRecordController {
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);

	@Autowired
	private StaffRecordDAO staffRecordDAO;
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private LeaveDAO leaveDAO;
	@Autowired
	private LeaveService leaveService;

	@RequestMapping("/product")
	public ModelAndView manageProduct(@RequestParam(name="success",required=false)String success) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Staff Management");		
		mv.addObject("userClickManageStaff",true);
		
		//Product nProduct = new Product();
		
		// assuming that the user is ADMIN
		// later we will fixed it based on user is SUPPLIER or ADMIN
		//nProduct.setSupplierId(1);
		//nProduct.setActive(true);

		mv.addObject("product", new StaffRecord());

		
		if(success != null) {
			if(success.equals("staff")){
				mv.addObject("message", "Staff submitted successfully!");
			}	
			else if (success.equals("category")) {
				mv.addObject("message", "Category submitted successfully!");
			}
		}
			
		return mv;
		
	}
	
	
	@RequestMapping("/annualLeave")
	public ModelAndView manageAnnualLeave(@RequestParam(name="success",required=false)String success) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Staff Management");		
		mv.addObject("userClickManageAnnualLeave",true);
		
		//Product nProduct = new Product();
		
		// assuming that the user is ADMIN
		// later we will fixed it based on user is SUPPLIER or ADMIN
		//nProduct.setSupplierId(1);
		//nProduct.setActive(true);

		mv.addObject("product", new Leave1());

		
		if(success != null) {
			if(success.equals("unavailable")){
				mv.addObject("message", "The value you entered has exceeded your leave ballance!");
			}	
			else if (success.equals("updated")) {
				mv.addObject("message", "Your Leave has been created successfully!");
			}
		}
			
		return mv;
		
	}
	
	@RequestMapping("/sickLeave")
	public ModelAndView manageSickLeave(@RequestParam(name="success",required=false)String success) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Staff Management");		
		mv.addObject("userClickManageSickLeave",true);
		
		//Product nProduct = new Product();
		
		// assuming that the user is ADMIN
		// later we will fixed it based on user is SUPPLIER or ADMIN
		//nProduct.setSupplierId(1);
		//nProduct.setActive(true);

		mv.addObject("product", new Leave1());

		
		if(success != null) {
			if(success.equals("unavailable")){
				mv.addObject("message", "The value you entered has exceeded your leave ballance!");
			}	
			else if (success.equals("updated")) {
				mv.addObject("message", "Your Leave has been created successfully!");
			}
		}
			
		return mv;
		
	}
	
	@RequestMapping("/examLeave")
	public ModelAndView manageExamLeave(@RequestParam(name="success",required=false)String success) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Staff Management");		
		mv.addObject("userClickManageExamLeave",true);
		
		//Product nProduct = new Product();
		
		// assuming that the user is ADMIN
		// later we will fixed it based on user is SUPPLIER or ADMIN
		//nProduct.setSupplierId(1);
		//nProduct.setActive(true);

		mv.addObject("product", new Leave1());

		
		if(success != null) {
			if(success.equals("unavailable")){
				mv.addObject("message", "The value you entered has exceeded your leave ballance!");
			}	
			else if (success.equals("updated")) {
				mv.addObject("message", "Your Leave has been created successfully!");
			}
		}
			
		return mv;
		
	}
	
	
	
//	@RequestMapping("/leave")
//	public ModelAndView manageLeave() {		
//
//		ModelAndView mv = new ModelAndView("page");	
//		mv.addObject("title","Staff Management");		
//		mv.addObject("userClickManageLeave",true);
//		
//		//Product nProduct = new Product();
//		
//		// assuming that the user is ADMIN
//		// later we will fixed it based on user is SUPPLIER or ADMIN
//		//nProduct.setSupplierId(1);
//		//nProduct.setActive(true);
//
//		mv.addObject("product", new Leave1());
//
//		return mv;
//		
//		}
			
		
		

	@RequestMapping("/leaveHistory")
	public ModelAndView leaveHistory() {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Leave History");		
		mv.addObject("userClickLeaveHistory",true);

			
		return mv;
		
	}
	
	@RequestMapping("/approval")
	public ModelAndView approval() {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Leave Approval");		
		mv.addObject("userClickApproval",true);

		String name = "$2a$10$owitYIK1QOAj7Sg0T1k1JePJi1k6q6etj2mSYsdQFuQAkjfGrKps2 "
				+ "javatechiedb.celd7xxo3ca8.us-east-2.rds.amazonaws.com:3306"
				+ "http://ec2-3-138-182-183.us-east-2.compute.amazonaws.com:8080/onlineshopping/"
				+ ""
				+ "http://ec2-3-138-182-183.us-east-2.compute.amazonaws.com:8080/onlineshopping";
		return mv;
		
		
	}
	
	@RequestMapping("/{id}/product")
	public ModelAndView manageProductEdit(@PathVariable int id) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Staff Management");		
		mv.addObject("userClickManageStaff",true);
			
		mv.addObject("product", userDAO.get(id));

			
		return mv;
		
	}
	
	@RequestMapping("/{annualLeaveApplied}/update")
	public String udpateCartLine(@PathVariable int annualLeaveApplied, @RequestParam int days, 
			@ModelAttribute("product") Leave1 leave, BindingResult result,
			Model model, HttpServletRequest request) {
		
		if(annualLeaveApplied == 1) {
		
		String response = leaveService.manageLeave(1, days, leave);		
		return "redirect:/manageStaff/annualLeave?"+response;		
		}
		
		if(annualLeaveApplied == 2) {
			
		String response = leaveService.manageLeave(2, days, leave);		
		return "redirect:/manageStaff/sickLeave?"+response;		
		}
		
		if(annualLeaveApplied == 3) {
			
		String response = leaveService.manageLeave(3, days, leave);		
		return "redirect:/manageStaff/examLeave?"+response;		
		}
		return null;}
	
	
	@RequestMapping(value = "/product", method=RequestMethod.POST)
	public String managePostProduct(@ModelAttribute("product") User staffRecord, 
			BindingResult results, Model model, HttpServletRequest request) {
		staffRecord.setActive(true);
		staffRecord.setContactNumber("6237");
		staffRecord.setEmail("admin@gmail.com");
		staffRecord.setEnabled(true);
		staffRecord.setManagerId(1);
		staffRecord.setRole("USER");
		staffRecord.setPassword(passwordEncoder.encode("password"));
		
		
		if(staffRecord.getId() == 0 ) {
			userDAO.add(staffRecord);
		}
		else {
			userDAO.update(staffRecord);
		}
		
		return "redirect:/manageStaff/product?success=staff";
	}
	
	@ModelAttribute("lineManagers") 
	public List<User> lineManagers() {
		return userDAO.listLineManagers();
	}
	
	@RequestMapping("/{id}/delete")
	public ModelAndView manageProductDelete(@PathVariable int id, @ModelAttribute("product") User objectToDelete, 
			BindingResult results) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Staff Management");
		userDAO.delete(objectToDelete);
		mv.addObject("userClickManageStaff",true);

		return mv;
		
	}
}
