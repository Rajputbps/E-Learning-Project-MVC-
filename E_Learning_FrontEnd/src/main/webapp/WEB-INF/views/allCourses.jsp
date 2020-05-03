<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container-fluid" style="padding-top: 7%" >  
 <div class="section" >
 <div class="columns is-multiline" >
 <c:forEach items="${courseName}" var="course">
   <div class="column is-one-quarter"> 
       <div class="card" style="border-radius: 10px;">
  <div class="card-image" style="padding:15px 15px 0px 15px;">
    <figure class="image is-4by3">
      <img src="resources/images/${course.course_image}" alt="Placeholder image">
    </figure>
  </div>
  <div class="card-content">
    <div class="media"> 
      <div class="media-content">
        <p class="title is-4">
        <a href="courceDetail${course.course_Id}">${course.course_Name}</a>
        <a class="button is-info is-outlined is-pulled-right" href="registerCource${course.course_Id}">Join</a>
        </p>
      </div>
    </div>
  </div>
</div> 
  </div>    
 </c:forEach>  
</div>
 </div>
</div>
  <%@include file="footer.jsp"%>
</body>
</html>