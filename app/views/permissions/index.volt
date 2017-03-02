
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   {{ content() }}
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       {{ link_to("users/search", "<i class='icon-plus-sign'></i> Create Users", "class": "btn btn-primary") }}
      </h1>

      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li><a href="#">Users</a></li>
        <li class="active">Permissions</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     <form method="post">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Search for a  Permission</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">

		  <div class="row">

              

               <div class="col-xs-1 col-xs-offset-3">
                 <div class="form-gorup"> <label for="profileId">Profile</label> </div>
               </div>
	            
	            <div class="col-xs-4">
	            <div class="form-group">
	              {{ select('profileId', profiles, 'using': ['id', 'name'], 'useEmpty': true, 'emptyText': '...', 'emptyValue': '' , 'class' :'form-control' ) }}
	            </div>
	          		
	            </div>

	            <div class="col-xs-2">
	             {{ submit_button('Search', 'class': 'btn btn-primary', 'name' : 'search') }}
	            </div>
           


          </div>

        </div>
        <!-- /.box-body -->
        
      </div>
      <!-- /.box -->



     <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Permissions </h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">

		  <div class="row">
			<div class="col-md-12">

              {% if request.isPost() and profile %}
 
				{% for resource, actions in acl.getResources() %}

					<h3>{{ resource }}</h3>

					<table class="table table-bordered table-striped" align="center">
						<thead>
							<tr>
								<th width="5%"></th>
								<th>Description</th>
							</tr>
						</thead>
						<tbody>
							{% for action in actions %}
							<tr>
								<td align="center"><input type="checkbox" name="permissions[]" value="{{ resource ~ '.' ~ action }}"  {% if permissions[resource ~ '.' ~ action] is defined %} checked="checked" {% endif %}></td>
								<td>{{ acl.getActionDescription(action) ~ ' ' ~ resource }}</td>
							</tr>
							{% endfor %}
						</tbody>
					</table>
							
				{% endfor %}

				<div class="pull-right"> {{ submit_button('Submit', 'class': 'btn btn-primary', 'name':'submit') }}   </div>



				{% endif %}
			</div>
          </div>

        </div>
        <!-- /.box-body -->
        
      </div>
      <!-- /.box -->


    </form>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->



