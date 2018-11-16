package dev.sanero.controllers.user;

import java.sql.Timestamp;
import java.util.Date;

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

import dev.sanero.entities.Customer;
import dev.sanero.services.CustomerService;
import dev.sanero.utils.User;

@Controller
@RequestMapping("/login")
@SessionAttributes(names = "loginSession")
public class UserLoginController {
	@Autowired
	CustomerService customerService;

	@GetMapping
	public String login() {
		return "user/login";
	}

	@PostMapping
	public String signin(@ModelAttribute User user, ModelMap model, RedirectAttributes attributes) {
		if (customerService.checkLogin(user)) {
			User userLogin = customerService.getUserInfoByUsername(user.getUsername());
			userLogin.setPassword(user.getPassword());
			model.addAttribute("loginSession", userLogin);
			return "redirect:/";
		}
		attributes.addFlashAttribute("loginMess", "Mật khẩu không đúng");
		return "redirect:/login";
	}

	@ResponseBody
	@PostMapping(path = "/exist")
	public String checkUserExist(@RequestParam String username) {
		if (username == "")
			return "";
		if (!customerService.checkUsernameExist(username))
			return "notExist";
		return "exist";
	}

	@GetMapping("/signup")
	public String signup() {
		return "user/signup";
	}

	@PostMapping("/signup")
	public String signup(@ModelAttribute Customer customer, ModelMap model) {
		customer.setCreated_at(new Timestamp(new Date().getTime()));
		customerService.insert(customer);
		int id = customerService.getIdByUsername(customer.getUsername());
		User userLogin = new User(id, customer.getUsername(), customer.getPassword(), customer.getName());
		model.addAttribute("loginSession", userLogin);
		return "redirect:/";
	}
}
