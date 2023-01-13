<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
 
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   
   <form:form class="col-lg-6 offset-lg-3 border border-4 border-success mt-5 mx-auto p-5" style="width: 500px;" action="/expense/edit/{id}" method="post" modelAttribute="expense">
   		<div>
   			<h3>Edit Page</h3>
   			<h5><a href="/">Dashboard</a></h5>
   		</div>
   		
   		<input type="hidden" name="_method" value="put"/>
   		<form:hidden path="id" value="${expense.id}"/>
   		<div class="form-group row  align-items-center justify-content-center">
   			<form:label path="name">Expense: </form:label>
   			<form:input class="form-control border border-info" path="name" value="${expense.name}"></form:input>
   			<form:errors path="name"></form:errors>
   		</div>
   		<div class="form-group row  align-items-center">
   			<form:label path="vendor">Vendor: </form:label>
   			<form:input class="form-control border border-info" path="vendor" value="${expense.vendor}"></form:input>
   			<form:errors path="vendor"></form:errors>
   		</div>
   		<div class="form-group row  align-items-center">
   			<form:label path="amount">Amount: $ </form:label>
   			<form:input class="form-control border border-info" path="amount" value="${expense.amount}"></form:input>
   			<form:errors path="amount"></form:errors>
   		</div>
   		<div class="form-group row  align-items-center">
   			<form:label path="description">Description: </form:label>
   			<form:input class="form-control border border-info" path="description" value="${expense.description}"></form:input>
   			<form:errors path="description"></form:errors>
   		</div>
   		<div class="btn btn-primary">
   			<button>Submit</button>
   		</div>
   </form:form>
</body>
</html>
