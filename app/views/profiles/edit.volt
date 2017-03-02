
    <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  {{ content() }}
    <!-- Content Header (Page header) -->
    <section class="content-header">

         {{ link_to("profiles", "&larr; Go Back") }}
     
 
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li><a href="#">Profiles</a></li>
        <li class="active">Edit</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

     <form method="post" autocomplete="off">

      <!-- Default box -->
     <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Edit profile</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">

      

             <!-- Custom Tabs -->
        <div class="nav-tabs-custom">
        
        <ul class="nav nav-tabs">
            <li class="active"><a href="#A" data-toggle="tab">Basic</a></li>
            <li><a href="#B" data-toggle="tab">Users</a></li>
        </ul>

        <div class="tabbable">
                <div class="tab-content">
                    <div class="tab-pane active" id="A">

                        {{ form.render("id" , ['class' : 'form-control']) }}

                        <div class="clearfix">
                            <label for="name">Name</label>
                            {{ form.render("name" ,  ['class' : 'form-control']) }}
                        </div>

                        <div class="clearfix">
                            <label for="active">Active?</label>
                            {{ form.render("active" , ['class' : 'form-control']) }}
                        </div>

                    </div>

                    <div class="tab-pane" id="B">
                        <p>
                            <table class="table table-bordered table-striped" align="center">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Banned?</th>
                                        <th>Suspended?</th>
                                        <th>Active?</th>
                                    </tr>
                                </thead>
                                <tbody>
                                {% for user in profile.users %}
                                    <tr>
                                        <td>{{ user.id }}</td>
                                        <td>{{ user.name }}</td>
                                        <td>{{ user.banned == 'Y' ? 'Yes' : 'No' }}</td>
                                        <td>{{ user.suspended == 'Y' ? 'Yes' : 'No' }}</td>
                                        <td>{{ user.active == 'Y' ? 'Yes' : 'No' }}</td>
                                        <td width="12%">{{ link_to("users/edit/" ~ user.id, '<i class="icon-pencil"></i> Edit', "class": "btn") }}</td>
                                        <td width="12%">{{ link_to("users/delete/" ~ user.id, '<i class="icon-remove"></i> Delete', "class": "btn") }}</td>
                                    </tr>
                                {% else %}
                                    <tr><td colspan="3" align="center">There are no users assigned to this profile</td></tr>
                                {% endfor %}
                                </tbody>
                            </table>
                        </p>
                    </div>

                </div>
        </div>

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

