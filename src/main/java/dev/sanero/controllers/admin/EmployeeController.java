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
		model.addAttribute("lsEmployee",
				employeeService.getListEmployeeByPage(Integer.parseInt(page), Helper.PAGE_SIZE));
		model.addAttribute("pageCount", Math.ceil(1.0 * employeeService.getTotalEmployeeCount() / Helper.PAGE_SIZE));
		model.addAttribute("currentPage", Integer.parseInt(page));
		return "admin/employee/index";
	}

	@ResponseBody
	@PostMapping(path = "/delete")
	public String delete(@RequestParam int id) {
		if (employeeService.delete(id))
			return "del";
		return "Emp" + id;
	}

	@GetMapping(path = "/create")
	public String create(HttpSession session) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		return "admin/employee/create";
	}

	@PostMapping(path = "/create")
	public RedirectView create(@ModelAttribute Employee employee, RedirectAttributes attributes) {
		employee.setCreated_at(new Timestamp(new Date().getTime()));
		System.out.println(employee);
//		if (employeeService.insert(employee)) {
//			
//		}
		attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.ADD_SUCCESSFULLY);
		attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_SUCCESS);
		return new RedirectView("/Store/admin/employee/1");
	}
}
