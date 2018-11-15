package dev.sanero.controllers.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.sanero.services.BillService;
import dev.sanero.utils.Helper;
import dev.sanero.utils.User;

@Controller
@RequestMapping("/admin/bill")
public class BillController {
	@Autowired
	BillService billService;

	@GetMapping("/{page}")
	public String index(@PathVariable int page, HttpSession session, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		model.addAttribute("lsOrder", billService.getListOrderByPage(page, Helper.PAGE_SIZE));
		model.addAttribute("pageCount", Math.ceil(1.0 * billService.getBillCount() / Helper.PAGE_SIZE));
		model.addAttribute("currentPage", page);
		return "admin/bill/index";
	}

	@ResponseBody
	@PostMapping(path = "/changeStatus")
	public String changeRole(HttpSession session, @RequestParam int id) {
		if (billService.changeStatus(id, ((User) session.getAttribute("userSession")).getId()))
			return "true";
		return "false";
	}

	@GetMapping("/statistic/{year}")
	public String statistic(@PathVariable int year, HttpSession session, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());

		model.addAttribute("currentYear", year);
		model.addAttribute("lsBillPrice", billService.getListBillPriceByYear(year));
		model.addAttribute("last", billService.getBillPriceByYear(year - 1));
		model.addAttribute("lastOfLast", billService.getBillPriceByYear(year - 2));
		return "admin/bill/statistic";
	}

	@GetMapping("/detail/{year}/{month}")
	public String detail(@PathVariable int year, @PathVariable int month, HttpSession session, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		model.addAttribute("date", String.format("tháng %d năm %d", month, year));
		model.addAttribute("lsOrder", billService.getListOrderByMonthAndYear(month, year));
		return "admin/bill/detail";
	}
}
