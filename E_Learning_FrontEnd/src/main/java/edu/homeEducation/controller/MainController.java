package edu.homeEducation.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.homeEducation.model.Courses;
import edu.homeEducation.model.UserRegisteredCourse;
import edu.homeEducation.model.Users;
import edu.homeEducation.serviceDao.CourceServiceDao; 
import edu.homeEducation.serviceDao.CourseLessonServiceDao;
import edu.homeEducation.serviceDao.UserRegisterCourseServiceDao;
import edu.homeEducation.serviceDao.UserServiceDao;

@Controller
public class MainController {
 
	@Autowired
	private CourceServiceDao courceServiceDao; 
	
	@Autowired
	private UserServiceDao userServiceDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder ;
	
	@Autowired
	private UserRegisterCourseServiceDao userRegisterCourseServiceDao ;
	
	@Autowired
	private CourseLessonServiceDao courseLessionServiceDao;
	
	@RequestMapping("/") 
	public String home(Model model) { 
		model.addAttribute("usersDetail", userServiceDao.getUserList());
		return "home";
	}
	
	@PostMapping("/addCource")
	public void addCouce(@Valid @ModelAttribute("courses") Courses courses,Model model) { 
		courceServiceDao.addCources(courses);
	}
 

	
	@RequestMapping("/addUser1")
	public String addUserDetail(HttpServletRequest request)
	{
		Users users  =new Users();
		System.out.println(request.getParameter("f_name"));
		users.setF_name(request.getParameter("f_name"));
		users.setL_name(request.getParameter("l_name"));
		users.setEmail(request.getParameter("email"));
		users.setMobile_number(Long.parseLong(request.getParameter("phone")));
		users.setPassword(passwordEncoder.encode(request.getParameter("password")));
		userServiceDao.addUser(users);
		return "/";
	}
	 
//	
//	@RequestMapping("/loginUser")
//	public String loginUser(HttpServletRequest servletRequest) {
//		userServiceDao.login(servletRequest.getParameter("username"), servletRequest.getParameter("password"), null);
//		System.out.println(servletRequest.getContextPath());
//		String returnPath=servletRequest.getContextPath();
//		return returnPath;
//	}
	
	@RequestMapping("/courceDetail{course_id}")
	public String courceD(@PathVariable("course_id") Long id, Model model) {
		System.out.println(id);
		model.addAttribute("courseContent", courceServiceDao.getByCourseId(id));
		model.addAttribute("courseLession", courseLessionServiceDao.getByCourseId(id));
		 
		try {
			String notePath= "/home/rajput/College_Project/E_Learning_FrontEnd/src/main/webapp/resources/Cources/Lessions/";
			BufferedReader in = null;
			if (id==1) {
				in = new BufferedReader(new FileReader(notePath+"HTML/Introduction"));
			}else if (id==2) {
				in = new BufferedReader(new FileReader(notePath+"C++/Introduction"));
			}else if (id==3) {
				in = new BufferedReader(new FileReader(notePath+"Java/Introduction"));
			}else if (id==4) {
				in = new BufferedReader(new FileReader(notePath+"Python/Introduction"));
			}
			String str;
			List<String> list = new ArrayList<String>();
			while((str = in.readLine()) != null){
			    list.add(str);
			}
			String[] stringArr = list.toArray(new String[0]);
			model.addAttribute("filedd", stringArr);
		} catch (Exception e) {
			System.out.println(e);
		}
		return "openBook";
	}
	@RequestMapping("/registerCource{course_id}")
	public String registerCourse(@PathVariable("course_id") Long id,UserRegisteredCourse registeredCourse) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		registeredCourse.setCourse_id(id);
		Users users = userServiceDao.getByEmail(auth.getName()) ;
		registeredCourse.setUser_id(users.getUser_id());
		registeredCourse.setRegistered_date(LocalDate.now());
		userRegisterCourseServiceDao.registerCourse(registeredCourse);
		return"redirect:/allCourses";
	}
	@RequestMapping("/adminPanal")
	String admin() {
		return "Admin";
	}
	
	
	@RequestMapping("/questionPortal")
	public String portal() {
		return "questionPortal";
	}
	
	@RequestMapping("/adduser")
	public String adduser(@ModelAttribute("users")Users users) {
		userServiceDao.addUser(users);
		return "allCourses";
	}
	
	@RequestMapping("/UserLogin")
	public String loginError() {
		return "Admin";
	}
	
	@RequestMapping("/allCorse")
	public String allCourse() {
		return "allCourses";
	}
	
	@RequestMapping("/perform_logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		
		return "redirect:/";
		
	}
	
	@RequestMapping("/code")
	public String code() {
		return "Code";
	}
	
}
