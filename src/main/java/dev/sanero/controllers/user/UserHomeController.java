package dev.sanero.controllers.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class UserHomeController {

	@GetMapping
	public String home() {
		return "user/home";
	}
}
