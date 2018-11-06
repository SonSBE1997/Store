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

import dev.sanero.entities.LaptopConfig;
import dev.sanero.services.ConfigService;
import dev.sanero.services.CpuService;
import dev.sanero.services.ProducerService;
import dev.sanero.services.RamService;
import dev.sanero.utils.ConfigRelationship;
import dev.sanero.utils.Helper;
import dev.sanero.utils.User;

@Controller
@RequestMapping(value = "/admin/config")
public class ConfigController {
	@Autowired
	ConfigService configService;
	@Autowired
	CpuService cpuService;
	@Autowired
	RamService ramService;
	@Autowired
	ProducerService producerService;

	@GetMapping("/{page}")
	public String index(@PathVariable int page, HttpSession session, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		model.addAttribute("lsConfig", configService.getListConfigByPage(page, Helper.PAGE_SIZE));
		model.addAttribute("pageCount", Math.ceil(1.0 * configService.getConfigCount() / Helper.PAGE_SIZE));
		model.addAttribute("currentPage", page);
		return "admin/config/index";
	}

	@ResponseBody
	@PostMapping(path = "/delete")
	public String delete(@RequestParam int id) {
		if (configService.delete(id))
			return "del";
		return "Config";
	}

	@GetMapping(path = "/create")
	public String create(HttpSession session, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		model.addAttribute("lsCPU", cpuService.getListCPU());
		model.addAttribute("lsRAM", ramService.getListRam());
		model.addAttribute("lsProducer", producerService.getListProducer());
		return "admin/config/create";
	}

	@PostMapping(path = "/create")
	public RedirectView create(@ModelAttribute LaptopConfig config,
			@ModelAttribute ConfigRelationship configRelationship, RedirectAttributes attributes) {
		config.setCreated_at(new Timestamp(new Date().getTime()));
		config.setProducer(producerService.getProducerById(configRelationship.getProducerId()));
		config.setCpu(cpuService.getCPUById(configRelationship.getCpuId()));
		config.setRam(ramService.getRamById(configRelationship.getRamId()));
		if (configService.insert(config)) {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.ADD_SUCCESSFULLY);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_SUCCESS);
		} else {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.ADD_FAILED);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_DANGER);
		}
		return new RedirectView("/Store/admin/config/1");
	}

	@GetMapping(path = "/edit/{id}")
	public String edit(HttpSession session, @PathVariable int id, ModelMap model) {
		if (session.getAttribute("userSession") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loginName", ((User) session.getAttribute("userSession")).getName());
		model.addAttribute("config", configService.getConfigById(id));
		model.addAttribute("lsCPU", cpuService.getListCPU());
		model.addAttribute("lsRAM", ramService.getListRam());
		model.addAttribute("lsProducer", producerService.getListProducer());
		return "admin/config/edit";
	}

	@PostMapping(path = "/edit")
	public RedirectView edit(@ModelAttribute LaptopConfig config, @ModelAttribute ConfigRelationship configRelationship,
			RedirectAttributes attributes) {
		config.setUpdated_at(new Timestamp(new Date().getTime()));
		config.setProducer(producerService.getProducerById(configRelationship.getProducerId()));
		config.setCpu(cpuService.getCPUById(configRelationship.getCpuId()));
		config.setRam(ramService.getRamById(configRelationship.getRamId()));
		if (configService.update(config)) {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.EDIT_SUCCESSFULLY);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_SUCCESS);
		} else {
			attributes.addFlashAttribute(Helper.ALERT_MESS, Helper.EDIT_FAILED);
			attributes.addFlashAttribute(Helper.ALERT_TYPE, Helper.ALERT_DANGER);
		}
		return new RedirectView("/Store/admin/config/1");
	}
}
