

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  {{ content() }}
    <!-- Content Header (Page header) -->
    <section class="content-header">

        {{ link_to("profiles/index", "&larr; Go Back") }}
       
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li><a href="#">Users</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Uses</h3>
            
          <div class="box-tools pull-right">
            {{ link_to("profiles/create", "Create profiles", "class": "btn btn-sm btn-default") }}

            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>  
          </div>
        </div>
        <div class="box-body">

            <div class="box-body table-responsive no-padding">

                {% for profile in page.items %}
                    {% if loop.first %}
                    <table class="table table-hover" align="center">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Active?</th>
                            </tr>
                        </thead>
                    {% endif %}
                        <tbody>
                            <tr>
                                <td>{{ profile.id }}</td>
                                <td>{{ profile.name }}</td>
                                <td>{{ profile.active == 'Y' ? 'Yes' : 'No' }}</td>
                                <td width="12%">{{ link_to("profiles/edit/" ~ profile.id, '<i class="icon-pencil"></i> Edit', "class": "btn btn-default") }}</td>
                                <td width="12%">{{ link_to("profiles/delete/" ~ profile.id, '<i class="icon-remove"></i> Delete', "class": "btn btn-default") }}</td>
                            </tr>
                        </tbody>
                   
                

                    {% else %}
                        No profiles are recorded
                    {% endfor %}
                </table>


                 <div class="pull-right">
                                    {{ link_to("profiles/search", '<i class="icon-fast-backward"></i> First', "class": "btn") }}
                                    {{ link_to("profiles/search?page=" ~ page.before, '<i class="icon-step-backward"></i> Previous', "class": "btn ") }}
                                    {{ link_to("profiles/search?page=" ~ page.next, '<i class="icon-step-forward"></i> Next', "class": "btn") }}
                                    {{ link_to("profiles/search?page=" ~ page.last, '<i class="icon-fast-forward"></i> Last', "class": "btn") }}
                                    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                                </div>


            </div>

          
         
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


