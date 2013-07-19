<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebHeader.ascx.cs" Inherits="webzy.WebApplication.Miscellaneous.WebHeader" %>
<script src="../Scripts/jquery-2.0.2.min.js" type="text/javascript"></script>
<script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<div class="navbar navbar-inverse navbar-fixed-top">
	  <div class="navbar-inner">
		<div class="container">
		  <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		  <a class="brand" href="/Main.aspx">Smart Ticket</a>
		  <div class="nav-collapse collapse">
			<ul class="nav nav-pills">
			  <li class="">
				<a href="#">Get started</a>
			  </li>
			 <li class="dropdown">
				<a class="dropdown-toggle" id="drop4" role="button" data-toggle="dropdown" href="#">User Management<b class="caret"></b></a>
				<ul id="UserManagementmenu" class="dropdown-menu" aria-labelledby="dLabel">
				  <li role="presentation"><a role="menuitem" tabindex="-1" href="/UserManagement/UserManagementView.aspx">User Summary</a></li>
				  <li role="presentation"><a role="menuitem" tabindex="-1" href="/UserManagement/AddUser.aspx">Add User</a></li>
				  <li class="divider"></li>
				  <li role="presentation"><a role="menuitem" tabindex="-1" href="/RoleManagement/ViewRoleSummary.aspx">Role Summary</a></li>
				  <li role="presentation"><a role="menuitem" tabindex="-1" href="/RoleManagement/AddRole.aspx">Add Role</a></li>
				  <li class="divider"></li>
				  <li role="presentation"><a role="menuitem" tabindex="-1" href="/GroupManagement/ViewGroupSummary.aspx">Group Summary</a></li>
				  <li role="presentation"><a role="menuitem" tabindex="-1" href="/GroupManagement/AddGroup.aspx">Add Group</a></li>
				</ul>
			  </li>
			  <li class="">
				<a href="#">Modules</a>
			  </li>
			    <li class="dropdown">
				<a class="dropdown-toggle" id="A1" role="button" data-toggle="dropdown" href="#">Customer Management<b class="caret"></b></a>
				<ul id="Ul1" class="dropdown-menu" aria-labelledby="dLabel">
				  <li role="presentation"><a role="menuitem" tabindex="-1" href="/CustomerManagement/CustomerManagementView.aspx">Customer Summary</a></li>
				  <li role="presentation"><a role="menuitem" tabindex="-1" href="/CustomerManagement/AddCustomer.aspx">Add Customer</a></li>
				    <li class="divider"></li>
				  <li role="presentation"><a role="menuitem" tabindex="-1" href="/ContactPersonManagement/ViewContactPersonSummary.aspx">Contact Person Summary</a></li>
				  <li role="presentation"><a role="menuitem" tabindex="-1" href="/ContactPersonManagement/AddContactPerson.aspx">Add Contact Person</a></li>
				</ul>
			  </li>
			  <li>
				<a href="#">Service Status</a>
			  </li>
			  <li class="">
				<a href="/Login.aspx?logout=1">Log Out</a>
			  </li>
			</ul>
		  </div>
		</div>
	  </div>
	</div>
