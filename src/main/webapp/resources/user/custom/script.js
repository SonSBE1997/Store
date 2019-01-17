document.getElementById("btnShoppingCart").addEventListener(
		"click",
		function(event) {
			event.preventDefault();
			document.getElementById("dropdownShoppingCart").classList
					.toggle("show");
		})

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
	if (!event.target.matches('.btnShoppingCart')) {

		var dropdowns = document.getElementsByClassName("dropdown-menu");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
}

document.getElementById("login").addEventListener("click", function(event) {
	event.preventDefault();
})

document.getElementById("tradeMark").addEventListener("click", function(event) {
	event.preventDefault();
})

var removes = document.getElementsByClassName('removeCart');
for (var i = 0; i < removes.length; i++) {
	removes[i]
			.addEventListener(
					'click',
					function(event) {
						event.preventDefault();
						var request = new XMLHttpRequest();
						var id = this.getAttribute("data-id");
						request.onreadystatechange = function() {
							if (request.readyState === 4
									&& request.status === 200) {
								document.getElementById("bageItem" + id)
										.remove();
								document.getElementById('shoppingCartBadge').innerHTML = request.responseText;
								if (request.responseText == "0") {
									var newItem = document.createElement("LI");
									var textnode = document
											.createTextNode("Không có sản phẩm nào");
									newItem.appendChild(textnode);
									var list = document
											.getElementById('dropdownShoppingCart');
									list.insertBefore(newItem,
											list.childNodes[0]);
								}
							}
						}

						request.open('GET', '/Store/shopping-cart/remove?id='
								+ id);
						request.send();
					});
}

var laptops = document.getElementsByClassName('addCart');
for (var i = 0; i < laptops.length; i++) {
	laptops[i].addEventListener('click', function(event) {
		var id = this.getAttribute("data-id");
		var quantity = this.getAttribute("data-quantity");
		if (quantity < 1) {
			alert("Sản phẩm tạm thời hết hàng");
		} else {
			window.location.href = "/Store/shopping-cart/add/" + id;
		}
	});
}

document.getElementById('iSort').addEventListener('change',function(){
	console.log("selected");
	document.getElementById("fSort").submit();
});