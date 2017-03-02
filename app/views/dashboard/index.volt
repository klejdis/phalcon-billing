
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   {{ content() }}
    <!-- Content Header (Page header) -->
    <section class="content-header">
    <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

     <!-- Small boxes (Stat box) -->
      <div class="row">
        
        <div class="col-lg-4 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>{{ totalCustomers }}</h3>

              <p>Total Clients</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            {{ link_to('customers/search' ,  'More info <i class="fa fa-arrow-circle-right"></i>' ,'class':"small-box-footer" ) }}
            <a href="#" ></a>
          </div>
        </div>
        <!-- ./col -->


       <div class="col-lg-4 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3> {{ totalPayments }} </h3>
              <p>Paid</p>
            </div>
            <div class="icon">
              <i class="fa fa-check" aria-hidden="true"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      
     
        <div class="col-lg-4 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>{{ totalCustomers -  totalPayments }}</h3>

              <p>Debitors</p>
            </div>
            <div class="icon">
              <i class="fa fa-file" aria-hidden="true"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->

      </div>
      <!-- /.row -->
  


    <div class="row">
      <!--- LEFT COL -->
        <div class="col-md-6">
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Customers That Have Paid</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

              <table id="paid-table" class="table table-bordered table-hover dataTable">
              <thead>
                <tr>
                  <td><b>Nr.</b></td>
                  <td><b>Name</b></td>
                  <td><b>Surame</b></td>
                </tr>
              </thead>
                {% if paid is defined %}
                  {% for customer in paid %}
                    <tr> 
                      <td>{{loop.index}}</td>
                      <td> {{customer.name}}</td>
                      <td> {{customer.surname}}</td>
                    </tr>
                  {% endfor %}
                {% endif %}
              </table>

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        
        <!--- RIGHT COL -->
        <div class="col-md-6">
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Debitors</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              
            <table id="debitor-table" class="table table-hover">
              <thead>
                <tr>
                  <td><b>Nr.</b></td>
                  <td><b>Name</b></td>
                  <td><b>Surame</b></td>
                </tr>
              </thead>
                {% if debitor is defined %}
                  {% for customer in debitor %}
                    <tr> 
                      <td>{{loop.index}}</td>
                      <td> {{customer.name}}</td>
                      <td> {{customer.surname}}</td>
                    </tr>
                  {% endfor %}
                {% endif %}
              </table>

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
   </div> <!--end of row-->

    <div class="row">
        <div class="col-md-12">

        <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Custom Search</h3>
            </div>
            <div class="box-body">
              <div class="row">
                <form method="POST">
                <div class="col-xs-3">
                  {{ select('type' , ['paid' : 'Paid' , 'debitor' : 'Debitors'] , 'class' : 'form-control')}}
                </div>

                <div class="col-xs-3">
                    <div >
                  
                        <div class="input-group date" class="col-xs-5">
                          <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                          </div>
                          <input type="text" name="month" class="form-control"  class="col-xs-3" id="month-datepicker">
                    </div>
                </div>
                </div>

                <div class="col-xs-5">
                  <button type="submit" class="btn btn-success">Search</button>
                </div>
              </form>
              </div>

              
            <table id="search-table" class="table table-bordered table-hover dataTable">
              <thead>
                <tr>
                  <td><b>Nr.</b></td>
                  <td><b>Name</b></td>
                  <td><b>Surame</b></td>
                </tr>
              </thead>
                {% if search is defined %}
                  {% for customer in search %}
                    <tr> 
                      <td>{{loop.index}}</td>
                      <td> {{customer.name}}</td>
                      <td> {{customer.surname}}</td>
                    </tr>
                  {% endfor %}
                {% endif %}
              </table>



            </div>
            <!-- /.box-body -->
          </div>
        </div>
    </div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->





