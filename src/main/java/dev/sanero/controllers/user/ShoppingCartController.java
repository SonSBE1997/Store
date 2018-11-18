package dev.sanero.controllers.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.sanero.entities.Laptop;
import dev.sanero.services.LaptopService;
import dev.sanero.services.ProducerService;
import dev.sanero.utils.Cart;
import dev.sanero.utils.Common;

@Controller
@RequestMapping(path = "/shopping-cart")
public class ShoppingCartController {
	@Autowired
	ProducerService producerService;

	@Autowired
	LaptopService laptopService;

	@GetMapping
	public String index(HttpSession session, ModelMap model) {
		Common.checkSessionPageUser(session, model, producerService);
		return "user/cart";
	}

	@GetMapping(path = "/add/{id}")
	public String addToCart(@PathVariable int id, HttpSession session) {
		Laptop laptop = laptopService.getLaptopById(id);
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
}
