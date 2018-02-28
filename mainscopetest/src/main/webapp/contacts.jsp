<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
		<script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
	</head>
   <body>
      <sql:setDataSource var = "dataSource" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/test"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${dataSource}" var = "result">
         SELECT c.*, b.comercial FROM contacts as c INNER JOIN clients as b ON c.id_client=b.id_client;
      </sql:query>
 
	  <div class="" style="max-width: 100%;height:auto;" align="center">
	   <table class="table">
	   	<thead class="thead-dark">
		    <tr>
		      <th scope="col">Contact ID</th>
		      <th scope="col">Name</th>
		      <th scope="col">Email</th>
		      <th scope="col">Phone</th>
		      <th scope="col">Department</th>
		      <th scope="col">Client</th>
		      <th scope="col">Edit Contact</th>
		      <th scope="col">Delete</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach var = "row" items = "${result.rows}">
	            <tr>
	               <td><c:out value = "${row.id_contact}"/></td>
	               <td><c:out value = "${row.name}"/></td>
	               <td><c:out value = "${row.email}"/></td>
	               <td><c:out value = "${row.phone}"/></td>
	               <td><c:out value = "${row.department}"/></td>
	               <td><c:out value = "${row.comercial}"/></td>
	               <td align="center"><button type="button" class="editButton btn btn-warning"><i class="fas fa-edit"></i></button></td>
	               <td align="center"><button onclick="deleteContact(${row.id_contact},'${row.name}');" type="button" class="btn btn-danger"><i class="fas fa-times"></i></button></td>
	            </tr>
	         </c:forEach>
		  </tbody>
	   </table>
	  </div>
	
	<!-- Contact modal -->
	<div class="modal fade" id="editContactModal" tabindex="-1" role="dialog" aria-labelledby="editContactModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="editContactModalLabel">Edit Contact</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form class="form-signin" id="editContactFormModal">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" id="name_modal" name="name" class="form-control" placeholder="Name" autofocus style="margin-bottom:5px">
                <input type="text" id="email_modal" name="email" class="form-control" placeholder="Email" autofocus style="margin-bottom:5px">
                <input type="text" id="phone_modal" name="phone" class="form-control" placeholder="Phone" autofocus style="margin-bottom:5px">
                <input type="text" id="department_modal" name="department" class="form-control" placeholder="Department" autofocus style="margin-bottom:5px">
                <input type="hidden" id="contact_modal" name="contact" class="form-control" placeholder="contact" autofocus style="margin-bottom:5px">
            </form><!-- /form -->
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button onclick="editContact();" type="button" class="btn btn-primary" data-dismiss="modal">Edit contact</button>
	      </div>
	    </div>
	  </div>
	</div>
   </body>
</html>