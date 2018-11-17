package dev.sanero.controllers.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dev.sanero.services.LaptopService;
import dev.sanero.services.ProducerService;
import dev.sanero.utils.Common;

@Controller
@RequestMapping(value = "/")
public class UserHomeController {
	@Autowired
	LaptopService laptopService;
	@Autowired
	ProducerService producerService;

	@GetMapping
	public String home(HttpSession session, ModelMap model) {
		Common.checkSessionPageUser(session, model);
		model.addAttribute("laptopDiscount", laptopService.getListLaptopIsDiscount());
		model.addAttribute("laptopHot", laptopService.getListLaptopIsHot());
		model.addAttribute("lsProducer", producerService.getListProducer());
		return "user/home";
	}

	@GetMapping(path = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginSession");
		System.out.println("logout");
		return "redirect:/";
	}
}
