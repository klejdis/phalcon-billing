
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   {{ content() }}
    <!-- Content Header (Page header) -->
    <section class="content-header">
         {{ link_to("users", "&larr; Go Back") }}
   

      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li><a href="#">Usrs</a></li>
        <li class="active">Create</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Create a Users</h3>

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

              <!-- Horizontal Form -->
              <div class="box box-info">
                <div class="box-header with-border">
                
                </div>
                <!-- /.box-header -->
                <!-- form start -->

                <form method="post"  autocomplete="off" class="form-horizontal">
                  <div class="box-body">

                    <div class="form-group">
                      <label for="" class="col-sm-2 control-label">Name</label>

                      <div class="col-sm-10">
                         {{ form.render("name" , ['class' : 'form-control'] ) }}
                      </div>
                    </div>


                    <div class="form-group">
                      <label for="" class="col-sm-2 control-label">EMAIL</label>

                      <div class="col-sm-10">
                          {{ form.render("email" , ['class' : 'form-control']) }}
                      </div>
                    </div>

                    <div class="form-group">
                      <label for="" class="col-sm-2 control-label">PROFILE</label>

                      <div class="col-sm-10">
                          {{ form.render("profilesId" , ['class' : 'form-control']) }}
                      </div>
                    </div>


         
                  </div>
                  <!-- /.box-body -->
                  <div class="box-footer">
                    <div class="pull-right">  {{ submit_button("Save", "class": "btn btn-success") }} </div>
                  </div>
                  <!-- /.box-footer -->
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
