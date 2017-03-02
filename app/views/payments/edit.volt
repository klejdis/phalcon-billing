
    <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  {{ content() }}
    <!-- Content Header (Page header) -->
    <section class="content-header">

        {{ link_to("payments/search", "Go Back") }}
     
 
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li><a href="#">Payements</a></li>
        <li class="active">Edit</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">



      <!-- Default box -->
     <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title"> Edit payments</h3>

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
                {{ form("payments/save", "method":"post", "autocomplete" : "off", "class" : "form-horizontal") }}
                  <div class="form-group">
                        <label for="fieldAmount" class=" control-label">Select a Customer</label>
                        <div class="input-group">
                            {{form.render('customerName' , ["class" : "form-control"])}}
                            <span class="input-group-addon btn btn-primary" id="modalTrigger"><i class="fa fa-mouse-pointer" aria-hidden="true"></i></span>
                        </div>
                  </div>


                    <div class="form-group">
                        <label class="control-label">Date:</label>

                        <div class="input-group date">
                          <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                          </div>
                          {{form.render('date' , ["class" : "form-control" , 'id': 'datepicker'])}}
                        </div>
                        <!-- /.input group -->
        
                    </div>

             
                  <div class="form-group">
                        <label for="fieldAmount" class=" control-label">Amount</label>
                        <div class="input-group">
                            {{form.render('amount' , ["class" : "form-control" , "id" : "fieldAmount"] )}}
                            <span class="input-group-addon">Lek</span>
                        </div>
                  </div>


                  {{form.render('customerId')}}
                  {{form.render('id')}}

             

              
                  <div class="form-group">
                        <div class="pull-right  ">
                        {{ submit_button('Save', 'class': 'btn btn-default') }}
                    </div>
                  </div>

                </form>
            </div>
        </div>
       

        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->


      <div class="modal fade" id="customersModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title">
                <input class="form-control" id="ajaxSearch" type="text" placeholder="Type to search Customers">
              </h4>
            </div>
            <div class="modal-body">
              <table class="table table-hover">
              <thead>
                <tr>
                  <td>Name</td>
                  <td>Surame</td>
                  <td>Email</td>
                </tr>
              </thead>
                <tbody class="table-container">
                  
                </tbody>
              </table>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

