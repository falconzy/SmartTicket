<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="webzy.WebApplication.Login" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGIN</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
	<link href="Styles/Login.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="LoginForm" runat="server">
	   <div id="header-wrapper">
<div class ="row">
  <div class ="span1"></div>
  <div class ="span10"><h1>Smart Ticket</h1></div>
 </div>
</div>
	   <div id="Loginheader" style="height: 150px">	
		   <asp:ScriptManager ID="ScriptManager1" runat="server">
		   </asp:ScriptManager>
	   </div>
	   <div style="clear: both">
	<asp:UpdatePanel ID="UpdatePanelLogin" runat="server" 
		UpdateMode="Conditional">
	<ContentTemplate>
	    <div class="container">
		<div class="row">
		<div class="span4"></div>
				<div class="form-signin span4 offset4 well">
					<h2 class="form-signin-heading">Please sign in</h2>
					<asp:Panel ID="panelError" runat="server" CssClass="alert alert-error" 
						Visible="False">
						<asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
					</asp:Panel>
					<div style="margin: 5px">
					<asp:TextBox ID="txtboxUsername" runat="server" CssClass="span3"></asp:TextBox>
					<asp:TextBoxWatermarkExtender ID="txtboxUsername_TextBoxWatermarkExtender" 
						runat="server" TargetControlID="txtboxUsername" WatermarkText="User Name">
					</asp:TextBoxWatermarkExtender>
					<asp:TextBox ID="txtboxPassword" runat="server" CssClass="span3" 
						TextMode="Password"></asp:TextBox>
					<asp:TextBoxWatermarkExtender ID="txtboxPassword_TextBoxWatermarkExtender" 
						runat="server" TargetControlID="txtboxPassword" WatermarkText="Password">
					</asp:TextBoxWatermarkExtender>
					</div>
					<div style="margin: 5px"><label class="checkbox">
					<asp:CheckBox ID="chkboxRemember" runat="server" Text="Remember Me" />
					</label></div>
					
					<div style="margin: 15px 0px 0px 0px">					<asp:Button ID="btnLogin" 
							CssClass="btn btn-info btn-block" runat="server" 
						Text="Login" onclick="btnLogin_Click" /></div>

			</div>
		</div>
		</div>
	</ContentTemplate>
		<Triggers>
			<asp:AsyncPostBackTrigger ControlID="btnLogin" EventName="Click" />
		</Triggers>
	</asp:UpdatePanel>
	</div>
	<div id="footer"></div>
    </form>
</body>
</html>
