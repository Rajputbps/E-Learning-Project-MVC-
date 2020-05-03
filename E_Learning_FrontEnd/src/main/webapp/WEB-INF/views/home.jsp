<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@page isELIgnored="false"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 
 <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Education</title>
 <link href="resources/css/Home.css" rel="stylesheet" type="text/css">  
 <script type="text/javascript" src="resources/JavaScript/nav.js"></script>
</head>
<body>
  <div class="container-fluid" >  
  
  <!-- First div -->
   
  	<div class="div1" style="background-image: linear-gradient(to bottom right,#2979ff,#90caf9,#64b5f6);padding-top: 98px">    
  	  
  	  <div  class="section"  style="padding-top: 80px;">
  	  <div class="columns"> 
  <div class="column">
     <figure class="image is-3by2">
  		<img src="https://images.unsplash.com/photo-1521185496955-15097b20c5fe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60">
	</figure>
  </div>
  <div class="column">
    <h1 class="fontStyle has-text-centered is-capitalized">Learn Your <br>Favorite Course<br> From Online</h1>
  </div>
</div>
  	  </div>
  	  
  	</div>
  	
  	<!-- Second Div -->
  	<div class="div1"  style="background-image: linear-gradient(to bottom right,#388e3c,#a5d6a7 ,#76ff03);"> 
  	
  	 <div  class="section" style="padding-top: 110px;"> 
  	  <div class="columns">
  	  <div class="column">
  	  <h1 class="title is-3 is-spaced has-text-white is-italic is-capitalized" style="padding-top:35px;"> Over 7000 Tutorials <br>from 20 Courses </h1>
    <h1 class="has-text-left subtitle is-5 is-capitalized has-text-white ">Our set he for firmament morning sixth subdue darkness creeping gathered divide our let god moving. Moving in fourth air night bring upon you’re it beast let you dominion likeness open place day great wherein heaven sixth lesser subdue fowl
  	 </h1> 
  	 
  	 <button class="button is-rounded is-info is-outlined is-medium is-fullwidth" style="margin-top:65px;" ><b>ENROLEL FOR COURSE</b> </button>
  </div>
  <div class="column">
     <figure class="image is-3by2">
  		<img src="https://images.unsplash.com/photo-1521185496955-15097b20c5fe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60">
	</figure>
  </div>
  
</div>
  	  </div>
  	</div>
  	
  	<!-- Third Div -->
  	
  	<div style="width:100%;height:200px; background-color:#fff;">  
  	<div class="section has-text-centered">
  	<p class="title is-2 is-spaced ">Popular Courses</p>
	<p class="subtitle is-4">You all Favorite Course Available Here !!!!!</p>
  	</div>
  	
  	</div>
  	
  	<!-- Fourth div -->
  	<div class="div1"  style="background-image: linear-gradient(to bottom right,#546e7a ,#b0bec5  ,#78909c ); padding: 50px 50px 50px 50px;">  
    
    <div class="columns">
  <div class="column">

		<a href="courceDetail">
		<div class="card">
  <div class="card-image" style="padding:15px 15px 0px 15px;">
    <figure class="image is-4by3">
      <img src="https://cdn.iconscout.com/icon/free/png-512/c-programming-569564.png" alt="Placeholder image">
    </figure>
  </div>
  <div class="card-content">
    <div class="media"> 
      <div class="media-content">
        <p class="title is-4">C Programming</p>
        
      </div>
    </div>
  </div>
</div>
		</a>

  </div>
  <div class="column">

	<div class="card">
  <div class="card-image" style="padding:15px 15px 0px 15px;">
    <figure class="image is-4by3">
      <img src="resources/images/C++.jpg" alt="Placeholder image">
    </figure>
  </div>
  <div class="card-content">
    <div class="media"> 
      <div class="media-content">
        <p class="title is-4">C++ Programming</p>
        
      </div>
    </div>
  </div>
</div>

  </div>
  <div class="column">

	<div class="card">
  <div class="card-image" style="padding:15px 15px 0px 15px;">
    <figure class="image is-4by3" >
      <img src="resources/images/Java.jpg" alt="Placeholder image">
    </figure>
  </div>
  <div class="card-content">
    <div class="media"> 
      <div class="media-content">
        <p class="title is-4">Java</p>
        
      </div>
    </div>
  </div>
</div>

  </div>
  <div class="column">
	
	<div class="card">
  <div class="card-image" style="padding:15px 15px 0px 15px;">
    <figure class="image is-4by3">
      <img src="resources/images/HTML5.png" alt="Placeholder image">
    </figure>
  </div>
  <div class="card-content">
    <div class="media"> 
      <div class="media-content">
        <p class="title is-4">HTML</p>
        
      </div>
    </div>
  </div>
</div>
	
  </div>
</div>
<div class="has-text-centered"> 
<a class="button is-link is-inverted is-outlined" style="width:150px;" href="allCorse"><b>More...</b></a>
</div>
  	
  	</div>
  </div> 
  <a href="adminPanal">Admin</a>
  
  <%@include file="footer.jsp"%>
</body>
</html>
