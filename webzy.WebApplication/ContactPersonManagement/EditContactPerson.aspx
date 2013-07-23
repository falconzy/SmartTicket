<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditContactPerson.aspx.cs" Inherits="webzy.WebApplication.ContactPersonManagement.EditContactPerson" %>

<%@ Register src="../Miscellaneous/WebHeader.ascx" tagname="WebHeader" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>Edit Contact Person</title>
		<link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
	</head>
<body>
	<form id="EditContactPersonForm" class="mainbody" runat="server">
	<div>
		<uc1:WebHeader ID="WebHeader1" runat="server" />
	</div>
	<div id="header" style="height: 50px">
		<asp:ScriptManager ID="ScriptManager1" runat="server">
		</asp:ScriptManager>
	</div>
	<div id="content" class="row-fluid">
		<div id ="contentDetails" class="span8 offset3">
		<div><h3>Edit New Contact</h3></div>
	  <div><asp:UpdatePanel ID="UpdatePanelEditContactPerson" runat="server" 
			UpdateMode="Conditional">
		<ContentTemplate>
			<div class="ContentInside">
				<table style="width:100%;">
					<tr>
						<td class="style1" height="25" style="text-align: left">
							<asp:Label ID="lblName" runat="server" CssClass="label" Text="Contact Name: "></asp:Label>
						</td>
						<td>
							<asp:TextBox ID="txtContactName" runat="server" CssClass="textbox" 
                                Width="250px"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td class="style1" height="25" style="text-align: left">
							<asp:Label ID="lblCustomers" runat="server" CssClass="label" 
								Text="Customer: "></asp:Label>
						</td>
						<td>
							<asp:DropDownList ID="ddlCustomers" runat="server" ClientIDMode="Static" 
                                CssClass="combobox" Width="265px">
                            </asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td class="style1" style="text-align: left">
							<asp:Label ID="lblContactNumber" runat="server" CssClass="label" 
								Text="Mobile Number :"></asp:Label>
						</td>
						<td>
							<asp:TextBox ID="txtContactNo" runat="server" CssClass="textbox" 
								Width="250px"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td class="style1" style="text-align: left">
							<asp:Label ID="lblOfficeNumber" runat="server" CssClass="label" 
                                Text="Office Contact :"></asp:Label>
						</td>
						<td>
							<asp:TextBox ID="txtOfficeNo" runat="server" CssClass="textbox" Width="250px"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td class="style1" style="text-align: left">
							<asp:Label ID="lblEmailAddress" runat="server" CssClass="label" 
                                Text="Email Address :"></asp:Label>
						</td>
						<td>
							<asp:TextBox ID="txtEmailAdd" runat="server" Width="250px"></asp:TextBox>
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
                        <td class="style1" style="text-align: left">
                            <asp:Label ID="lblStatus" runat="server" CssClass="label" Text="Status :"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlStatus" runat="server" Width="265px">
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
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-inverse" 
                                onclick="btnEdit_Click" Text="UPDATE" Width="100px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:Button ID="btnCancel" runat="server" CssClass="btn btn-inverse" 
								onclick="btnCancel_Click" Text="BACK" Width="100px" />
						</td>
					</tr>
				</table>
			</div>
		</ContentTemplate>
		<Triggers>
			<asp:AsyncPostBackTrigger ControlID="btnEdit" EventName="Click" />
		</Triggers>
		</asp:UpdatePanel>
		</div>
	</div>
	</div>
    </form>
</body>
</html>
