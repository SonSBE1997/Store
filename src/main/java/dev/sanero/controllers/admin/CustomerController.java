package dev.sanero.controllers.admin;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import dev.sanero.entities.Customer;
import dev.sanero.services.CustomerService;
import dev.sanero.utils.Helper;
import dev.sanero.utils.User;

@Controller
@RequestMapping(value = "/admin/customer")
public class CustomerController {
	@Autowired
	CustomerService customerService;

	@GetMapping("/{page}")
	public String index(@PathVariable int page, HttpSession session, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		model.addAttribute("lsCustomer", customerService.getListCustomerByPage(page, Helper.PAGE_SIZE));
		model.addAttribute("pageCount", Math.ceil(1.0 * customerService.getCustomerCount() / Helper.PAGE_SIZE));
		model.addAttribute("currentPage", page);
		return "admin/customer/index";
	}

	@ResponseBody
	@PostMapping(path = "/delete")
	public String delete(@RequestParam int id) {
		if (customerService.delete(id))
			return "del";
		return "Customer" + id;
	}

	@GetMapping(path = "/create")
	public String create(HttpSession session, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		return "admin/customer/create";
	}

	@PostMapping(path = "/create")
	public RedirectView create(@ModelAttribute Customer customer, RedirectAttributes attributes) {
		customer.setCreated_at(new Timestamp(new Date().getTime()));
		if (customerService.insert(customer)) {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.ADD_SUCCESSFULLY);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_SUCCESS);
		} else {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.ADD_FAILED);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_DANGER);
		}
		return new RedirectView("/Store/admin/customer/1");
	}

	@GetMapping(path = "/edit/{id}")
	public String edit(HttpSession session, @PathVariable int id, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		model.addAttribute("customer", customerService.getCustomerById(id));
		return "admin/customer/edit";
	}

	@PostMapping(path = "/edit")
	public RedirectView edit(@ModelAttribute Customer customer, RedirectAttributes attributes) {
		customer.setUpdated_at(new Timestamp(new Date().getTime()));
		if (customerService.update(customer)) {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.EDIT_SUCCESSFULLY);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_SUCCESS);
		} else {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.EDIT_FAILED);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_DANGER);
		}
		return new RedirectView("/Store/admin/customer/1");
	}
}
