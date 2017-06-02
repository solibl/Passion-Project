$(document).ready(function() {
	$('.parallax').parallax()
	openNav()
	closeNav()
	showLogInForm()
	showSignUpForm()
	showStreamsUnderCategory()
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

function showLogInForm() {
	$(".logInLink").on("click", "a", function(event){
		event.preventDefault()
		var loginLink = $(this)
		$.ajax({
			url: loginLink.attr('href'),
			method: "get"
		}).done(function(results){
			$(".logInLink").find("#user-login").remove()
			$(".logInLink").append(results)
			$(".logInLink").find("input[type=text]").css("color", "white")
			$(".logInLink").find("input[type=password]").css("color", "white")
			$(".logInLink").find("#user-login").css("width","75%")
			$(".logInLink").find("#user-login").css("padding-left","20%")
		})
	})
}

function showSignUpForm() {
	$(".signUpLink").on("click", "a", function(event){
		event.preventDefault()
		var linkToSignUp = $(this)
		$.ajax({
			url: linkToSignUp.attr('href'),
			method: "get"
		}).done(function(results){
			$(".signUpLink").find("#signup-form").remove()
			$(".signUpLink").append(results)
			$(".signUpLink").find("input[type=text]").css("color", "white")
			$(".signUpLink").find("input[type=email]").css("color", "white")
			$(".signUpLink").find("#signup-form").css("width", "90%")
			$(".signUpLink").find("#signup-form").css("padding-left", "10%")
			$(".signUpLink").find("#signup-form").css("padding-top", "10%")
		})
	})
}

function showStreamsUnderCategory() {
	$(".main-content").on("click", "a.active", function(event){
		event.preventDefault()
		var pictureClicked = $(this)
		$.ajax({
			url: pictureClicked.attr('href'),
			method: "get"
		}).done(function(results){
			$(".searchStream").remove()
			$(".main-content").append(results)
		})
	})
}