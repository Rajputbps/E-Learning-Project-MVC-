package edu.homeEducation.adminController;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
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

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile; 

import edu.homeEducation.model.Notes;
import edu.homeEducation.serviceDao.NotesServiceDao;

@Controller
public class AdminController {

	@Autowired
	private NotesServiceDao notesServiceDao ;
	
	@RequestMapping("/addCourse")
	public String addCourse(@RequestParam("file") MultipartFile file,HttpServletRequest request) {
//		System.out.println(request.getParameter("user_id"));
//		 int user_id=Integer.parseInt(request.getParameter("user_id"));
		Notes notes = new Notes();
		String notePath = "/home/rajput/College_Project/E_Learning_FrontEnd/src/main/webapp/resources/Cources/Lession/Java/";
		System.out.println("Path found");
		notePath = notePath+String.valueOf(file.getOriginalFilename());
		System.out.println("Path is: "+ notePath);
		if(!file.isEmpty())
		{
		System.out.println(file);
		try
			{
				byte[] bytes=file.getBytes();
				Path  path = Paths.get(notePath);
				Files.write(path, bytes);
     			 System.out.println("File Uploaded Successfully");
     			 notes.setNote_title(file.getOriginalFilename()); 
     			 notesServiceDao.addNote(notes);
			}
		catch(Exception e)
		{
			System.out.println("Exception Arised"+e);
		}
		}
	else
	{
		System.out.println("File is Empty not Uploaded");
	}
		
		return "addded";
	}
//	
//	
//	
//	@RequestMapping("/addinFile")
//	public String addFile(HttpServletRequest request,Notes notes) {
//		try {
//			String note_Title;
//			LocalDate date = LocalDate.now();
//			String data = request.getParameter("file");
//			String noteName=request.getParameter("noteName");
//			String notePath= "/home/rajput/College_Project/E_Learning_FrontEnd/src/main/webapp/resources/Cources/c/";
//			if(noteName !=null) {
//				FileOutputStream out = new FileOutputStream(notePath+noteName);
//				out.write(data.getBytes());
//				out.close();
//				note_Title=noteName;
//			}else {
//				System.out.println("save");
//				LocalTime time = LocalTime.now();
//				FileOutputStream out = new FileOutputStream(notePath.toString()+"Note-"+date.toString()+"-"+time);
//				out.write(data.getBytes());
//				out.close();
//				note_Title = date.toString()+"-"+time;
//				System.out.println(note_Title);
//			}
//			
//			notes.setNote_title("Note-"+note_Title);
//			notes.setSave_Date(date);
//			notes.setUser_Id(1);
//			notesServiceDao.addNote(notes);
//			
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//		return "Admin";
//	}
//	
//
//	@RequestMapping("/readfile")
//	public String readFile(Model model) { 
//		Notes notes = notesServiceDao.getById(1);
//		System.out.println("File is :"+notes.getNote_title());
//		try {
//			String notePath= "/home/rajput/College_Project/E_Learning_FrontEnd/src/main/webapp/resources/Cources/c/";
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
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//		return "Admin";
//	}

	@RequestMapping("/readfile12")
	public String readFile(Model model) {
		try {
			String notePath= "/home/rajput/College_Project/E_Learning_FrontEnd/src/main/webapp/resources/Cources/Lessions/Java/";
			FileInputStream fis = new FileInputStream(notePath+"Final.docx");
			XWPFDocument xdoc = new XWPFDocument(OPCPackage.open(fis));

			List<XWPFParagraph> paragraphList1 = xdoc.getParagraphs(); 
			List<String> list = new ArrayList<String>();
			for (XWPFParagraph paragraph : paragraphList1) {

				
				list.add(paragraph.getText());
//				System.out.println(paragraph.getAlignment());
//				System.out.print(paragraph.getRuns().size());
				//System.out.println(paragraph.getStyle());
				System.out.println(paragraph.getText());
				

				// Returns numbering format for this paragraph, eg bullet or lowerLetter.
//				System.out.println(paragraph.getNumFmt());
//				System.out.println(paragraph.getAlignment());
//
//				System.out.println(paragraph.isWordWrapped());

//				System.out.println("********************************************************************");
			}
			String[] stringArr = list.toArray(new String[0]);
			model.addAttribute("filedd", stringArr);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "Admin";
	}
}
