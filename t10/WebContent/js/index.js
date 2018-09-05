$(document).ready(function() {

	$("#btnlogin").on("click", function() {

		if ($('#inputEmail').val() == "") {
			alert("사번을 입력해 주세요.");
			return;
		}

		if ($('#inputPassword').val() == "") {
			alert("사번을 입력해 주세요.");
			return;
		}

		$('#loginForm').submit();
	});

	$("#sendMessageButton").click( function() {

		$('#registerForm').submit();
	});

	$("#btnlogout").on("click", function() {

		if (session != null) {
			session.invalidate();
		}

		$('#logoutForm').submit();

	});

	$("btnCancel").on("click", function() {

		$('#cancel').submit();

	});

	$("#btnUpdate").click( function() {
		
		$('#flag').val("update");
		
		
		$('#updateForm').submit();

	});

	$("#btnDelete").click( function() {

		$('#flag').val("delete");
		
		$('#updateForm').submit();

	});

});