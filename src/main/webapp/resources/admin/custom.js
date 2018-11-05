$('.btn-delete').off('click').on('click', function(e) {
	e.preventDefault();
	var btn = $(this);
	var id = btn.data('id');
	var result = confirm("Bạn có muốn xoá nhân viên có mã " + id + " không?");
	if (result == true) {
		$.ajax({
			url : "/Store/admin/employee/delete",
			data : {
				id : id
			},
			type : "POST",
			success : function(response) {
				if (response == "duplicated")
					alert("Không thể xoá tài khoản đang đăng nhập");
				if (response == "del") {
					$("#row" + id).remove();
				}
			}
		});
	}
});

$('.btn-role').off('click').on('click', function(e) {
	e.preventDefault();
	var btn = $(this);
	var id = btn.data('id');
	$.ajax({
		url : "/Store/admin/employee/changeRole",
		data : {
			id : id
		},
		type : "POST",
		success : function(response) {
			switch (response) {
			case "true":
				$("#role" + id).text("Quản lý");
				break;
			case "false":
				$("#role" + id).text("Nhân viên");
				break;
			case "duplicated":
				alert("Không thể thay đổi chức vụ của tài khoản đăng nhập");
				break;
			}
		}
	});
});
