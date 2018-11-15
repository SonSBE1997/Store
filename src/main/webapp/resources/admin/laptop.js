$('.btn-delete').off('click').on('click', function(e) {
	e.preventDefault();
	var btn = $(this);
	var id = btn.data('id');
	var result = confirm("Bạn có muốn xoá laptop có mã " + id + " không?");
	if (result == true) {
		$.ajax({
			url : "/Store/admin/laptop/delete",
			data : {
				id : id
			},
			type : "POST",
			success : function(response) {
				if (response == "del") {
					$("#row" + id).remove();
				}
			}
		});
	}
});

$('.btn-status').off('click').on('click', function(e) {
	e.preventDefault();
	var btn = $(this);
	var id = btn.data('id');
	$.ajax({
		url : "/Store/admin/laptop/changeHot",
		data : {
			id : id
		},
		type : "POST",
		success : function(response) {
			if (response == "true") {
				$("#status" + id).text("Có");
			} else {
				$("#status" + id).text("Không");
			}
		}
	});
});
