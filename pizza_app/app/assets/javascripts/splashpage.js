var x = {
	init: function(){
		$('#signin').click (function() {
			$("#logindiv").css("display", "block");
		});

		 $(document).on("click", "#cancel", function(){ // This is the changed line
		 	$("#logindiv").css("display", "none");
		 });
		}
	}

	$(document).ready(function(){
		x.init();
	});

