<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       <%@page isELIgnored="false"%>
        <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>  
<script src="resources/JavaScript/questionPortal.js"></script>
<style type="text/css">
.notePad{
	width: 400px;
	height: 500px;
}
.notepad-header{
	width: 100%;
	height: 50px;
	background-color: blue;
}
</style>
<script>

$(document).ready(function(){
/* 	 $("#saveNote").click(function() {
		  $("#note").addClass("is-active");  
		}); */
	 
	 $('#ccloseNotePad').click(function() {
	      $('#notepadd').toggle("slide");
	    });
		
		
		$("#dropdown").click(function () {
			$("#dropdown-menu").toggleClass("is-active");
		})
});
</script>
</head>
<body>
 <div style="padding-top: 10%;">
 <form action="addNotes" method="POST" enctype="multipart/form-data">
 <input type="file" name="file">
 <input type="submit" value="Submit"> 
 </form>
 
 
 <form action="addinFile">
 <textarea rows="5" cols="" name="file"></textarea>
 
 <input type="submit" value="Submit"> 
 </form>
 <a href="readfile12">Read</a><br>
 
   <c:forEach items="${filedd}" var="file">
   <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${file}</p> <br>
  </c:forEach> 
 
<%--  <c:forEach var="n" items="notes">
  ${n.note_title}
 </c:forEach> --%>
 
<%--  <c:if test="${!testfile}">
 <%
 out.print("Hello");
 
 %>
 </c:if> --%>
 
 
 
<!--  
<div  style="float: right;">
<div class="notepad-header">


 <div class="columns">
  <div class="column is-one-quarter">
    Note
  </div>
  <div class="column is-two-thirds">
    Second column
  </div>
</div>


</div>
<form action="">
<div class="field">
  <div class="control">
    <textarea class="textarea is-info notePad" placeholder="Info textarea"></textarea>
  </div>
</div>
</form>
</div>
  -->
 
   <button id="ccloseNotePad">NotePad</button>
 
<div id="notepadd" style="display: none;">

<form action="addinFile">
 <article class="message is-info notePad">
  <div class="message-header">
    Info
    <a id="saveNote"><i class="far fa-save fa-2x"></i></a>
    <button class="delete" id="closeNotePad"></button>
  </div> 
  <div class="message-body">
    <textarea name="file" class="textarea is-info is-hovered" style="height:400px;" placeholder="Info textarea"></textarea>
  </div>
</article>





<div class="modal" id="note">
  <div class="modal-background"></div>
  <div class="modal-content">
     <div class="field">
     <div>
     <label style="color:#fff;">Enter the file name :</label>
     </div>
  <div class="control">
    <input class="input is-info" type="text" name="noteName" placeholder="Info input">
  </div>
</div>
<div class="has-text-centered"> 
<a class="button is-success is-outlined" type="submit">Save</a>
</div>
  </div>
  <button class="modal-close is-large" aria-label="close"></button>
</div>
 </form>





</div>
 
<a href="questionPortal">Portal</a> 

<form data-ng-app="myApp" data-ng-controller="validateCtrl" 
name="myForm" novalidate>

<p>Username:<br>
<input type="text" name="user"  data-ng-model="user" required>
<span style="color:red" data-ng-show="myForm.user.$dirty && myForm.user.$invalid">
<span data-ng-show="myForm.user.$error.required">Username is required.</span>
</span>
</p> 

<p>Email:<br>
<input type="email" name="email" data-ng-model="email" required>
<span style="color:red" data-ng-show="myForm.email.$dirty && myForm.email.$invalid">
<span data-ng-show="myForm.email.$error.required">Email is required.</span>
<span data-ng-show="myForm.email.$error.email">Invalid email address.</span>
</span>
</p>

<p>
<input type="submit"
data-ng-disabled="myForm.user.$dirty && myForm.user.$invalid ||  
myForm.email.$dirty && myForm.email.$invalid">
</p>

</form>
<script>
var app = angular.module('myApp', []);
app.controller('validateCtrl', function($scope) {
	$scope.user = 'John Doe';
    $scope.email = 'john.doe@gmail.com'; 
});
</script>






<div class="hero-foot">
<nav class="tabs is-boxed is-fullwidth is-large">
        <div class="container">
          <ul>
            <li class="tab is-active" onclick="openTab(event,'WebDev')"><a >Web Development</a></li>
            <li class="tab" onclick="openTab(event,'WebAud')"><a >Website Audit</a></li>
            <li class="tab" onclick="openTab(event,'Support')"><a >Support</a></li>
          </ul>
        </div>
      </nav>
  </div>
 
 
   <ul>
            <li class=" is-active" onclick="openTab(event,'WebDev')"><a >Web Development</a></li>
            <li class="" onclick="openTab(event,'WebAud')"><a >Website Audit</a></li>
            <li  onclick="openTab(event,'Support')"><a >Support</a></li>
          </ul>

<div class="container section">
    <div id="WebDev" class="content-tab" >
      <p>
        test1<br>
      Overview Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
    </div>
    <div id="WebAud" class="content-tab" style="display:none">
        <p>
          test2<br>
        Details Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
    </div>
    <div id="Support" class="content-tab" style="display:none">
       <p>
         test3 <br>  
       Specification Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
    </div>
</div>

<div class="dropdown is-active">
  <div class="dropdown-trigger">
    <button class="button" id="dropdown" aria-haspopup="true" aria-controls="dropdown-menu">
      <span>Dropdown button</span>
      <span class="icon is-small">
        <i class="fas fa-angle-down" aria-hidden="true"></i>
      </span>
    </button>
  </div>
  <div class="dropdown-menu" id="dropdown-menu" role="menu">
    <div class="dropdown-content">
      <a href="#" class="dropdown-item">
        Dropdown item
      </a>
      <a class="dropdown-item">
        Other dropdown item
      </a>
      <a href="#" class="dropdown-item is-active">
        Active dropdown item
      </a>
      <a href="#" class="dropdown-item">
        Other dropdown item
      </a>
      <hr class="dropdown-divider">
      <a href="#" class="dropdown-item">
        With a divider
      </a>
    </div>
  </div>
</div>
 </div>    
</body>
</html>