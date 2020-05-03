/*$(document).ready(function() { 
  $(".navbar-burger").click(function() {
      $(".navbar-burger").toggleClass("is-active");
      $(".navbar-menu").toggleClass("is-active");

  });
});*/


function saveNote() {
	var user_Id=document.getElementById("user_id").value;
	if(user_Id != null){
		window.location ="/addinFile"
	}
	else {
		document.getElementById("error").innerHTML="*Please Login!"
	}
}