package edu.homeEducation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import edu.homeEducation.model.Users;
import edu.homeEducation.serviceDao.CourceServiceDao;
import edu.homeEducation.serviceDao.NotesServiceDao;
import edu.homeEducation.serviceDao.UserServiceDao;

@ControllerAdvice
public class GlobalController {

	@Autowired
	private UserServiceDao userServiceDao;
	
	@Autowired
	private CourceServiceDao courceServiceDao;
	
	@Autowired
	private NotesServiceDao notesServiceDao ;
	
	@ModelAttribute
    public void initList(Model model) { 
		model.addAttribute("courseName", courceServiceDao.getAllCources());
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userDetails = auth.getName();
	    if(userDetails!="anonymousUser") {
	    	Users users = userServiceDao.getByEmail(userDetails);
	    	model.addAttribute("userDetails",users);
	    	model.addAttribute("notesList", notesServiceDao.getByUserId(users.getUser_id()));
	    }

	    }
	
}
