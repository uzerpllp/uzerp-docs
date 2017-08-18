$(document).ready(function() {
	// get current URL path and assign 'active' class
	var pathname = window.location.pathname;
	$('.toc > ul > li > a[href="'+pathname+'"]').parent().addClass('active');
})

