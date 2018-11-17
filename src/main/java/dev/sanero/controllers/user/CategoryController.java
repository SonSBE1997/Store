package dev.sanero.controllers.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import dev.sanero.services.LaptopService;
import dev.sanero.services.ProducerService;
import dev.sanero.utils.Common;
import dev.sanero.utils.Helper;

@Controller
@RequestMapping("/category")
class CategoryController {
	@Autowired
	LaptopService laptopService;

	@Autowired
	ProducerService producerService;

	@GetMapping("/{id}")
	public String index(@PathVariable(name = "id") int producerId, HttpSession session, ModelMap model) {
		Common.checkSessionPageUser(session, model, producerService);

		return "user/category/index";
	}

	@GetMapping(path = "/hot/{page}")
	public String hot(@PathVariable int page, HttpSession session, ModelMap model) {
		Common.checkSessionPageUser(session, model, producerService);
		model.addAttribute("lsHot", laptopService.getListLaptopHotByPage(page, Helper.USER_PAGE_SIZE));
		model.addAttribute("pageCount",
				(int) Math.ceil(1.0 * laptopService.getLaptopHotCount() / Helper.USER_PAGE_SIZE));
		model.addAttribute("currentPage", page);
		return "user/category/hot";
	}

	@GetMapping(path = "/discount/{page}")
	public String discount(@PathVariable int page, HttpSession session, ModelMap model) {
		Common.checkSessionPageUser(session, model, producerService);
		model.addAttribute("lsDiscount", laptopService.getListLaptopDiscountByPage(page, Helper.USER_PAGE_SIZE));
		model.addAttribute("pageCount",
				(int) Math.ceil(1.0 * laptopService.getLaptopDiscountCount() / Helper.USER_PAGE_SIZE));
		model.addAttribute("currentPage", page);
		return "user/category/discount";
	}
}
