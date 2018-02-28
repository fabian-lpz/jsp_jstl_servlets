function ajaxCall(){
	$.ajax({
	    type: 'GET',
	    url: 'indexActions',
	    dataType: 'text',
	    success: function(data) {
	        alert(data);
	    }
	});
}

function ajaxCallJSLT(jslt){
	$.ajax({
	    type: 'GET',
	    url: jslt+'.jsp',
	    dataType: 'html',
	    success: function(data) {
	        $('#gradContainer').html(data);
	        $('#navbarDropdownMenuLink').dropdown();
	    }
	});
}

function createClient(){
	var dataToPost = $('#clientFormModal').serialize() + "&type=client";
	$.ajax({
	    type: 'POST',
	    url: 'createServlet',
	    data: dataToPost,
	    dataType: 'text',
	    success: function(data) {
	    		$('#newClientModal').modal('toggle');
	        alert(data);
	        ajaxCallJSLT("clients");
	    }
	});
}

function createContact(){
	var dataToPost = $('#contactFormModal').serialize() + "&type=contact";
	$.ajax({
	    type: 'POST',
	    url: 'createServlet',
	    data: dataToPost,
	    dataType: 'text',
	    success: function(data) {
	    		$('#newContactModal').modal('hide');
	        alert(data);
	        ajaxCallJSLT("contacts");
	    }
	});
}

function deleteClient(id,name){
	if(confirm("¿Would you like to delete " + name + " ?")){
		$.ajax({
		    type: 'POST',
		    url: 'deleteServlet',
		    data: "type=client&id="+id,
		    dataType: 'text',
		    success: function(data) {
		        alert(data);
		        ajaxCallJSLT("clients");
		    }
		});
	}
}

function deleteContact(id,name){
	if(confirm("¿Would you like to delete " + name + " ?")){
		$.ajax({
		    type: 'POST',
		    url: 'deleteServlet',
		    data: "type=contact&id="+id,
		    dataType: 'text',
		    success: function(data) {
		        alert(data);
		        ajaxCallJSLT("contacts");
		    }
		});
	}
}

function editContact(){
	var dataToPost = $('#editContactFormModal').serialize() + "&type=contact";
	$.ajax({
	    type: 'POST',
	    url: 'updateServlet',
	    data: dataToPost,
	    dataType: 'text',
	    success: function(data) {
	    		$('#editContactFormModal').modal('hide');
	        alert(data);
	        ajaxCallJSLT("contacts");
	    }
	});
}

function editClient(){
	var dataToPost = $('#editClientFormModal').serialize() + "&type=client";
	$.ajax({
	    type: 'POST',
	    url: 'updateServlet',
	    data: dataToPost,
	    dataType: 'text',
	    success: function(data) {
	    		$('#editContactFormModal').modal('hide');
	        alert(data);
	        ajaxCallJSLT("clients");
	    }
	});
}

$(document).on('click','.editButton',function(){
	var $row = $(this).closest("tr");
    var $tds = $row.find("td");

	var data = Array();
	$.each($tds, function(index) {
		data[index] = $(this).text();
	});
	
	$('#contact_modal').val(data[0]);
	$('#name_modal').val(data[1]);
	$('#email_modal').val(data[2]);
	$('#phone_modal').val(data[3]);
	$('#department_modal').val(data[4]);
	
	$('#editContactModal').modal('toggle');
});

$(document).on('click','.editClient',function(){
	var $row = $(this).closest("tr");
    var $tds = $row.find("td");

	var data = Array();
	$.each($tds, function(index) {
		data[index] = $(this).text();
	});
	
	$('#edit_client').val(data[0]);
	$('#edit_comercial').val(data[1]);
	$('#edit_fiscal').val(data[2]);
	$('#edit_rfc').val(data[3]);
	$('#edit_address').val(data[4]);
	$('#edit_neighborhood').val(data[5]);
	$('#edit_postal').val(data[6]);
	$('#edit_city').val(data[7]);
	$('#edit_state').val(data[8]);
	
	$('#editClientModal').modal('toggle');
});

function addNewContactToClient(id){
	$('#client').val(id);
	$('#newContactModal').modal('show');
}