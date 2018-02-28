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
         SELECT * FROM clients;
      </sql:query>
 
	  <div class="" style="max-width: 100%;height:auto;" align="center">
	   <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newClientModal"><i class="fas fa-plus"></i>   Add new client</button>
	   <br/>
	   <br/>
	   <table class="table">
	   	<thead class="thead-dark">
		    <tr>
		      <th scope="col">Client ID</th>
		      <th scope="col">Comercial Name</th>
		      <th scope="col">Fiscal Name</th>
		      <th scope="col">RFC</th>
		      <th scope="col">Address</th>
		      <th scope="col">Neighborhood</th>
		      <th scope="col">Postal Code</th>
		      <th scope="col">City</th>
		      <th scope="col">State</th>
		      <th scope="col">Edit</th>
		      <th scope="col">New Contact</th>
		      <th scope="col">Delete</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach var = "row" items = "${result.rows}">
	            <tr>
	               <td><c:out value = "${row.id_client}"/></td>
	               <td><c:out value = "${row.comercial}"/></td>
	               <td><c:out value = "${row.fiscal}"/></td>
	               <td><c:out value = "${row.rfc}"/></td>
	               <td><c:out value = "${row.address}"/></td>
	               <td><c:out value = "${row.neighborhood}"/></td>
	               <td><c:out value = "${row.postal_code}"/></td>
	               <td><c:out value = "${row.city}"/></td>
	               <td><c:out value = "${row.state}"/></td>
	               <td align="center"><button type="button" class="btn btn-warning editClient"><i class="fas fa-edit"></i></button></td>
	               <td align="center"><button onclick="addNewContactToClient(${row.id_client});" type="button" class="btn btn-success"><i class="fas fa-plus"></i></button></td>
	               <td align="center"><button onclick="deleteClient(${row.id_client},'${row.comercial}');" type="button" class="btn btn-danger"><i class="fas fa-times"></i></button></td>
	            </tr>
	         </c:forEach>
		  </tbody>
	   </table>
	  </div>
	  
	<!-- Client modal -->
	<div class="modal fade" id="newClientModal" tabindex="-1" role="dialog" aria-labelledby="newClientModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="newClientModalLabel">Add new client</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form class="form-signin" id="clientFormModal">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" id="comercial" name="comercial" class="form-control" placeholder="Comercial Name" autofocus style="margin-bottom:5px">
                <input type="text" id="fiscal" name="fiscal" class="form-control" placeholder="Fiscal Name" autofocus style="margin-bottom:5px">
                <input type="text" id="rfc" name="rfc" class="form-control" placeholder="RFC" autofocus style="margin-bottom:5px">
                <input type="text" id="address" name="address" class="form-control" placeholder="Address" autofocus style="margin-bottom:5px">
                <input type="text" id="neighborhood" name="neighborhood" class="form-control" placeholder="Neighborhood" autofocus style="margin-bottom:5px">
                <input type="text" id="postal" name="postal" class="form-control" placeholder="Postal Code" autofocus style="margin-bottom:5px">
                <input type="text" id="city" name="city" class="form-control" placeholder="City" autofocus style="margin-bottom:5px">
                <input type="text" id="state" name="state" class="form-control" placeholder="State" autofocus style="margin-bottom:5px">
            </form><!-- /form -->
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button onclick="createClient();" type="button" class="btn btn-primary" data-dismiss="modal">Add client</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Client Edit modal -->
	<div class="modal fade" id="editClientModal" tabindex="-1" role="dialog" aria-labelledby="editClientModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="editClientModalLabel">Edit client</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form class="form-signin" id="editClientFormModal">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" id="edit_comercial" name="comercial" class="form-control" placeholder="Comercial Name" autofocus style="margin-bottom:5px">
                <input type="text" id="edit_fiscal" name="fiscal" class="form-control" placeholder="Fiscal Name" autofocus style="margin-bottom:5px">
                <input type="text" id="edit_rfc" name="rfc" class="form-control" placeholder="RFC" autofocus style="margin-bottom:5px">
                <input type="text" id="edit_address" name="address" class="form-control" placeholder="Address" autofocus style="margin-bottom:5px">
                <input type="text" id="edit_neighborhood" name="neighborhood" class="form-control" placeholder="Neighborhood" autofocus style="margin-bottom:5px">
                <input type="text" id="edit_postal" name="postal" class="form-control" placeholder="Postal Code" autofocus style="margin-bottom:5px">
                <input type="text" id="edit_city" name="city" class="form-control" placeholder="City" autofocus style="margin-bottom:5px">
                <input type="text" id="edit_state" name="state" class="form-control" placeholder="State" autofocus style="margin-bottom:5px">
                <input type="hidden" id="edit_client" name="client" class="form-control" placeholder="Client" autofocus style="margin-bottom:5px">
            </form><!-- /form -->
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button onclick="editClient();" type="button" class="btn btn-primary" data-dismiss="modal">Edit client</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Contact modal -->
	<div class="modal fade" id="newContactModal" tabindex="-1" role="dialog" aria-labelledby="newContactModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="newContactModalLabel">Add new Contact</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form class="form-signin" id="contactFormModal">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" id="name" name="name" class="form-control" placeholder="Name" autofocus style="margin-bottom:5px">
                <input type="text" id="email" name="email" class="form-control" placeholder="Email" autofocus style="margin-bottom:5px">
                <input type="text" id="phone" name="phone" class="form-control" placeholder="Phone" autofocus style="margin-bottom:5px">
                <input type="text" id="department" name="department" class="form-control" placeholder="Department" autofocus style="margin-bottom:5px">
                <input type="hidden" id="client" name="client" class="form-control" placeholder="client" autofocus style="margin-bottom:5px">
            </form><!-- /form -->
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button onclick="createContact();" type="button" class="btn btn-primary" data-dismiss="modal">Add contact</button>
	      </div>
	    </div>
	  </div>
	</div>
   </body>
</html>