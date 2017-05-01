$(document).ready(function() {
	openNav()
	closeNav()
	      $('.carousel').carousel({
            dist:0,
            shift:0,
            padding:20,

      })
});

function openNav() {
	document.getElementById("mySidenav").style.width = "250px";
	document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
	document.getElementById("main").style.marginLeft= "0";
}

