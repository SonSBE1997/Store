package dev.sanero.controllers.admin;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import dev.sanero.entities.Laptop;
import dev.sanero.services.ConfigService;
import dev.sanero.services.LaptopService;
import dev.sanero.utils.Helper;
import dev.sanero.utils.User;

@Controller
@RequestMapping(value = "/admin/laptop")
public class LaptopController {
	@Autowired
	LaptopService laptopService;
	@Autowired
	ConfigService configService;

	@GetMapping("/{page}")
	public String index(@PathVariable int page, HttpSession session, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		model.addAttribute("lsLaptop", laptopService.getListLaptopByPage(page, Helper.PAGE_SIZE));
		model.addAttribute("pageCount", Math.ceil(1.0 * laptopService.getLaptopCount() / Helper.PAGE_SIZE));
		model.addAttribute("currentPage", page);
		return "admin/laptop/index";
	}

	@GetMapping("/detail/{id}")
	public String detail(@PathVariable int id, HttpSession session, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		Laptop laptop = laptopService.getLaptopById(id);
		model.addAttribute("laptop", laptop);
		model.addAttribute("config", laptop.getConfiguration());
		return "admin/laptop/detail";
	}

	@ResponseBody
	@PostMapping(path = "/delete")
	public String delete(@RequestParam int id) {
		if (laptopService.delete(id))
			return "del";
		return "Laptop" + id;
	}

	@GetMapping(path = "/delete/{id}")
	public RedirectView delete(@PathVariable int id, RedirectAttributes attributes) {
		if (laptopService.delete(id)) {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.DELETE_SUCCESSFULLY);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_SUCCESS);
		} else {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.DELETE_FAILED);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_DANGER);
		}
		return new RedirectView("/Store/admin/laptop/1");
	}

	@GetMapping(path = "/create")
	public String create(HttpSession session, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		model.addAttribute("lsConfig", configService.getListConfig());
		return "admin/laptop/create";
	}

	@PostMapping(path = "/create")
	public RedirectView create(@ModelAttribute Laptop laptop, @RequestParam int configId, RedirectAttributes attributes,
			HttpSession session) {
		laptop.setConfiguration(configService.getConfigById(configId));
		laptop.setCreated_by(((User) session.getAttribute("userSession")).getId());
		laptop.setCreated_at(new Timestamp(new Date().getTime()));
		if (laptopService.insert(laptop)) {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.ADD_SUCCESSFULLY);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_SUCCESS);
		} else {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.ADD_FAILED);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_DANGER);
		}
		return new RedirectView("/Store/admin/laptop/1");
	}

	@GetMapping(path = "/edit/{id}")
	public String edit(HttpSession session, @PathVariable int id, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		Laptop laptop = laptopService.getLaptopById(id);
		model.addAttribute("laptop", laptop);
		model.addAttribute("lapConfig", laptop.getConfiguration());
		model.addAttribute("lsConfig", configService.getListConfig());
		return "admin/laptop/edit";
	}

	@PostMapping(path = "/edit")
	public RedirectView edit(@ModelAttribute Laptop laptop, @RequestParam int configId, @RequestParam String lastImage,
			RedirectAttributes attributes, HttpSession session) {
		if (laptop.getImage() == "")
			laptop.setImage(lastImage);
		laptop.setConfiguration(configService.getConfigById(configId));
		laptop.setModified_by(((User) session.getAttribute("userSession")).getId());
		laptop.setUpdated_at(new Timestamp(new Date().getTime()));
		if (laptopService.update(laptop)) {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.EDIT_SUCCESSFULLY);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_SUCCESS);
		} else {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.EDIT_FAILED);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_DANGER);
		}
		return new RedirectView("/Store/admin/laptop/1");
	}

	@ResponseBody
	@PostMapping(path = "/changeHot")
	public String changeHot(@RequestParam int id) {
		if (laptopService.changeHot(id))
			return "true";
		return "false";
	}

	@Autowired
	ServletContext context;

	@ResponseBody
	@PostMapping(path = "/uploadFile")
	public String upload(MultipartHttpServletRequest request) {
		Iterator<String> names = request.getFileNames();
		MultipartFile file = request.getFile(names.next());
		try {
			file.transferTo(new File(context.getRealPath("/resources/image/") + file.getOriginalFilename()));
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return "false";
		} catch (IOException e) {
			e.printStackTrace();
			return "false";
		}
		return "true";
	}
}
