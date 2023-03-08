package com.learning.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.learning.beans.Emp;
import com.learning.beans.LoginUser;
import com.learning.dao.EmpDao;
import com.learning.beans.Users;


@Controller
public class EmpController {
	
	
	@Autowired
	EmpDao dao;// will inject dao from xml file

	/*
	 * It displays a form to input data, here "command" is a reserved request
	 * attribute which is used to display object data into form
	 */
	@RequestMapping("/empform")
	public String showform(Model m) {
		if(dao.getStatus()) {
			m.addAttribute("command", new Emp());
			return "empform";
		}
		else {
			return "loginform";
		}
		
	}

	/*
	 * It saves object into database. The @ModelAttribute puts request data into
	 * model object. You need to mention RequestMethod.POST method because
	 * default request is GET
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("emp") Emp emp) {
		if(dao.getStatus()) {
			dao.save(emp);
			return "redirect:/viewemp";// will redirect to viewemp request mapping
		}
		else {
			return "redirect:/loginform";
		}
	}
	
	
	@RequestMapping(value="/signup" , method = RequestMethod.POST)
	public String signup(@ModelAttribute("users") Users users) {
		
		dao.insert(users);
		return "redirect:/loginform";
		
	}
	/* It provides list of employees in model object */
	@RequestMapping("/viewemp")
	public String viewemp(Model m) {
		if(dao.getStatus()) {
		List<Emp> list = dao.getEmployees();
		m.addAttribute("list", list);
		return "viewemp";
		}
		else {
			return "loginform";
		}
	}

	/*
	 * It displays object data into form for the given id. The @PathVariable
	 * puts URL data into variable.
	 */
	@RequestMapping(value = "/editemp/{id}")
	public String edit(@PathVariable int id, Model m) {
		if(dao.getStatus()) {
		Emp emp = dao.getEmpById(id);
		m.addAttribute("command", emp);
		
		return "empeditform";
		}
		else {
			return "loginform";
		}
	}

	/* It updates model object. */
	@RequestMapping(value = "/editsave", method = RequestMethod.POST)
	public String editsave(@ModelAttribute("emp") Emp emp) {
		if(dao.getStatus()) {
		dao.update(emp);
		return "redirect:/viewemp";
		}
		else {
			return "redirect:/loginform";
		}
	}

	/* It deletes record for the given id in URL and redirects to /viewemp */
	@RequestMapping(value = "/deleteemp/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id) {
		if(dao.getStatus()) {
		dao.delete(id);
		return "redirect:/viewemp";
		}
		else {
			return "redirect:/loginform";
		}
	}
	
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public String login(@ModelAttribute("login") LoginUser login) {
//		if(dao.log(login)) {
//			
//			return "redirect:/home";
//		}
//		return "redirect:/loginform";
//	}
//	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//	public String logout(@ModelAttribute("loginuser") LoginUser loginuser) {
//		dao.logout(loginuser);
//		
//		return "redirect:/loginform";
//	}
	
	@PostMapping("/login")
	public String userLogin(HttpSession session, @ModelAttribute("loginuser") LoginUser loginuser, Model model) {
	   
		if (dao.log(loginuser)) {
	        
	        dao.setUserName(loginuser.getUser());
	        dao.setPassWord(loginuser.getPass());
			session.setAttribute("userlogin", loginuser);
	        if(dao.getStatus()) {
	        return "redirect:/home";
	        }
	        else {
	        	return "redirect:/loginform";
	        }
	    } else {
	        model.addAttribute("message", "Login failed. Try again.");
	        return "redirect:/loginform";
	    }
	   
	    
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session , @ModelAttribute("loginuser") LoginUser loginuser, Model model ) {
		
		dao.logout(loginuser);
	    session.invalidate();
	    return "redirect:/loginform";
	    
		
	} 
	
//	@GetMapping("/info")
//    public String userInfo(HttpSession session) {
//		return "userlogin";
//}
	
	@RequestMapping("/usersform")
	public String showusersform(Model m) {
		if(dao.getStatus()) {
		m.addAttribute("command", new Users());
		return "usersform";
		}
		else {
			return "loginform";
		}
	}
	
	@RequestMapping("/home")
	public String show(Model m) {
		if(dao.getStatus()) {
		m.addAttribute("command", new LoginUser());
		return "home";
		}
		else {
			return "loginform";
		}
		
	}
	
	@RequestMapping("/loginform")
	public String showloginform(Model m) {
		
		m.addAttribute("command", new LoginUser());
		return "loginform";
	}

}