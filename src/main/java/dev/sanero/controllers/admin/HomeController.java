package dev.sanero.controllers.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dev.sanero.utils.User;

@Controller
@RequestMapping(value = "/admin")
public class HomeController {
	@GetMapping
	public String home(HttpSession session, ModelMap model) {

		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		return "admin/home";
	}
}
