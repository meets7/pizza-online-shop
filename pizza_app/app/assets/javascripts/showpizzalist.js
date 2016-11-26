var x = {
	init: function(){
		$('#delete-multiple').click (function() {
			var allVals = [];
			$('#c_b :checked').each(function() {
				allVals.push($(this).val());
			});
		});

	}

	$(document).ready(function(){
		x.init();
	});

