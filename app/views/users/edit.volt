
    <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  {{ content() }}
    <!-- Content Header (Page header) -->
    <section class="content-header">

        {{ link_to("users/search", "&larr; Go Back") }}
     
 
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li><a href="#">Users</a></li>
        <li class="active">Edit</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

     <form class="form" method="post" autocomplete="off">

      <!-- Default box -->
     <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Title</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">

      

             <!-- Custom Tabs -->
        <div class="nav-tabs-custom"
          >
            <ul class="nav nav-tabs">
                <li class="active"><a href="#A" data-toggle="tab">Basic</a></li>
                <li><a href="#B" data-toggle="tab">Successful Logins</a></li>
                <li><a href="#C" data-toggle="tab">Password Changes</a></li>
                <li><a href="#D" data-toggle="tab">Reset Passwords</a></li>
            </ul>

            <div class="tab-content">

            <div class="tab-pane active" id="A">

                {{ form.render("id" , ['class' : 'form-control']) }}

                <div class="span4">

                    <div class="clearfix">
                        <label for="name">Name</label>
                        {{ form.render("name" , ['class' : 'form-control']) }}
                    </div>

                    <div class="clearfix">
                        <label for="profilesId">Profile</label>
                        {{ form.render("profilesId" , ['class' : 'form-control']) }}
                    </div>

                    <div class="clearfix">
                        <label for="suspended">Suspended?</label>
                        {{ form.render("suspended" , ['class' : 'form-control']) }}
                    </div>

                </div>

                <div class="span4">

                    <div class="clearfix">
                        <label for="email">E-Mail</label>
                        {{ form.render("email" , ['class' : 'form-control']) }}
                    </div>

                    <div class="clearfix">
                        <label for="banned">Banned?</label>
                        {{ form.render("banned" , ['class' : 'form-control']) }}
                    </div>

                    <div class="clearfix">
                        <label for="active">Confirmed?</label>
                        {{ form.render("active" , ['class' : 'form-control']) }}
                    </div>

                </div>
            </div>

              <!-- /.tab-pane -->
            <div class="tab-pane" id="B">
                <p>
                    <table class="table table-bordered table-striped" align="center">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>IP Address</th>
                                <th>User Agent</th>
                            </tr>
                        </thead>
                        <tbody>
                        {% for login in user.successLogins %}
                            <tr>
                                <td>{{ login.id }}</td>
                                <td>{{ login.ipAddress }}</td>
                                <td>{{ login.userAgent }}</td>
                            </tr>
                        {% else %}
                            <tr><td colspan="3" align="center">User does not have successfull logins</td></tr>
                        {% endfor %}
                        </tbody>
                    </table>
                </p>
            </div>
              <!-- /.tab-pane -->
            <div class="tab-pane" id="C">
                <p>
                    <table class="table table-bordered table-striped" align="center">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>IP Address</th>
                                <th>User Agent</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                        {% for change in user.passwordChanges %}
                            <tr>
                                <td>{{ change.id }}</td>
                                <td>{{ change.ipAddress }}</td>
                                <td>{{ change.userAgent }}</td>
                                <td>{{ date("Y-m-d H:i:s", change.createdAt) }}</td>
                            </tr>
                        {% else %}
                            <tr><td colspan="3" align="center">User has not changed his/her password</td></tr>
                        {% endfor %}
                        </tbody>
                    </table>
                </p>
            </div>
              <!-- /.tab-pane -->
            <div class="tab-pane" id="D">
                <p>
                    <table class="table table-bordered table-striped" align="center">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Date</th>
                                <th>Reset?</th>
                            </tr>
                        </thead>
                        <tbody>
                        {% for reset in user.resetPasswords %}
                            <tr>
                                <th>{{ reset.id }}</th>
                                <th>{{ date("Y-m-d H:i:s", reset.createdAt) }}
                                <th>{{ reset.reset == 'Y' ? 'Yes' : 'No' }}
                            </tr>
                        {% else %}
                            <tr><td colspan="3" align="center">User has not requested reset his/her password</td></tr>
                        {% endfor %}
                        </tbody>
                    </table>
                </p>
            </div>
             <!-- /.tab-pane -->

            </div>
            <!-- /.tab-content -->
          </div>
          <!-- nav-tabs-custom -->
          


        </div>
        <!-- /.box-body -->
        <div class="box-footer">
         <span class="pull-right">  {{ submit_button("Save", "class": "btn btn-sm btn-success") }} </span>
        </div>
        
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
      </form>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
