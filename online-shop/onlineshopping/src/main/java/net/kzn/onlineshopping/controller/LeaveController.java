package net.kzn.onlineshopping.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.kzn.onlineshopping.model.UserModel;
import net.kzn.onlineshopping.service.CartService;
import net.kzn.onlineshopping.service.LeaveService;
import net.kzn.shoppingbackend.dao.LeaveDAO;
import net.kzn.shoppingbackend.dto.Leave1;
import net.kzn.shoppingbackend.dto.StaffRecord;

@Controller
@RequestMapping("/leave")
public class LeaveController {

	private final static Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private HttpSession session;
	@Autowired
	private CartService cartService;
	@Autowired
	private LeaveService leaveService;
	@Autowired
	private LeaveDAO leaveDAO;
	@RequestMapping("/show")
	public ModelAndView showCart(@RequestParam(name = "result", required = false) String result) {
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Shopping Cart");
		
		if(result!=null) {
			switch(result) {
				case "added":
					mv.addObject("message", "Product has been successfully added inside cart!");					
					
					break;
				case "unavailable":
					mv.addObject("message", "Product quantity is not available!");					
					break;
				case "updated":
					mv.addObject("message", "Cart has been updated successfully!");				
					break;
				case "modified":
					mv.addObject("message", "One or more items inside cart has been modified!");
					break;
				case "maximum":
					mv.addObject("message", "Maximum limit for the item has been reached!");
					break;
				case "deleted":
					mv.addObject("message", "CartLine has been successfully removed!");
					break;

			}
		}
		
		
		


		mv.addObject("userClickManageLeave",true);
		return mv;
		 
	}
	
//	private Leave getLeave() {
//		return ((UserModel)session.getAttribute("userModel")).getLeave();
//	}
	
//	@RequestMapping("/{annualLeaveApplied}/update")
//	public String udpateCartLine(@PathVariable int annualLeaveApplied, @RequestParam int days, 
//			@ModelAttribute("product") Leave1 leave, BindingResult result,
//			Model model, HttpServletRequest request) {
//		
//		if(annualLeaveApplied == 1) {
//			leaveDAO.add(leave);
//		String response = leaveService.manageLeave(1, days, leave);		
//		return "redirect:/leave/show?"+response;		
//	}
//		return null;}
	
	@RequestMapping("/add/{productId}/product")
	public String addCartLine(@PathVariable int productId) {
		String response = cartService.addCartLine(productId);
		return "redirect:/cart/show?"+response;
	}
	
	@RequestMapping("/{cartLineId}/remove")
	public String removeCartLine(@PathVariable int cartLineId) {
		String response = cartService.removeCartLine(cartLineId);
		return "redirect:/cart/show?"+response;
	}
	
	/* after validating it redirect to checkout
	 * if result received is success proceed to checkout 
	 * else display the message to the user about the changes in cart page
	 * */	
	@RequestMapping("/validate")
	public String validateCart() {	
		String response = cartService.validateCartLine();
		if(!response.equals("result=success")) {
			return "redirect:/cart/show?"+response;
		}
		else {
			return "redirect:/cart/checkout";
		}
	}	
}
