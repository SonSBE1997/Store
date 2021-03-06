package dev.sanero.controllers.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@GetMapping("/{id}/{page}")
	public String index(@PathVariable(name = "id") int producerId, @PathVariable int page, HttpSession session,
			ModelMap model) {
		Common.checkSessionPageUser(session, model, producerService);
		model.addAttribute("lsLaptop",
				laptopService.getListLaptopByProducerIdAndPaging(producerId, page, Helper.USER_PAGE_SIZE));
		model.addAttribute("pageCount",
				(int) Math.ceil(1.0 * laptopService.getLaptopCountByProducerId(producerId) / Helper.USER_PAGE_SIZE));
		model.addAttribute("currentPage", page);
		model.addAttribute("producer", producerService.getProducerById(producerId));
		return "user/category/index";
	}

	@PostMapping("/{id}/{page}")
	public String index(@RequestParam String sort, @PathVariable(name = "id") int producerId, @PathVariable int page,
			HttpSession session, ModelMap model) {
		Common.checkSessionPageUser(session, model, producerService);
		model.addAttribute("sort", sort);
		model.addAttribute("lsLaptop",
				laptopService.getListLaptopByProducerIdAndPaging(producerId, page, Helper.USER_PAGE_SIZE, sort));
		model.addAttribute("pageCount",
				(int) Math.ceil(1.0 * laptopService.getLaptopCountByProducerId(producerId) / Helper.USER_PAGE_SIZE));
		model.addAttribute("currentPage", page);
		model.addAttribute("producer", producerService.getProducerById(producerId));
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

	@PostMapping(path = "/hot/{page}")
	public String hot(@RequestParam String sort, @PathVariable int page, HttpSession session, ModelMap model) {
		Common.checkSessionPageUser(session, model, producerService);
		model.addAttribute("sort", sort);
		model.addAttribute("lsHot", laptopService.getListLaptopHotByPage(page, Helper.USER_PAGE_SIZE, sort));
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

	@PostMapping(path = "/discount/{page}")
	public String discount(@RequestParam String sort, @PathVariable int page, HttpSession session, ModelMap model) {
		Common.checkSessionPageUser(session, model, producerService);
		model.addAttribute("sort", sort);
		model.addAttribute("lsDiscount", laptopService.getListLaptopDiscountByPage(page, Helper.USER_PAGE_SIZE, sort));
		model.addAttribute("pageCount",
				(int) Math.ceil(1.0 * laptopService.getLaptopDiscountCount() / Helper.USER_PAGE_SIZE));
		model.addAttribute("currentPage", page);
		return "user/category/discount";
	}
}
