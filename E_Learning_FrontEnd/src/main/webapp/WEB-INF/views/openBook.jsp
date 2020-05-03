<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link href="resources/css/openBook.css" rel="stylesheet" type="text/css">  
 
 
</head>
<body>
 
<div class="container-fluid" style="padding-top: 98px">   
 <div class="section" >
 
 <div class="columns">
  <div class="column is-one-quarter"> 
  <aside class="menu">
  <p class="menu-label clable"> 
  ${courseContent.course_Name} Tutorial 
  </p>
  <hr class="dropdown-divider">
  <ul class="menu-list">
  <c:forEach var="lessionC" items="${courseLession}">
      <li><a style="color: #ffffff;" class="courseLession" href="openCourceLession/${lessionC.lession_name}/${courseContent.course_Id}">${lessionC.lession_name}</a></li> 
  </c:forEach>
  </ul> 
</aside>
  </div>
  <div class="column courceDetailcol"> 
    <c:forEach items="${filedd}" var="file" varStatus="ii"> 
    <c:choose>
    <c:when test="${ii.index == 0}">
    <span style="color: #ffffff; font-size: 25px;"> <c:out value = "${file}"/><br></span>
    </c:when>    
    <c:otherwise>
    <c:out value = "${file}"/><br>
    </c:otherwise>
</c:choose>
  </c:forEach> 
  <div class="excontainer">
    <button id="loadbasic">basic load</button>
    <div id="result"></div>
 
</div>
  </div> 
</div>
 </div>
</div>


</body>
</html>