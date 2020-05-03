package edu.homeEducation.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.homeEducation.model.Notes;
import edu.homeEducation.serviceDao.CourceServiceDao; 
import edu.homeEducation.serviceDao.CourseLessonServiceDao;
import edu.homeEducation.serviceDao.NotesServiceDao;

@Controller
public class UserController {

	@Autowired
	private NotesServiceDao notesServiceDao ;
	
	@Autowired
	private CourseLessonServiceDao courseLessionServiceDao;
	
	@Autowired
	private CourceServiceDao courceServiceDao;
	
	
	
	
	@RequestMapping("/openCourceLession/{courseLession}/{course_id}")
	public String courceD(@PathVariable("courseLession") String courseLession,@PathVariable("course_id") Long id, Model model) { 
		model.addAttribute("courseContent", courceServiceDao.getByCourseId(id));
		model.addAttribute("courseLession", courseLessionServiceDao.getByCourseId(id));
		try {
			String notePath= "/home/rajput/College_Project/E_Learning_FrontEnd/src/main/webapp/resources/Cources/Lessions/";
			BufferedReader in = null;
			if (id==1) {
				in = new BufferedReader(new FileReader(notePath+"HTML/"+courseLession));
			}else if (id==2) {
				in = new BufferedReader(new FileReader(notePath+"C++/"+courseLession));
			}else if (id==3) {
				in = new BufferedReader(new FileReader(notePath+"Java/"+courseLession));
			}else if (id==4) {
				in = new BufferedReader(new FileReader(notePath+"Python/"+courseLession));
			}
			String str="";
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
	
	
	
	
	
	
	
	
	
	
//	@RequestMapping("/addNotes")
//	public String addCourse(@RequestParam("file") MultipartFile file,HttpServletRequest request) {
//		System.out.println(request.getParameter("user_id"));
//		 int user_id=Integer.parseInt(request.getParameter("user_id"));
//		Notes notes = new Notes();
//		String notePath = "/home/rajput/College_Project/E_Learning_FrontEnd/src/main/webapp/resources/Cources/c/";
//		System.out.println("Path found");
//		notePath = notePath+String.valueOf(user_id+"-"+file.getOriginalFilename());
//		System.out.println("Path is: "+ notePath);
//		if(!file.isEmpty())
//		{
//		System.out.println(file);
//		try
//			{
//				byte[] bytes=file.getBytes();
//				Path  path = Paths.get(notePath);
//				Files.write(path, bytes);
//     			 System.out.println("File Uploaded Successfully");
//     			 notes.setNote_title(user_id+"-"+file.getOriginalFilename());
//     			 notes.setUser_Id(user_id);
//     			 notesServiceDao.addNote(notes);
//			}
//		catch(Exception e)
//		{
//			System.out.println("Exception Arised"+e);
//		}
//		}
//	else
//	{
//		System.out.println("File is Empty not Uploaded");
//	}
//		
//		return "addded";
//	}
	
	
	
	@RequestMapping("/addNotes")
	public String addFile(HttpServletRequest request,Notes notes) {
		try {
			String note_Title;
			LocalDate date = LocalDate.now();
			String data = request.getParameter("file");
			String noteName=request.getParameter("noteName");
			String notePath= "/home/rajput/College_Project/E_Learning_FrontEnd/src/main/webapp/resources/Cources/c/";
			if(noteName !=null) {
				FileOutputStream out = new FileOutputStream(notePath+noteName);
				out.write(data.getBytes());
				out.close();
				note_Title=noteName;
			}else {
				System.out.println("save");
				LocalTime time = LocalTime.now();
				FileOutputStream out = new FileOutputStream(notePath.toString()+"Note-"+date.toString()+"-"+time);
				out.write(data.getBytes());
				out.close();
				note_Title = date.toString()+"-"+time;
				System.out.println(note_Title);
			}
			
			notes.setNote_title("Note-"+note_Title);
			notes.setSave_Date(date);
			notes.setUser_Id(1);
			notesServiceDao.addNote(notes);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return "Admin";
	}
	

	@RequestMapping("/readfile1")
	public String readFile(Model model) { 
		Notes notes = notesServiceDao.getById(1);
		System.out.println("File is :"+notes.getNote_title());
		try {
			String notePath= "/home/rajput/College_Project/E_Learning_FrontEnd/src/main/webapp/resources/Cources/Lessions/Java/";
			BufferedReader in = new BufferedReader(new FileReader(notePath+"Introduction"));
			String str;
			List<String> list = new ArrayList<String>();
			while((str = in.readLine()) != null){
			    list.add(str);
			}

			String[] stringArr = list.toArray(new String[0]);
			
			for(int i=0;i<stringArr.length;i++) {
				System.out.println(stringArr[i]);
			}
			model.addAttribute("filedd", stringArr);
			
//			File file = new File(notePath+notes.getNote_title());
//			 FileReader fr = new FileReader(file);
//			    BufferedReader br = new BufferedReader(fr);
//			 
//			    String line;
//			    while((line = br.readLine()) != null)
//			    {
//			    	System.out.println(line);
//			    }
//			    model.addAttribute("note", line = br.readLine());
//			    br.close();
//			    fr.close();			
		} catch (Exception e) {
			System.out.println(e);
		}
		return "Admin";
	}
	
	
	
}
