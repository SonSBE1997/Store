package dev.sanero.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;

import dev.sanero.services.ProducerService;

public class Common {
	public static String encryptMD5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] messageDigest = md.digest(input.getBytes());
			BigInteger number = new BigInteger(1, messageDigest);
			String hashtext = number.toString(16);
			return hashtext;
		} catch (NoSuchAlgorithmException e) {
			System.out.println(e.getMessage());
			return input;
		}
	}

	public static void checkSessionPageUser(HttpSession session, ModelMap model, ProducerService producerService) {
		model.addAttribute("lsProducer", producerService.getListProducer());
		if (session.getAttribute("loginSession") != null) {
			model.addAttribute("loginName", ((User) session.getAttribute("loginSession")).getName());
		}

		if (session.getAttribute("shoppingCart") == null) {
			List<Cart> cart = new ArrayList<Cart>();
			session.setAttribute("shoppingCart", cart);
			session.setMaxInactiveInterval(900);
			model.addAttribute("cart", cart);
		} else {
			@SuppressWarnings("unchecked")
			List<Cart> cart = (List<Cart>) session.getAttribute("shoppingCart");
			model.addAttribute("cart", cart);
		}
	}
}
