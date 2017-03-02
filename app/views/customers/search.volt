 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  {{ content() }}

    <!-- Content Header (Page header) -->
    <section class="content-header">

    {{ link_to("customers/index", "Go Back") }}
       
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li><a href="#">Users</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
  <p><?php $this->flashSession->output() ?></p>
      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Uses</h3>
            
          <div class="box-tools pull-right">
             {{ link_to("customers/create", "Create" , 'class' : 'btn btn-sm btn-default' ) }}
              {{ link_to("customers/search", "Clear Filters" , 'class' : 'btn btn-sm btn-default' ) }}


            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>  
          </div>
        </div>
        <div class="box-body">

            <div class="box-body table-responsive no-padding">

                <table class="table table-hover">
                    <thead>
                        <tr>
                          <th>Id</th>
                          <th>Name</th>
                          <th>Surname</th>
                          <th>Email</th>
                          <th>Juridiction</th>
                          <th>Phone</th>
                          <th>ContractStatus</th>
                          <th>Address</th>
                          <th></th>
                          <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    {% if page.items is defined %}
                    {% for customer in page.items %}
                        <tr>
                        <td>{{ customer.id }}</td>
                        <td>{{ customer.name }}</td>
                        <td>{{ customer.surname }}</td>
                        <td>{{ customer.email }}</td>                  
                        <td>{{ customer.juridiction }}</td>
                        <td>{{ customer.phone }}</td>
                        <td>
                          {% if customer.contractStatus == 1 %}
                           Active
                          {% endif %}
                          {% if customer.contractStatus == 0 %}
                           Non Active
                          {% endif %}
                          
                        </td>
                        <td>{{ customer.address }}</td>

                        <td>{{ link_to("customers/edit/"~customer.id, "Edit" , 'class' : 'btn btn-default') }}</td>
                        <td>{{ link_to("customers/delete/"~customer.id, "Delete" , 'class' : 'btn btn-danger' , 'onclick' : 'return confirm("Are you sure you want to delete this Customer?");') }}</td>
                        </tr>
                    {% endfor %}
                    {% endif %}
                    </tbody>
                </table> 

            </div>

         
        </div>
        <!-- /.box-body -->
        <div class="box-footer">    
             Current Page : {{ page.current }}  Total: {{page.total_pages }}
              <ul class="pagination pagination-sm no-margin pull-right">
               <li>{{ link_to("customers/search", "First") }}</li>
                <li>{{ link_to("customers/search?page="~page.before, "Previous") }}</li>
                <li>{{ link_to("customers/search?page="~page.next, "Next") }}</li>
                <li>{{ link_to("customers/search?page="~page.last, "Last") }}</li>
              </ul>
      
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


