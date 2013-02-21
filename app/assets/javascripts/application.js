// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function () {
	$('#invite_code, #last_name_input').live('click', function () {
		$(this).val('');
		$(this).removeClass('start_style');
		$(this).addClass('end_style');
	});

	$('#invitations .sortable, #invitations .pagination a').live("click", function () {
		$.getScript(this.href);
		return false;			
	});

	$("#invitations_search input").keyup(function() {
	 	$.get($("#invitations_search").attr("action"), $("#invitations_search").serialize(), null, "script");
	  return false;
  });

	$('#add_address').change(function () {
		if($(this).attr('checked')) {
			$.getScript('edit');
		} else {
			$('#address_div').html("");	
		}
	  return false;
	});
	
});


