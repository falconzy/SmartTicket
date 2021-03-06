﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditGroup.aspx.cs" Inherits="webzy.WebApplication.GroupManagement.EditGroup" %>

<%@ Register src="../Miscellaneous/WebHeader.ascx" tagname="WebHeader" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>Add Group</title>
		<link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.style1
		{
			width: 30%;
		}
	</style>
</head>
<body>
	<form id="AddGroupForm" class="mainbody" runat="server">
	<div>
	</div>
	<div id="header" style="height: 50px">
		<asp:ScriptManager ID="ScriptManager1" runat="server">
		</asp:ScriptManager>
		<uc1:WebHeader ID="WebHeader1" runat="server" />
	</div>
	<div id="content" class="row-fluid">
	 <div id ="contentDetails" class="span8 offset3">
	<div><h3>Edit Group</h3></div>
	<div>
		<asp:UpdatePanel ID="UpdatePanelEditGroup" runat="server" 
			UpdateMode="Conditional">
		<ContentTemplate>
			<div class="ContentInside" style="margin-top: 5%">
				<table style="width:100%;">
					<tr>
						<td class="style1" height="25" style="text-align: left">
							<asp:Label ID="lblGroupName" runat="server" CssClass="label" 
								Text="Group Name: "></asp:Label>
						</td>
						<td>
							<asp:TextBox ID="txtGroupName" runat="server" CssClass="textbox" Width="250px"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td class="style1" height="25" style="text-align: left">
							<asp:Label ID="lblEmailAdd" runat="server" CssClass="label" 
								Text="Email Address : "></asp:Label>
						</td>
						<td>
							<asp:TextBox ID="txtEmailAddress" runat="server" CssClass="textbox" 
								Width="250px"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td class="style2" style="text-align: left">
							<asp:Label ID="lblCustomer" runat="server" CssClass="label" 
								Text="Viewable by Customer: "></asp:Label>
						</td>
						<td class="style3">
								 <div class="btn-group" data-toggle="buttons-radio">
								<asp:Button ID="btnViewByCustomerYes" class="btn" runat="server" Text="Yes" 
										 onclick="btnViewByCustomerYes_Click" />
								<asp:Button ID="btnViewByCustomerNo"  class="btn" runat="server" Text="No" 
										 onclick="btnViewByCustomerNo_Click" />
</div></td>
					</tr>
					<tr>
						<td class="style1" style="text-align: left">
							&nbsp;</td>
						<td>
							&nbsp;</td>
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
						<td class="style1" style="text-align: left">
							<asp:Label ID="lblStatus" runat="server" CssClass="label" Text="Status :"></asp:Label>
						</td>
						<td>
							<asp:DropDownList ID="ddlStatus" runat="server" AutoCompleteMode="Suggest" 
								ClientIDMode="Static" CssClass="combobox" Width="200px">
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td class="style1">
							&nbsp;</td>
						<td style="padding: 10px 0px 10px 0px">
							<asp:Label ID="lblErrorMsg" runat="server" CssClass="text-error"></asp:Label>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td style="text-align:inherit">
							<asp:Button ID="btnEdit" runat="server" CssClass="btn btn-inverse" 
								onclick="btnEdit_Click" Text="EDIT" Width="100px" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnUpdate" 
								runat="server" CssClass="btn btn-inverse" 
								onclick="btnUpdate_Click" Text="UPDATE" Width="100px" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:Button ID="btnCancel" runat="server" CssClass="btn btn-inverse" 
								onclick="btnCancel_Click" Text="BACK" Width="100px" />
						</td>
					</tr>
				</table>
			</div>
		</ContentTemplate>
		<Triggers>
			<asp:AsyncPostBackTrigger ControlID="btnEdit" EventName="Click" />
			<asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
			<asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click" />
			<asp:AsyncPostBackTrigger ControlID="btnViewByCustomerNo" EventName="Click" />
			<asp:AsyncPostBackTrigger ControlID="btnViewByCustomerYes" EventName="Click" />
		</Triggers>
		</asp:UpdatePanel>
		</div>
	</div>
	</div>
	<div id="footer" class="txtCenter"></div>
	</form>
</body>
</html>
