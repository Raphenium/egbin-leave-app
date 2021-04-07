package net.kzn.onlineshopping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.kzn.shoppingbackend.dao.LeaveDAO;
import net.kzn.shoppingbackend.dao.StaffRecordDAO;
import net.kzn.shoppingbackend.dao.UserDAO;
import net.kzn.shoppingbackend.dto.Leave1;
import net.kzn.shoppingbackend.dto.StaffRecord;
import net.kzn.shoppingbackend.dto.User;

@Controller
@RequestMapping("/json/data")
public class JsonDataStaffController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private LeaveDAO leaveDAO;
	
	@RequestMapping("/admin/all/staff")
	@ResponseBody
	public List<User> getAllStaffList() {		
		return userDAO.list();
				
	}
	
	@RequestMapping("/admin/all/leave")
	@ResponseBody
	public List<Leave1> getAllLeaveList() {		
		return leaveDAO.list();
				
	}


}
