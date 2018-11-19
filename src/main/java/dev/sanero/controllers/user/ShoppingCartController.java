package dev.sanero.controllers.user;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
import dev.sanero.entities.Laptop;
import dev.sanero.entities.Order;
import dev.sanero.entities.OrderDetail;
import dev.sanero.services.BillService;
import dev.sanero.services.CustomerService;
import dev.sanero.services.EmployeeService;
import dev.sanero.services.LaptopService;
import dev.sanero.services.ProducerService;
import dev.sanero.utils.Cart;
import dev.sanero.utils.Common;
import dev.sanero.utils.CustomerInfo;
import dev.sanero.utils.User;

@Controller
@RequestMapping(path = "/shopping-cart")
public class ShoppingCartController {
	@Autowired
	ProducerService producerService;

	@Autowired
	LaptopService laptopService;

	@Autowired
	CustomerService customerService;

	@Autowired
	EmployeeService employeeService;

	@Autowired
	BillService billService;

	@GetMapping
	public String index(HttpSession session, ModelMap model) {
		Common.checkSessionPageUser(session, model, producerService);
		if (session.getAttribute("loginSession") != null) {
			Customer cus = customerService.getCustomerById(((User) session.getAttribute("loginSession")).getId());
			model.addAttribute("customer", new CustomerInfo(cus.getName(), cus.getPhoneNumber(), cus.getEmail()));
		}
		return "user/cart";
	}

	@GetMapping(path = "/add/{id}")
	public String addToCart(@PathVariable int id, HttpSession session) {
		Laptop laptop = laptopService.getLaptopById(id);
		if (laptop.getQuantity() < 1)
			return "redirect:/";
		Cart cardAdd = new Cart(laptop.getId(), laptop.getName(), laptop.getPrice(), 1, laptop.getDiscount());
		cardAdd.setImage(laptop.getImage());
		if (session.getAttribute("shoppingCart") == null) {
			List<Cart> cart = new ArrayList<Cart>();
			cart.add(cardAdd);
			session.setAttribute("shoppingCart", cart);
			session.setMaxInactiveInterval(900);
		} else {
			@SuppressWarnings("unchecked")
			List<Cart> cart = (List<Cart>) session.getAttribute("shoppingCart");
			boolean check = false;
			for (Cart c : cart) {
				if (c.getLaptopId() == id) {
					check = true;
					c.setQuantity(c.getQuantity() + 1);
				}
				if (check)
					break;
			}
			if (!check)
				cart.add(cardAdd);
			session.setAttribute("shoppingCart", cart);
		}
		return "redirect:/";
	}

	@GetMapping(path = "/add/{id}/{quantity}")
	public String add(@PathVariable int id, @PathVariable int quantity, HttpSession session) {
		Laptop laptop = laptopService.getLaptopById(id);
		Cart cardAdd = new Cart(laptop.getId(), laptop.getName(), laptop.getPrice(), quantity, laptop.getDiscount());
		if (laptop.getQuantity() < quantity) {
			cardAdd.setQuantity(laptop.getQuantity());
		}
		cardAdd.setImage(laptop.getImage());
		if (session.getAttribute("shoppingCart") == null) {
			List<Cart> cart = new ArrayList<Cart>();
			cart.add(cardAdd);
			session.setAttribute("shoppingCart", cart);
			session.setMaxInactiveInterval(900);
		} else {
			@SuppressWarnings("unchecked")
			List<Cart> cart = (List<Cart>) session.getAttribute("shoppingCart");
			boolean check = false;
			for (Cart c : cart) {
				if (c.getLaptopId() == id) {
					check = true;

					int newQuantity = c.getQuantity() + quantity;
					System.out.println(newQuantity);
					System.out.println(laptop.getQuantity());

					if (laptop.getQuantity() < newQuantity) {
						c.setQuantity(laptop.getQuantity());
					} else
						c.setQuantity(newQuantity);
				}
				if (check)
					break;
			}
			if (!check)
				cart.add(cardAdd);
			session.setAttribute("shoppingCart", cart);
		}
		return "redirect:/laptop/detail/" + id;
	}

	@GetMapping(path = "/remove/{id}")
	public String remove(@PathVariable int id, HttpSession session) {
		@SuppressWarnings("unchecked")
		List<Cart> cart = (List<Cart>) session.getAttribute("shoppingCart");
		for (int i = 0; i < cart.size(); i++) {
			Cart c = cart.get(i);
			if (c.getLaptopId() == id) {
				cart.remove(c);
				break;
			}
		}
		session.setAttribute("shoppingCart", cart);
		return "redirect:/";
	}

	@GetMapping(path = "/remove")
	@ResponseBody
	public String removeAjax(@RequestParam int id, HttpSession session) {
		@SuppressWarnings("unchecked")
		List<Cart> cart = (List<Cart>) session.getAttribute("shoppingCart");
		for (int i = 0; i < cart.size(); i++) {
			Cart c = cart.get(i);
			if (c.getLaptopId() == id) {
				cart.remove(c);
				break;
			}
		}
		session.setAttribute("shoppingCart", cart);
		return cart.size() + "";
	}

	@GetMapping(path = "/change-quantity")
	@ResponseBody
	public String change(@RequestParam int id, @RequestParam int quantity, HttpSession session) {
		int price = 0;
		@SuppressWarnings("unchecked")
		List<Cart> cart = (List<Cart>) session.getAttribute("shoppingCart");
		for (int i = 0; i < cart.size(); i++) {
			Cart c = cart.get(i);
			if (c.getLaptopId() == id) {
				price = c.getTotalPrice();
				if (quantity == 0) {
					cart.remove(c);
				} else
					c.setQuantity(quantity);
				break;
			}
		}
		session.setAttribute("shoppingCart", cart);
		return cart.size() + "-" + price;
	}

	@PostMapping("/order")
	public RedirectView order(@ModelAttribute CustomerInfo customer, HttpSession session,
			RedirectAttributes attributes) {
		if (session.getAttribute("loginSession") != null) {
			@SuppressWarnings("unchecked")
			List<Cart> carts = (List<Cart>) session.getAttribute("shoppingCart");
			Set<OrderDetail> details = new HashSet<OrderDetail>();
			String error = "";
			for (Cart cart : carts) {
				OrderDetail detail = new OrderDetail();
				Laptop laptop = laptopService.getLaptopById(cart.getLaptopId());
				detail.setLaptop(laptop);
				detail.setQuantity(cart.getQuantity());
				detail.setPrice(cart.getPrice());
				detail.setCreated_by(1);
				detail.setCreated_at(new Timestamp(new Date().getTime()));
				if (laptop.getQuantity() < cart.getQuantity()) {
					error += laptop.getName() + " ,";
					cart.setQuantity(laptop.getQuantity());
				} else {
					laptop.setQuantity(laptop.getQuantity() - cart.getQuantity());
					laptopService.update(laptop);
				}
				details.add(detail);
			}
			Order order = new Order();
			order.setAddress(customer.getAddress());
			order.setLsDetail(details);
			order.setCreated_at(new Timestamp(new Date().getTime()));
			order.setDiscount(0);
			order.setOrderDate(new java.sql.Date(new Date().getTime()));
			order.setEmployee(employeeService.getEmployeeById(3));
			order.setCustomer(customerService.getCustomerById(((User) session.getAttribute("loginSession")).getId()));
			if (billService.insert(order) && error == "") {
				session.removeAttribute("shoppingCart");
				attributes.addFlashAttribute("mess", "Đặt hàng thành công");
			} else {
				attributes.addFlashAttribute("mess", "Một số sản phẩm không đủ số lượng: " + error);
			}
		} else {
			attributes.addFlashAttribute("mess", "Bạn phải đăng nhập trước");
		}
		return new RedirectView("/Store/shopping-cart");
	}
}
