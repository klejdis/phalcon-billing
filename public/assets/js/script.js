$(document).ready(function(){
	//Date picker

		if($('#datepicker').length > 0){

			$('#datepicker').datepicker({
     			 autoclose: true,
     			 format: 'yyyy/mm/dd',
   			 });
		}
    	
    	

    	if($('#customersModal').length > 0){

    		$('#modalTrigger').on('click' , function(e){

    			$('#customersModal').modal();

    		});
			

			$('#ajaxSearch').on('keyup' , function(e){

				$('.table-container').empty();

				var str = $('#ajaxSearch').val();

				if (str == '' || str.length == 0) 
				{
					$('.table-container').empty();
					
				}else{


				 $.ajax({
					'type' : 'post',
					'url'  : 'create',
					'data' : { querystr : str },
					'success' : function(data){
						var data = JSON.parse(data);

							if(data.length > 0){

								//ADD THE RESULTS TO THE TABLE CONTAINER 
							data.forEach(function(obj , index){
								//APPEND THE OBJECT TO TABLE CONTAIENER
								var $tcontaiener = $('.table-container');
								var html = " <tr>";

									html+= "<td>";
									html+= obj.name;
									html+= "</td>";

									html+= "<td>";
									html+= obj.surname;
									html+= "</td>";

									html+= "<td>";
									html+= obj.email;
									html+= "</td>";

									html+= "<td>";
									html+= "<button class='btn btn-sm btn-success' data-id='"+obj.id+"' id='selectCustomer' >Select</button>";
									html+= "</td>";

									html+= "</tr>";
									$tcontaiener.append(html);


							});
							}

					},
					'error' : function(err){
						console.log(err);
					}
				});

				}


			});


			$('body').on('click' , '#selectCustomer' , function(e){
				var id = $(this).data('id');
				$('input[name="customerId"]').val(id);
				var name = $(this).closest('tr').children('td').eq(0).text();
				var surname = $(this).closest('tr').children('td').eq(1).text();
				$('input[name="customerName"]').val( name + surname);
				$('#customersModal').modal('hide');

			})
		}


		if ($('#paid-table').length > 0) {

			$('#paid-table').DataTable({
		      "paging": true,
		      "lengthChange": false,
		      "searching": true,
		      "ordering": true,
		      "info": true,
		      "autoWidth": false
		    });
		}


		if ($('#debitor-table').length > 0) {

			$('#debitor-table').DataTable({
		      "paging": true,
		      "lengthChange": false,
		      "searching": true,
		      "ordering": true,
		      "info": true,
		      "autoWidth": false
		    });
		
		}


		if ($('#search-table').length > 0) {

			$('#search-table').DataTable({
		      "paging": true,
		      "lengthChange": false,
		      "searching": true,
		      "ordering": true,
		      "info": true,
		      "autoWidth": false
		    });
		
		}



		if ($('#month-datepicker').length  > 0) {
			$('#month-datepicker').datepicker({
     			 autoclose: true,
     			 format: 'yyyy/mm/dd',
   			 });
		}


    
    
});