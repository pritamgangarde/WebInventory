package com.freemind.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

/*	@Autowired
	CreateSetup createSetup;
	@Autowired
	UserService userService;
	@Autowired
	LoginService loginService;*/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request) {

		//createSetup.makeSetup(request);
		return new ModelAndView("Login");
	}
	
	  @RequestMapping(value = "/login", method = RequestMethod.GET)
	    public String login(ModelMap model,HttpServletRequest request) {
		  //createSetup.makeSetup(request);
		  //HttpSession session = request.getSession(true);
		  //session.setAttribute("userId", );
		  return "Login";
	    }
	 
	    @RequestMapping(value = "/accessdenied", method = RequestMethod.GET)
	    public String loginerror(ModelMap model) {
	        model.addAttribute("error", "true");
	        return "denied";
	    }
	 
	    @RequestMapping(value = "/logout", method = RequestMethod.GET)
	    public String logout(ModelMap model) {
	        return "logout";
	    }
	    @RequestMapping(value = "/home", method = RequestMethod.GET)
	  //  @PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR')")
		public ModelAndView loginSuccess(Model model,HttpServletRequest request) {
	    	 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	         String userName = auth.getName();
	         HttpSession session = request.getSession(true);
			 session.setAttribute("userName", userName);
	         System.out.println(userName);
	         //UserModel userModel=loginService.getUserByUname(userName);
	         //List<String> userPermission=userService.userPermissionList(userModel);
	         //session.setAttribute("permissionList", userPermission);
	         //model.addAttribute("userModel",userModel);
	         //model.addAttribute("permissionList",userPermission);
			return new ModelAndView("Home");
		}
}
