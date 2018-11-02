package dev.sanero.controllers.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin")
public class HomeController {
	@GetMapping
	public String home(HttpSession session) {

		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		return "admin/home";
	}
}
