<!-- Site wrapper -->
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="" class="logo">
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Admin</b>LTE</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
         
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu ">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
              <span class="hidden-xs">{{ auth.getName() }}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- Menu Footer-->
              <li class="user-footer">
                {{link_to('session/logout' , 'Sign out')}}
              </li>
            </ul>
          </li>
                  
        </ul>
      </div>
    </nav>
  </header>

  <!-- =============================================== -->

  <!-- Left side column. contains the sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
      </div>

      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->

      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li>{{ link_to('dashboard/index', 'Dashboard') }}</li>
          </ul>
        </li>

        <li class="treeview">
          <a href="#">
          <i class="fa fa-user"></i> 
            <span>Customers</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li>{{ link_to('customers/search', ' <i class="fa fa-list" aria-hidden="true"></i>Customers') }}</li>
            <li>{{ link_to('customers/create', ' <i class="fa fa-plus" aria-hidden="true"></i> Create a Customer') }}</li>
            <li>{{ link_to('customers/index', ' <i class="fa fa-search" aria-hidden="true"></i> Search Customers') }}</li>
          </ul>
        </li>


        <li class="treeview">
          <a href="#">
          <i class="fa fa-money" aria-hidden="true"></i>

            <span>Payments</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li>{{ link_to('payments/search', ' <i class="fa fa-list" aria-hidden="true"></i> Payments') }}</li>
            <li>{{ link_to('payments/create', ' <i class="fa fa-plus" aria-hidden="true"></i> Create a Payments') }}</li>
            <li>{{ link_to('payments/index', ' <i class="fa fa-search" aria-hidden="true"></i> Search Payments') }}</li>
          </ul>
        </li>



        <li class="treeview">
          <a href="#">
           <i class="fa fa-users" aria-hidden="true"></i> <span>Users</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li> {{ link_to('users/search' , ' <i class="fa fa-list" aria-hidden="true"></i> Users') }} </li>
            <li>{{ link_to('users/index' , ' <i class="fa fa-search" aria-hidden="true"></i> Search Users') }}</li>
            <li>{{ link_to('users/create' , ' <i class="fa fa-plus" aria-hidden="true"></i> Create a User') }}</li>
            <li>{{ link_to('permissions/index' , ' <i class="fa fa-shield" aria-hidden="true"></i> Permissions') }}</a></li>
          </ul>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i> <span>Profiles</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li> {{ link_to('profiles/search' , ' <i class="fa fa-list" aria-hidden="true"></i> Profiles') }} </li>
            <li>{{ link_to('profiles/index' , ' <i class="fa fa-search" aria-hidden="true"></i> Search Profiles') }}</li>
            <li>{{ link_to('profiles/create' , ' <i class="fa fa-plus" aria-hidden="true"></i> Create  a Profile') }}</li>
          </ul>
        </li>


    
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- =============================================== -->

  {{content()}}

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.8
    </div>
    <strong>Copyright &copy; 2017 All rights
    reserved.
  </footer>

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  
</div>
<!-- ./wrapper -->