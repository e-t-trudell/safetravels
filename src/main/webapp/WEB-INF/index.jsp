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
    <title>Expenses</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="row justify-content-center">
		<div class="col-lg-6">
   			<h1>Safe Travels</h1>
   			<table class=" border border-4 border-warning table table responsive table-striped table-bordered table-hover.active p-5">
   				<thead class="container-fluid">
   					<tr >
   						<th class="col-lg-3">Expense</th>
   						<th class="col-lg-3">Vendor</th>
   						<th class="col-lg-3">Amount</th>
   						<th class="col-lg-3">Actions</th>
   					</tr>
   				</thead>
   				<tbody>
   				<c:forEach var="expense" items="${allExpenses}">
   				<tr>
   					<td>
   						<a href="/expense/show/${expense.id}"><c:out value="${expense.name}"></c:out></a>
   					</td>
   					<td><c:out value="${expense.vendor}"></c:out></td>
   					<td>$<c:out value="${expense.amount}"></c:out></td>
   			
   					<td><a href="/expense/edit/${expense.id}"><button>Edit Me</button></a></td>
   					<td><form action="/expense/${expense.id}" method="post">
    						<input type="hidden" name="_method" value="delete">
    						<input type="submit" value="Delete">
						</form>
					</td> 
   				</tr>
   				</c:forEach>
   				</tbody>
   			</table>
   		</div>
  </div>
   <form:form class="col-lg-6 offset-lg-3" action="/expense/create" method="post" modelAttribute="expense">
   		<h3>Add an expense:</h3>
   		<div class="form-group row align-items-center">
   			<form:label path="name">Expense: </form:label>
   			<form:input class="form-control" path="name" placeholder="enter here"></form:input>
   			<form:errors path="name"></form:errors>
   		</div>
   		<div class="form-group row align-items-center">
   			<form:label path="vendor">Vendor: </form:label>
   			<form:input class="form-control" path="vendor" placeholder="enter here"></form:input>
   			<form:errors path="vendor"></form:errors>
   		</div>
   		<div class="form-group row align-items-center">
   			<form:label path="amount">Amount: $ </form:label>
   			<form:input class="form-control" path="amount" ></form:input>
   			<form:errors path="amount"></form:errors>
   		</div>
   		<div class="form-group row align-items-center">
   			<form:label path="description">Description: </form:label>
   			<form:input class="form-control" path="description" placeholder="Anything to say?"></form:input>
   			<form:errors path="description"></form:errors>
   		</div>
   		<div class="btn btn-primary">
   			<button>Submit</button>
   		</div>
   </form:form>
</body>
</html>
