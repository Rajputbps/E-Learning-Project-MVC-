<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page isELIgnored="false" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div style="padding-top: 10%;">
 
 <c:forEach var="u" items="${usersDetail}">
 <p> ${u.f_name} </p>
 <p> ${u.l_name} </p>
 <p> ${u.gender} </p>
 <p> ${u.email} </p>
 
 </c:forEach>
 
      <h4>Form</h4>
    <form:form modelAttribute="users" action="adduser">
    <form:input path="f_name" />
    </form:form>  
    </div>
</body>
</html>