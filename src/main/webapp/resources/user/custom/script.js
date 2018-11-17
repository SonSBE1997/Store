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
