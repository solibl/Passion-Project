$(document).ready(function() {
	openNav()
	closeNav()
	$('.carousel').carousel()
	 $('select').material_select()

});

function openNav() {
	document.getElementById("mySidenav").style.width = "250px";
	document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
	document.getElementById("main").style.marginLeft= "0";
}
