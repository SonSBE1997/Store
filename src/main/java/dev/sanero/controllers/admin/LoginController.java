package dev.sanero.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import dev.sanero.services.EmployeeService;
import dev.sanero.utils.User;

@Controller
@RequestMapping(value = "/admin/login")
@SessionAttributes(names = "userSession")
public class LoginController {
	@Autowired
	EmployeeService employeeService;

	@GetMapping
	public String login() {
		return "admin/login";
	}

	@PostMapping
	public String signin(@ModelAttribute User user, ModelMap model) {
		if (employeeService.checkLogin(user)) {
			model.addAttribute("userSession", user);
			return "redirect:/admin";
		}
		return "redirect:/admin/login";
	}
}
