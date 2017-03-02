
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   {{ content() }}
    <!-- Content Header (Page header) -->
    <section class="content-header">
       {{ link_to("customers/search", "Go Back") }}

      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li><a href="#">Customers</a></li>
        <li class="active">Create</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title"> Create a Customer </h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">

              <!-- Horizontal Form -->
              <div class="box box-info">
                <div class="box-header with-border">
                
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                {{ form("customers/create", "method":"post", "autocomplete" : "off", "class" : "form-horizontal") }}
              
             
                <div class="form-group">
                    <label for="fieldGender" class="col-sm-2 control-label">Gender</label>
                    <div class="col-sm-10">
                         {{ form.render('gender' , ["class" : "form-control"] )}}
                    </div>
                </div>

                <div class="form-group">
                    <label for="fieldName" class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-10">
                        {{ form.render('name' , ["class" : "form-control"] ) }}
                    </div>
                </div>

                <div class="form-group">
                    <label for="fieldSurname" class="col-sm-2 control-label">Surname</label>
                    <div class="col-sm-10">
                    {{ form.render('surname' , ["class" : "form-control"] ) }}
   
                    </div>
                </div>

                <div class="form-group">
                    <label for="fieldEmail" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">

                    {{ form.render('email' , ["class" : "form-control"] ) }}

                    </div>
                </div>

                <div class="form-group">
                    <label for="fieldJuridiction" class="col-sm-2 control-label">Juridiction</label>
                    <div class="col-sm-10">
                    {{ form.render('juridiction' , ["class" : "form-control"] ) }}
                    </div>
                </div>

                <div class="form-group">
                    <label for="fieldPhone" class="col-sm-2 control-label">Phone</label>
                    <div class="col-sm-10">
                        {{ form.render('phone' , ["class" : "form-control"] ) }}
                       
                    </div>
                </div>

                <div class="form-group">
                    <label for="fieldContractstatus" class="col-sm-2 control-label">ContractStatus</label>
                    <div class="col-sm-10">
                      {{ form.render('contractStatus' , ["class" : "form-control"] ) }}
                       
                    </div>
                </div>


                <div class="form-group">
                    <label for="fieldAddress" class="col-sm-2 control-label">Address</label>
                    <div class="col-sm-10">
                        {{ form.render('address' , ["class" : "form-control"] ) }}
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        {{ submit_button('Save', 'class': 'btn btn-success pull-right') }}
                    </div>
                </div>

                </form>
                
              </div>


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

