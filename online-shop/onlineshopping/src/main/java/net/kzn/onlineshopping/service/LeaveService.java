package net.kzn.onlineshopping.service;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import net.kzn.onlineshopping.model.UserModel;
import net.kzn.shoppingbackend.dao.LeaveDAO;
import net.kzn.shoppingbackend.dao.StaffRecordDAO;
import net.kzn.shoppingbackend.dao.UserDAO;
import net.kzn.shoppingbackend.dto.Leave1;
import net.kzn.shoppingbackend.dto.StaffRecord;
import net.kzn.shoppingbackend.dto.User;

@Service("leaveService")
public class LeaveService {

	@Autowired
	private StaffRecordDAO staffRecordDAO;
	
	@Autowired
	private LeaveDAO leaveDAO;
	
	@Autowired
	private UserDAO userDAO;
		
	@Autowired
	private HttpSession session;
	
	/* to update the cart count */
	public String manageLeave(int few, int days, Leave1 leave) {
		User staff = userDAO.getByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
		if (few == 1) {
			int oldAnnualLeaveBallance = staff.getAnnualLeaveBallance();
			if(oldAnnualLeaveBallance < days) {
				return "success=unavailable";
			}else {
				staff.setAnnualLeaveBallance(oldAnnualLeaveBallance - days);
				leave.setCreatedDate(LocalDate.now());
				leave.setAnnualLeaveApplied(days);
				leave.setUser(staff);
//				leave.setStartDate(leave.getStartDate());
//				leave.setEndDate(leave.getEndDate());
//				leave.setResumptionDate(leave.getResumptionDate());
				userDAO.update(staff);
				leaveDAO.add(leave);
				return "success=updated";
			}
		}else if (few == 2) {
			
			int oldSickLeaveBallance = staff.getSickLeaveBallance();
			if(oldSickLeaveBallance < days) {
				return "success=unavailable";
			}else {
				staff.setSickLeaveBallance(oldSickLeaveBallance - days);
				leave.setCreatedDate(LocalDate.now());
				leave.setSickLeaveApplied(days);
				leave.setUser(staff);
				userDAO.update(staff);
				leaveDAO.add(leave);
				return "success=updated";
			}
		}else if (few == 3) {
			
			int oldExamLeaveBallance = staff.getExamLeaveBallance();
			if(oldExamLeaveBallance < days)  {
				return "success=unavailable";
			}else {
				staff.setExamLeaveBallance(oldExamLeaveBallance - days);
				leave.setCreatedDate(LocalDate.now());
				leave.setExamLeaveApplied(days);
				leave.setUser(staff);
				userDAO.update(staff);
				leaveDAO.add(leave);
				return "success=updated";
			}
		}
			
		return null;
	}
				
	private User getStaff() {
		return ((UserModel)session.getAttribute("userModel")).getUser();
	}

	}
