
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   {{ content() }}
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
      {{ link_to("customers/create", "Create Customers" , 'class': 'btn btn-primary') }}
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
          <h3 class="box-title">Search for Customers</h3>

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

                <!-- form start -->
               {{ form("customers/search", "method":"post", "autocomplete" : "off", "class" : "form-horizontal") }}
                  <div class="box-body">

                    <div class="form-group">
                        <label for="fieldId" class="col-sm-2 control-label">Id</label>
                        <div class="col-sm-10">
                            {{ text_field("id", "type" : "numeric", "class" : "form-control", "id" : "fieldId") }}
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="fieldName" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            {{ text_field("name", "size" : 30, "class" : "form-control", "id" : "fieldName") }}
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="fieldSurname" class="col-sm-2 control-label">Surname</label>
                        <div class="col-sm-10">
                            {{ text_field("surname", "size" : 30, "class" : "form-control", "id" : "fieldSurname") }}
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="fieldEmail" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            {{ text_field("email", "size" : 30, "class" : "form-control", "id" : "fieldEmail") }}
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="fieldGender" class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-10">
                            {{ text_field("gender", "size" : 30, "class" : "form-control", "id" : "fieldGender") }}
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="fieldJuridiction" class="col-sm-2 control-label">Juridiction</label>
                        <div class="col-sm-10">
                            {{ text_field("juridiction", "size" : 30, "class" : "form-control", "id" : "fieldJuridiction") }}
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="fieldPhone" class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-10">
                            {{ text_field("phone", "size" : 30, "class" : "form-control", "id" : "fieldPhone") }}
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="fieldContractstatus" class="col-sm-2 control-label">ContractStatus</label>
                        <div class="col-sm-10">
                            {{ text_field("contractStatus", "type" : "numeric", "class" : "form-control", "id" : "fieldContractstatus") }}
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="fieldService" class="col-sm-2 control-label">Service</label>
                        <div class="col-sm-10">
                            {{ text_field("service", "size" : 30, "class" : "form-control", "id" : "fieldService") }}
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="fieldAddress" class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-10">
                            {{ text_field("address", "size" : 30, "class" : "form-control", "id" : "fieldAddress") }}
                        </div>
                    </div>


            

         
                  </div>
                  <!-- /.box-body -->
                  <div class="box-footer">
                      {{ submit_button('Search', 'class': 'btn btn-info pull-right') }}
                  </div>
                  <!-- /.box-footer -->
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

