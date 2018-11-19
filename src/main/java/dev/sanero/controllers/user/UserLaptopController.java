package dev.sanero.controllers.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import dev.sanero.entities.Laptop;
import dev.sanero.services.LaptopService;
import dev.sanero.services.ProducerService;
import dev.sanero.utils.Common;
import dev.sanero.utils.Helper;

@Controller
@RequestMapping(path = "/laptop")
public class UserLaptopController {
	@Autowired
	ProducerService producerService;
	@Autowired
	LaptopService laptopService;

	@GetMapping("/{page}")
	public String index(@PathVariable int page, HttpSession session, ModelMap model) {
		Common.checkSessionPageUser(session, model, producerService);
		model.addAttribute("lsLaptop", laptopService.getListLaptopByPage(page, Helper.USER_PAGE_SIZE));
		model.addAttribute("pageCount", (int) Math.ceil(1.0 * laptopService.getLaptopCount() / Helper.USER_PAGE_SIZE));
		model.addAttribute("currentPage", page);
		return "user/laptop/index";
	}

	@GetMapping("/detail/{id}")
	public String detail(@PathVariable int id, HttpSession session, ModelMap model) {
		Common.checkSessionPageUser(session, model, producerService);
		Laptop laptop = laptopService.getLaptopById(id);
		model.addAttribute("laptop", laptop);
		model.addAttribute("config", laptop.getConfiguration());
		model.addAttribute("relate",
				laptopService.getListLaptopByProducerId(laptop.getConfiguration().getProducer().getId()));
		return "user/laptop/detail";
	}
}
