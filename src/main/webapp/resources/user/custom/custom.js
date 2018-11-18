var removes = document.getElementsByClassName('remove');
for (var i = 0; i < removes.length; i++) {
	removes[i].addEventListener('click', function(event) {
		event.preventDefault();
		var request = new XMLHttpRequest();

		var id = this.getAttribute("data-id");
		request.onreadystatechange = function() {
			if (request.readyState === 4 && request.status === 200) {
				document.getElementById('shoppingCartBadge').innerHTML = request.responseText;
				if(request.responseText=="0") {
					document.getElementById("pageShoppingCart").innerHTML="<h3>Không có sản phẩm nào trong giỏ hàng</h3>";
					document.getElementById("cartTable").remove();
					document.getElementById("order").remove();
					var newItem = document.createElement("LI");
				    var textnode = document.createTextNode("Không có sản phẩm nào");
				    newItem.appendChild(textnode);
					var list = document.getElementById('dropdownShoppingCart');
					list.insertBefore(newItem,list.childNodes[0]);
				} else{
					document.getElementById("bageItem" + id).remove();
					var price = parseInt(document.getElementById("price"+ id).innerHTML);
					var totalPrice = parseInt(document.getElementById("billPrice").innerHTML);
					document.getElementById("billPrice").innerHTML = (totalPrice-price).toFixed(0);
					document.getElementById("row" + id).remove();
				}
			}
		}

		request.open('GET', '/Store/shopping-cart/remove?id=' + id);
		request.send();
	});
}

var quantities = document.getElementsByClassName('quantities');
for (var i = 0; i < quantities.length; i++) {
	quantities[i].addEventListener('change', function(e) {
		var request = new XMLHttpRequest();
		
		var id = this.getAttribute("data-id");
		var quantity = document.getElementById("quantity"+id).value;
		request.onreadystatechange = function() {
			if (request.readyState === 4 && request.status === 200) {
				var result = request.responseText.split("-");
				document.getElementById('shoppingCartBadge').innerHTML = result[0];
				if(result[0]=="0") {
					document.getElementById("pageShoppingCart").innerHTML="<h3>Không có sản phẩm nào trong giỏ hàng</h3>";
					document.getElementById("cartTable").remove();
					document.getElementById("order").remove();
					var newItem = document.createElement("LI");
					var textnode = document.createTextNode("Không có sản phẩm nào");
					newItem.appendChild(textnode);
					var list = document.getElementById('dropdownShoppingCart');
					list.insertBefore(newItem,list.childNodes[0]);
				} else{
					if(quantity==0) {
						document.getElementById("row" + id).remove();
						document.getElementById("bageItem" + id).remove();
					}else{
						var price = parseInt(document.getElementById("singlePrice"+ id).innerHTML);
						var discount = parseInt(document.getElementById("discount"+ id).innerHTML);
						var newPrice = quantity * (price * (100-discount)/100);
						var lastPrice = parseInt(result[1]);
						var totalPrice = parseInt(document.getElementById("billPrice").innerHTML);
						document.getElementById("price"+ id).innerHTML = newPrice.toFixed(0);
						document.getElementById("billPrice").innerHTML = (totalPrice-lastPrice+newPrice).toFixed(0);
						
						document.getElementById("badgeQuantity"+id).innerHTML = quantity;
						document.getElementById("badgePrice"+id).innerHTML = newPrice.toFixed(0);
					}
				}
			}
		}
		
		request.open('GET', '/Store/shopping-cart/change-quantity?id=' + id+"&quantity=" + quantity);
		request.send();
	});
}


