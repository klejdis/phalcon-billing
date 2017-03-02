
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   {{ content() }}
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
      {{ link_to("payments/create", "Create payments" ,'class': 'btn btn-primary') }}
      </h1>

      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li><a href="#">U sers</a></li>
        <li class="active">Search</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title"> Search payments</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">

        <div class="row">
            <div class="col-md-6 col-md-offset-3">

               
        {{ form("payments/search", "method":"post", "autocomplete" : "off", "class" : "form-horizontal") }}

        <div class="form-group">
            <label for="fieldId" class="col-sm-2 control-label">Id</label>
            <div class="col-sm-10">
                {{ text_field("id", "type" : "numeric", "class" : "form-control", "id" : "fieldId") }}
            </div>
        </div>

        <div class="form-group">
            <label for="fieldDate" class="col-sm-2 control-label">Date</label>
            <div class="col-sm-10">
                {{ text_field("date", "type" : "date", "class" : "form-control", "id" : "fieldDate") }}
            </div>
        </div>

        <div class="form-group">
            <label for="fieldAmount" class="col-sm-2 control-label">Amount</label>
            <div class="col-sm-10">
                {{ text_field("amount", "type" : "numeric", "class" : "form-control", "id" : "fieldAmount") }}
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                {{ submit_button('Search', 'class': 'btn btn-default') }}
            </div>
        </div>

        </form>

            </div>
        </div>

          
        

            

        </div>
        <!-- /.box-body -->
        
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->





