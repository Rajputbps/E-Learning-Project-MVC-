<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home Education</title>
    
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script> 
    <script type="text/javascript" src="https://cdn.rawgit.com/AlphaGit/ng-pattern-restrict/master/src/ng-pattern-restrict.min.js"></script>
    <link href="resources/css/nav.css" rel="stylesheet" type="text/css"> 
    <script type="text/javascript">
    $(document).ready(function() { 
    	  $(".navbar-burger").click(function() {
    	      $(".navbar-burger").toggleClass("is-active");
    	      $(".navbar-menu").toggleClass("is-active");

    	  });
    	  
    	  $("#showSignInSignUpForm").click(function() {
    		  $(".modal").addClass("is-active");  
    		});
    	  
    	  $(".modal-close").click(function() {
    		   $(".modal").removeClass("is-active");
    		});
    	  
    	  /* Signin & SignUp */
    	  
    	  $('#show').click(function() {
    	      $('#signIn').toggle("slide");
    	       $('#signUp').toggle("slide");
    	       
    	    });
    	  
    		 $("#saveNote").click(function() {
    			  $("#note").addClass("is-active");  
    			});
    		 
    		 $('#closeNotePad').click(function() {
    		      $('#notepad').toggle(1000); 
    		      $("#savedNotessss").slideToggle("slow");
    		    });
    		 
    		 $("#savedNotes").click(function(){
    			 $('#notepad').slideUp(1000);
    			    $("#savedNotessss").slideToggle("slow"); 
    			  });
    	  
    	});
    </script>
  </head>
  <body data-ng-app=""> 
    <div class="container-fluid">
       <nav class="navbar is-fixed-top" role="navigation" aria-label="main navigation" style="background-image: linear-gradient(to bottom right,#2979ff,#90caf9,#64b5f6); height: 100px;">
  <div class="navbar-brand white">
    <a class="navbar-item" href="https://bulma.io">
     <!--  <img src="https://bulma.io/images/bulma-logo.png" width="112" height="28"> -->
      <span style="font-family: algerian; font-size:41px;">H</span><span style="font-size: 21px;">ome</span> <span style="font-family: algerian; font-size:41px;">E</span><span style="font-size: 21px;">ducation</span> </a>   
    </a>

    <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>  

  <div id="navbarBasicExample" class="navbar-menu is-centered">
    <div class="navbar-start">
      <a class="navbar-item">
        Home
      </a> 

      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">
          Courses
        </a>

        <div class="navbar-dropdown">
        <c:forEach items="${courseName}" var="course">
         <a class="navbar-item" href="courceDetail${course.course_Id}">
            ${course.course_Name}
          </a>
        </c:forEach> 
        </div>
      </div>
      
      <a class="navbar-item">
        About
      </a> 
       <a class="navbar-item">
        Contact
      </a> 
      
    </div>

    <div class="navbar-end">
    <div class="navbar-item">
    <input class="input" type="text" placeholder="Search" style="height:55px;">
    </div>
      <div class="navbar-item">
       <c:if test="${userDetails.email == null}">
        <div class="buttons"> 
          <a class="button is-light" id="showSignInSignUpForm">
            Log in
          </a>
        </div>
         </c:if>
        <c:if test="${userDetails.email != null}"> 
            <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">
          ${userDetails.f_name}
        </a> 
        <div class="navbar-dropdown">
          <a class="navbar-item">
            Notes
          </a>
          <hr class="navbar-divider">
          <a class="navbar-item" href="perform_logout" style="color:#ff0000">
            <b>Logout</b>
          </a>
        </div>
      </div>
      <div class="navbar-item"> 
       <button id="savedNotes" class="button is-light is-outlined">Note</button>
      </div>
        </c:if>
      </div>
      
    </div>
  </div>
</nav>
    </div> 
    
    
    <!-- Login & SignUp code -->
    
    <div class="modal">
  <div class="modal-background"></div>
  <div class="modal-content">
  <div class="section" id="signIn">
  
  	<form  action="perform_login" method="post" name="loginForm">
	<div class="field">
  <p class="control has-icons-left has-icons-right">
    <input class="input" type="email" name="email" placeholder="Email" data-ng-model="email" data-ng-pattern="/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/" data-ng-pattern-restrict required>
    <span class="icon is-small is-left">
      <i class="fas fa-envelope"></i>
    </span>
    <span class="icon is-small is-right">
      <i class="fas fa-check"></i>
    </span>
     <span data-ng-show="loginForm.email.$touched && loginForm.email.$error.required" class="errorMessage">*Email Id is required.</span>
    <span data-ng-show="loginForm.email.$dirty && loginForm.email.$invalid" class="errorMessage">*Enter valid email.</span>
  </p>
</div>
<div class="field">
  <p class="control has-icons-left">
    <input class="input" type="password" name="password" placeholder="Password" data-ng-model="password" required>
    <span class="icon is-small is-left">
      <i class="fas fa-lock"></i>
    </span>
    <span data-ng-show="loginForm.password.$touched && loginForm.password.$error.required" class="errorMessage">*Email Id is required.</span>
  </p>
</div>

<div class="columns is-mobile has-text-white ">
  <div class="column has-text-left"><label class="checkbox">
  <input type="checkbox">
  Remember me
</label></div>
  <div class="column has-text-right"> Forget Password </div> 
</div>

<button class="button is-fullwidth is-success is-outlined is-rounded " style="margin-top:30px;">SignIn</button>
	</form>
	
	  <hr class="navbar-divider is-spaced " style="margin-top:10px;">

<button class="button is-fullwidth is-link is-outlined is-rounded" style="margin-top:30px;" id="show"> SignUp</button>
  
  </div>


<!-- SignUp -->

<div class="section" id="signUp" style="display: none;">
<div class="has-text-centered" style="margin-top:10px;margin-bottom:20px;"><h4 class="title is-4 has-text-white">Registration</h4></div>
<form action="addUser1" method="POST" name="signUpForm" class="signUpForm">
<div class="columns">
  <div class="column">
  <div class="field">
 <p class="control has-icons-left">
    <input class="input error" name="f_name" type="text" placeholder="First Name" data-ng-model="f_name" data-ng-pattern="/^[a-zA-Z\s]*$/" data-ng-pattern-restrict required>
    <span class="icon is-small is-left">
      <i class="fas fa-user "></i>
    </span>
    <span data-ng-show="signUpForm.f_name.$touched && signUpForm.f_name.$error.required" class="errorMessage">*The name is required.</span>
    <span data-ng-show="signUpForm.f_name.$dirty && signUpForm.f_name.$invalid" class="errorMessage">*Only Alphabets.</span>
  </p>
</div>
  </div>
 <div class="column">
  <div class="field">
 <p class="control has-icons-left">
    <input class="input error" name="l_name" type="text" placeholder="Last Name" data-ng-model="l_name" data-ng-pattern="/^[a-zA-Z\s]*$/" data-ng-pattern-restrict required>
    <span class="icon is-small is-left">
      <i class="fas fa-user "></i>
    </span>
    <span data-ng-show="signUpForm.l_name.$touched && signUpForm.l_name.$error.required" class="errorMessage">*The name is required.</span>
    <span data-ng-show="signUpForm.l_name.$dirty && signUpForm.l_name.$invalid" class="errorMessage">*Only Alphabets.</span>
  </p>
</div>
  </div>
 
 
 
</div>
<div class="columns">

 <div class="column">
  <div class="field">
  <p class="control has-icons-left has-icons-right">
    <input class="input error" name="email" type="email" placeholder="Email" data-ng-model="email" data-ng-pattern="/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/" data-ng-pattern-restrict required >
    <span class="icon is-small is-left">
      <i class="fas fa-envelope"></i>
    </span>
    <span class="icon is-small is-right"> 
    </span>
    <span data-ng-show="signUpForm.email.$touched && signUpForm.email.$error.required" class="errorMessage">*The name is required.</span>
    <span data-ng-show="signUpForm.email.$dirty && signUpForm.email.$invalid" class="errorMessage">*Enter valid email.</span>
  </p>
</div>
  </div>
  
  <div class="column">
  <div class="field">
  <p class="control has-icons-left">
    <input class="input error" name="phone" type="tel" placeholder="Phone Number" data-ng-model="phone" pattern="/^[0-9]{10}$/" data-ng-pattern-restrict required>
    <span class="icon is-small is-left">
      <i class="fas fa-mobile"></i>
    </span>
    <span data-ng-show="signUpForm.phone.$touched && signUpForm.phone.$error.required" class="errorMessage">*The name is required.</span>
    <span data-ng-show="signUpForm.phone.$dirty && signUpForm.phone.$invalid" class="errorMessage">*Only Number.</span>
  </p>
</div>
  </div>
  
</div>
<div class="columns">
  <div class="column">
  <div class="field">
 <p class="control has-icons-left">
    <input class="input error" name="gender" type="Text" placeholder="Gender">
    <span class="icon is-small is-left">
      <i class="fas fa-male"></i>
    </span>
  </p>
</div>
  </div>
  
  <div class="column">
  <div class="field">
  <p class="control has-icons-left">
    <input class="input error" name="age" type="number" placeholder="Age">
    <span class="icon is-small is-left">
      <i class="fas fa-calendar"></i>
    </span>
  </p>
</div>
  </div>
  
</div>

<div class="columns">
<div class="column">
  <div class="field">
 <p class="control has-icons-left">
    <input class="input error" name="password" type="password" placeholder="Password">
    <span class="icon is-small is-left">
      <i class="fas fa-lock"></i>
    </span>
  </p>
</div>
  </div>
  <div class="column">
  <div class="field">
 <p class="control has-icons-left">
    <input class="input error" name="repassword" type="password" placeholder="Confirm Password">
    <span class="icon is-small is-left">
      <i class="fas fa-lock"></i>
    </span>
  </p>
</div>
  </div>
</div>



<button class="button is-fullwidth is-success is-outlined" style="margin-top:30px;">Register</button>
</form>
</div>

  </div>
  <button class="modal-close is-large" aria-label="close"></button>
</div>
    
    <!-- NotePad code -->  
      
    <div id="savedNotessss" class="is-pulled-right noteListBody" style="background-image: linear-gradient(to bottom right,#90caf9,#64b5f6,#2979ff);">
    <div >
    <nav class="navbar" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <a class="navbar-item" href="https://bulma.io">
      <img src="https://bulma.io/images/bulma-logo.png" width="112" height="28">
    </a>

    <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>

  <div id="navbarBasicExample" class="navbar-menu">
    <div class="navbar-end">
        <div class="navbar-item"> 
  	 <button id="closeNotePad"  class="button is-link  is-outlined"><i class="far fa-sticky-note fa-2x"></i></button> 
    </div>
    </div>
  </div>
</nav>
<div>
<div class="list is-hoverable">
<c:forEach var="notes" items="${notesList}">
  <a class="list-item">
    ${notes.note_title}
  </a>
</c:forEach>
</div>
</div>
    </div>
    </div> 
       
   <div id="notepad" style="display: none;">

<form action="addinFile" style="margin-top: 7%;">
<input type="hidden" value="${userDetails.user_id}" name="user_id">
 <article  class="message notePad">
  <div class="message-header" style="background-image: linear-gradient(to bottom right,#90caf9,#64b5f6,#2979ff);">
    Note
    <a id="saveNote"><i class="far fa-save fa-2x"></i></a> 
  </div> 
  <div class="message-body" >
    <textarea name="file" class="textarea is-info is-hovered noteText" style="height:400px;width: 100%;" placeholder="Write your note....."></textarea>
  </div>
</article>





<div class="modal" id="note">
  <div class="modal-background"></div>
  <div class="modal-content">
  <p id="error"></p>
     <div class="field">
     <div>
     <label style="color:#fff;">Enter the file name :</label>
     </div>
  <div class="control">
    <input class="input is-info" type="text" name="noteName" placeholder="Info input">
  </div>
</div>
<div class="has-text-centered"> 
 <c:if test="${userDetails.email != null}">
 <a class="button is-success is-outlined" type="submit">Save</a>
 </c:if>
<%--  <c:if test="${userDetails.email == null}">
 <a class="button is-success is-outlined" type="submit" id="showSignInSignUpForm">Save</a>
 </c:if> --%>
 
 <c:if test="${userDetails.email == null}">
          <div class="button" > 
             <a class="button is-success is-outlined"  >
                Log Out
             </a>
           </div>
        </c:if>
 
</div>
  </div>
  <button class="modal-close is-large" aria-label="close"></button>
</div>
 </form>
 
</div>
  
    
    
  </body>
</html>