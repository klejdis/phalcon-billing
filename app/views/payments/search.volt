 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  {{ content() }}
    <!-- Content Header (Page header) -->
    <section class="content-header">

    {{ link_to("payments/index", "Go Back") }}
       
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li><a href="#">Payments</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Payments</h3>
            
          <div class="box-tools pull-right">
             {{ link_to("payments/create", "Create" , 'class' : 'btn btn-sm btn-default' ) }}
             {{link_to('payments/search' , 'Clear Filters' , 'class' : 'btn btn-sm btn-default' ) }}

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
                        <th>Date</th>
                        <th>Amount</th>
                        <th>Customer</th>

                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                   {% if page.items is defined %}
                    {% for payment in page.items %}
                        <tr>
                        <td>{{ payment.id }}</td>
                        <td>{{ payment.date }}</td>
                        <td>{{ payment.amount }} Lek</td>
                        <td>
                        {% set name = payment.customer.name %}
                        {% set sname = payment.customer.surname %}
                        {{link_to('customers/edit/'~payment.customer.id , name ~ ' ' ~sname )}}
                 
                        </td>

                            <td>{{ link_to("payments/edit/"~payment.id, "Edit" , 'class' : 'btn btn-sm btn-default') }}</td>
                            <td>{{ link_to("payments/delete/"~payment.id, "Delete" , 'class' : 'btn btn-sm btn-danger' , "onclick" : "return confirm('Are you sure ?')") }}</td>
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

