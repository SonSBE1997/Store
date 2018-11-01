package dev.sanero.controllers.admin;

import java.sql.Timestamp;
import java.util.Date;

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

import dev.sanero.entities.Employee;
import dev.sanero.services.EmployeeService;

@Controller()
@RequestMapping(value = "/admin/employee")
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;

	@GetMapping(path = "/{page}")
	public String index(@PathVariable String page, ModelMap model) {
		model.addAttribute("lsEmployee", employeeService.getListEmployeeByPage(Integer.parseInt(page), 5));
		model.addAttribute("pageCount", Math.ceil(1.0 * employeeService.getTotalEmployeeCount() / 5));
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
	public String create() {
		return "admin/employee/create";
	}

	@PostMapping(path = "/create")
	public String create(@ModelAttribute Employee employee) {
		employee.setCreated_at(new Timestamp(new Date().getTime()));
		System.out.println(employee);
//		if (employeeService.insert(employee)) {
//			System.out.println("Insert successful");
//		}
//		System.out.println("insert failed");
		return "redirect:/admin/employee/1";
	}
}
