<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="webzy.WebApplication.UserManagement.EditUser" %>

<%@ Register src="../Miscellaneous/WebHeader.ascx" tagname="WebHeader" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit User</title>
	<link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="EditUser" runat="server">
	<div>
		<uc1:WebHeader ID="WebHeader1" runat="server" />
	</div>
	<div id="header" style="height: 50px">
		<asp:ScriptManager ID="ScriptManager1" runat="server">
		</asp:ScriptManager>
	</div>
	<div id="content" class="row-fluid">
	<div id ="contentDetails" class="span8 offset3">
	<div><h3>Edit User [<asp:Label ID="lblloginID" runat="server" CssClass="info"></asp:Label>]</h3></div>
		<asp:UpdatePanel ID="UpdatePanelEditUser" runat="server" 
			UpdateMode="Conditional">
			<ContentTemplate>
					<div class="ContentInside">
						<table style="width:100%;">
							<tr>
								<td class="style1" height="25" style="text-align: left">
									<asp:Label ID="lblName" runat="server" CssClass="label" Text="User Name : "></asp:Label>
								</td>
								<td>
									<asp:TextBox ID="txtUserName" runat="server" CssClass="textbox" Width="250px"></asp:TextBox>
								</td>
							</tr>
							<tr>
								<td class="style1" style="text-align: left">
									<asp:Label ID="lblEmailAdd" runat="server" CssClass="label" 
										Text="Email Address : "></asp:Label>
								</td>
								<td>
									<asp:TextBox ID="txtEmailAddress" runat="server" CssClass="textbox" 
										Width="250px"></asp:TextBox>
								</td>
							</tr>
							<tr>
								<td class="style1" style="text-align: left">
									<asp:Label ID="lblContactNumber" runat="server" CssClass="label" 
										Text="Contact Number : "></asp:Label>
								</td>
								<td>
									<asp:TextBox ID="txtContactNumber" runat="server" CssClass="textbox" 
										Width="250px"></asp:TextBox>
								</td>
							</tr>
							<tr>
								<td class="style1" style="text-align: left">
									<asp:Label ID="lblpassword" runat="server" CssClass="label" Text="Password : "></asp:Label>
								</td>
								<td>
									<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="250px"></asp:TextBox>
								</td>
							</tr>
							<tr>
								<td class="style1" style="text-align: left">
									<asp:Label ID="lblRepassword" runat="server" CssClass="label" 
										Text="Confirm Password : "></asp:Label>
								</td>
								<td>
									<asp:TextBox ID="txtRePassword" runat="server" TextMode="Password" 
										Width="250px"></asp:TextBox>
								</td>
							</tr>
							<tr>
								<td class="style1" style="text-align: left">
									<asp:Label ID="lblGroup" runat="server" CssClass="label" 
										Text="Assign to Group :"></asp:Label>
								</td>
								<td>
									<asp:DropDownList ID="ddlGroup" runat="server" Width="265px">
									</asp:DropDownList>
								</td>
							</tr>
							<tr>
								<td class="style1" style="text-align: left">
									<asp:Label ID="lblUserRole" runat="server" CssClass="label" Text="Role :"></asp:Label>
								</td>
								<td>
									<asp:DropDownList ID="ddlRole" runat="server" Width="265px">
									</asp:DropDownList>
								</td>
							</tr>
							<tr>
								<td class="style1" style="text-align: left">
									<asp:Label ID="lblStatus" runat="server" CssClass="label" Text="Status"></asp:Label>
								</td>
								<td>
									<asp:DropDownList ID="ddlStatus" runat="server" ClientIDMode="Static" 
										Width="265px">
									</asp:DropDownList>
								</td>
							</tr>
							<tr>
								<td class="style1" style="text-align: left">
									<asp:Label ID="lblRemarks" runat="server" CssClass="label" Text="Remarks : "></asp:Label>
								</td>
								<td>
									<asp:TextBox ID="txtRemarks" runat="server" CssClass="textbox" Height="90px" 
										TextMode="MultiLine" Width="250px"></asp:TextBox>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align:center">
									<asp:Label ID="lblErrorMsg" runat="server" CssClass="text-error"></asp:Label>
								</td>
							</tr>
							<tr>
								<td style="text-align:center">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
								<td style="text-align:inherit">
									<asp:Button ID="btnEdit" runat="server" CssClass="btn btn-inverse" Text="EDIT" 
										Width="100px" onclick="btnEdit_Click" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
										ID="btnUpdate" runat="server" CssClass="btn btn-inverse" 
										Text="UPDATE" Visible="False" Width="100px" onclick="btnUpdate_Click" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<asp:Button ID="btnCancel" runat="server" CssClass="btn btn-inverse" 
										Text="BACK" Width="100px" onclick="btnCancel_Click" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</ContentTemplate>
			<Triggers>
				<asp:AsyncPostBackTrigger ControlID="btnEdit" EventName="Click" />
				<asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click" />
			</Triggers>
		</asp:UpdatePanel>
	</div>
	</div>
	<div id="footer" class="txtCenter"></div>
    </form>
</body>
</html>
