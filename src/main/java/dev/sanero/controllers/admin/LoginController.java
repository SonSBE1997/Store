package dev.sanero.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String signin(@ModelAttribute User user, ModelMap model, RedirectAttributes attributes) {
		if (employeeService.checkLogin(user)) {
			User userLogin = employeeService.getUserInfoByUsername(user.getUsername());
			userLogin.setPassword(user.getPassword());
			model.addAttribute("userSession", userLogin);
			return "redirect:/admin";
		}
		attributes.addFlashAttribute("loginMess", "Mật khẩu không đúng");
		return "redirect:/admin/login";
	}

	@ResponseBody
	@PostMapping(path = "/exist")
	public String checkUserExist(@RequestParam String username) {
		if (username == "")
			return "";
		if (!employeeService.checkUsernameExist(username))
			return "notExist";
		return "";
	}
}
