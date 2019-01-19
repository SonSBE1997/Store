package dev.sanero.services;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import dev.sanero.entities.Laptop;
import dev.sanero.entities.OrderDetail;
import dev.sanero.utils.CustomerInfo;

@Service
public class MailService {
	@Autowired
	JavaMailSender mailSender;

	static String emailToRecipient, emailContent;

	public void sendMail(String mailTo, String content) {
		emailToRecipient = mailTo;
		emailContent = content;
		mailSender.send(new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				messageHelper.setTo(emailToRecipient);
				messageHelper.setFrom("sonsbe1997@gmail.com");
				SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");
				messageHelper.setSubject("Đơn đặt hàng ngày " + dateFormatter.format(new Date()));
				messageHelper.setText(emailContent, true);
			}
		});
	}

	public StringBuilder genContentMail(CustomerInfo customer, Set<OrderDetail> details) {
		StringBuilder builder = new StringBuilder();
		builder.append("<h3>Người đặt hàng: ").append(customer.getName()).append("</h3>");
		builder.append("<p>Số điện thoại: ").append(customer.getPhoneNumber()).append("</p>");
		builder.append("<p>Địa chỉ: ").append(customer.getAddress()).append("</p><br/>");
		builder.append("<table style=\"width:100%;border-collapse: collapse;\" border=\"1px solid black;\">")
				.append("<tr>")
				.append("<th style=\"border-collapse: collapse;\" border=\"1px solid black;\">Tên sản phẩm</th>")
				.append("<th style=\"border-collapse: collapse;\" border=\"1px solid black;\">Số lượng</th>")
				.append("<th style=\"border-collapse: collapse;\" border=\"1px solid black;\">Thành tiền</th>")
				.append("</tr>");
		long totalPrice = 0;
		DecimalFormat decimalFormat = new DecimalFormat("#,###,###,###.00");
		for (OrderDetail orderDetail : details) {
			Laptop laptop = orderDetail.getLaptop();
			builder.append("<tr>");
			builder.append("<td style=\"border-collapse: collapse;text-align:center;\" border=\"1px solid black;\">");
			builder.append(laptop.getName());
			builder.append("</td>");
			builder.append("<td style=\"border-collapse: collapse;text-align:center;\" border=\"1px solid black;\">");
			builder.append(orderDetail.getQuantity());
			builder.append("</td>");
			long total = orderDetail.getPrice();
			totalPrice += total;
			builder.append("<td style=\"border-collapse: collapse;text-align:center;\" border=\"1px solid black;\">");
			builder.append(decimalFormat.format(total));
			builder.append("</td>");
			builder.append("</tr>");
		}
		builder.append("</table>");
		builder.append("<br/><br/> Tổng tiền: ").append(decimalFormat.format(totalPrice)).append(" VNĐ");
		return builder;
	}
}
