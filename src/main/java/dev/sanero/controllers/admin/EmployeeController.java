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

import dev.sanero.entities.Employee;
import dev.sanero.services.EmployeeService;
import dev.sanero.utils.Helper;
import dev.sanero.utils.User;

@Controller()
@RequestMapping(value = "/admin/employee")
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;

	@GetMapping(path = "/{page}")
	public String index(HttpSession session, @PathVariable String page, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		model.addAttribute("lsEmployee",
				employeeService.getListEmployeeByPage(Integer.parseInt(page), Helper.PAGE_SIZE));
		model.addAttribute("pageCount", Math.ceil(1.0 * employeeService.getTotalEmployeeCount() / Helper.PAGE_SIZE));
		model.addAttribute("currentPage", Integer.parseInt(page));
		return "admin/employee/index";
	}

	@ResponseBody
	@PostMapping(path = "/delete")
	public String delete(HttpSession session, @RequestParam int id) {
		if (session.getAttribute("userSession") != null) {
			User userLogin = (User) session.getAttribute("userSession");
			if (userLogin.getId() == id) {
				return "duplicated";
			}
		}
		if (employeeService.delete(id))
			return "del";
		return "Emp" + id;
	}

	@GetMapping(path = "/create")
	public String create(HttpSession session, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		return "admin/employee/create";
	}

	@PostMapping(path = "/create")
	public RedirectView create(@ModelAttribute Employee employee, RedirectAttributes attributes) {
		employee.setCreated_at(new Timestamp(new Date().getTime()));
		if (employeeService.insert(employee)) {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.ADD_SUCCESSFULLY);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_SUCCESS);
		} else {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.ADD_FAILED);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_DANGER);
		}
		return new RedirectView("/Store/admin/employee/1");
	}

	@GetMapping(path = "/edit/{id}")
	public String edit(HttpSession session, @PathVariable int id, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		model.addAttribute("emp", employeeService.getEmployeeById(id));
		return "admin/employee/edit";
	}

	@PostMapping(path = "/edit")
	public RedirectView edit(@ModelAttribute Employee employee, RedirectAttributes attributes) {
		System.out.println("post edit");
		System.out.println(employee);
		employee.setUpdated_at(new Timestamp(new Date().getTime()));
		if (employeeService.update(employee)) {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.EDIT_SUCCESSFULLY);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_SUCCESS);
		} else {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.EDIT_FAILED);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_DANGER);
		}
		return new RedirectView("/Store/admin/employee/1");
	}

	@ResponseBody
	@PostMapping(path = "/changeRole")
	public String changeRole(HttpSession session, @RequestParam int id) {
		if (session.getAttribute("userSession") != null) {
			User userLogin = (User) session.getAttribute("userSession");
			if (userLogin.getId() == id) {
				return "duplicated";
			}
		}
		if (employeeService.changeRole(id))
			return "true";
		return "false";
	}
}
