<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddRole.aspx.cs" Inherits="webzy.WebApplication.RoleManagement.AddRole" %>

<%@ Register src="../Miscellaneous/WebHeader.ascx" tagname="WebHeader" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="AddRoleHead" runat="server">
	<title>Add Role</title>
	<link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.style1
		{
			width: 30%;
		}
	</style>
</head>
<body>
	<form id="AddRole" runat="server">
	<div id="header" style="height: 50px">
		<uc1:WebHeader ID="WebHeader1" runat="server" />
		<asp:ScriptManager ID="ScriptManager1" runat="server">
		</asp:ScriptManager>
	</div>
	<div id="content" class="row-fluid">
		<div id ="contentDetails" class="span8 offset3">
		<div><h3>Add New Role</h3></div>
	<div>
		<asp:UpdatePanel ID="AddRolePanel" runat="server" 
			UpdateMode="Conditional">
			<ContentTemplate>		
					<div class="ContentInside">
					<table style="width: 100%;">
						<tr>
									   <td class="style1">
									<asp:Label ID="lblRoleName" runat="server" CssClass="label" Text="Role Name: "></asp:Label>
									</td>
									<td>
									<asp:TextBox ID="txtRoleName" runat="server" CssClass="txtBox" Width="250px"></asp:TextBox>
									</td>
					   </tr>

						   <tr>

								 <td class="style1">
								<asp:Label ID="lblDesc" runat="server" CssClass="label" Text="Role Description"></asp:Label>
								</td>
							   <td>
								<asp:TextBox ID="txtDescription" runat="server" CssClass="textbox"
								Font-Underline="False" Height="100px" TextMode="MultiLine" Width="250px"></asp:TextBox>
								</td>
							 </tr>
								
								 <tr>
									   <td class="style1">
									<asp:Label ID="lblRemarks" runat="server" CssClass="label" Text="Remarks"></asp:Label>
									</td>
									<td>
								   <asp:TextBox ID="txtRemarks" runat="server" ClientIDMode="Static" 
								CssClass="textbox" Height="100px" TextMode="MultiLine" Width="250px"></asp:TextBox>
									</td>
								</tr>

							   <tr>
							<td class="style1">
							</td>
							<td>
							<asp:Label ID="lblAssignRights" runat="server" CssClass="label" 
								Text="Assign Rights" Font-Underline="True"></asp:Label>
							  
							</td>
							</tr>
							<tr>
								<td valign="top" class="style1">
								 <asp:Label ID="rblRightsLabel1" runat="server" CssClass="label" 
								Text="" Font-Underline="True"></asp:Label></td>
							   <td style="text-align: left">
							<asp:RadioButtonlist ID="rblRights1" runat="server" BorderStyle="none" CssClass="radio"
											 RepeatDirection="Horizontal" Width="375px">                                                   
											 </asp:RadioButtonlist>
							   
							</tr> 
							 <tr>
								<td  valign="top" class="style1">
								<asp:Label ID="rblRightsLabel2" runat="server" CssClass="label" 
								Text="" Font-Underline="True"></asp:Label></td>
							   <td style="text-align: left">
							<asp:RadioButtonlist ID="rblRights2" runat="server" BorderStyle="none" CssClass="radio"
											 RepeatDirection="Horizontal" Width="250px">                                                   
											 </asp:RadioButtonlist>
								</td>
							  
							   </tr> 
							  
							   <tr>
								   <td class="style1" valign="top">
									   <asp:Label ID="rblRightsLabel3" runat="server" CssClass="label" 
										   Font-Underline="True" Text=""></asp:Label>
								   </td>
								   <td>
									   <asp:RadioButtonList ID="rblRights3" runat="server" BorderStyle="None" 
										   CssClass="radio" RepeatDirection="Horizontal" Width="250px">
									   </asp:RadioButtonList>
								   </td>
						</tr>
							  
							   <tr>
								<td valign="bottom" class="style1">
								
								<asp:Label ID="rblRightsLabel4" runat="server" CssClass="label" 
								Text="" Font-Underline="True"></asp:Label></td>
							   <td>
							<asp:RadioButtonlist ID="rblRights4" runat="server" BorderStyle="None" CssClass="radio"
											 RepeatDirection="Horizontal" Width="250px">                                                   
											 </asp:RadioButtonlist>
						   </tr> 

							 <tr>
								<td valign="bottom" class="style1">
							
							   <asp:Label ID="rblRightsLabel5" runat="server" CssClass="label" 
								Text="" Font-Underline="True"></asp:Label></td>
							   <td>
							<asp:RadioButtonlist ID="rblRights5" runat="server" BorderStyle="None" CssClass="radio"
											 RepeatDirection="Horizontal" Width="250px">                                                   
											 </asp:RadioButtonlist>
														   </tr>                            


<tr>
								<td   valign="bottom" class="style1"> 
							
								<asp:Label ID="rblRightsLabel6" runat="server" CssClass="label" 
								Text="" Font-Underline="True"></asp:Label>
								</td>
								<td>
								<asp:RadioButtonList ID="rblRights6" runat="server" BorderStyle="None" 
										CssClass="radio" RepeatDirection="Horizontal" Width="165px">
								</asp:RadioButtonList>
								</td>
							</tr>
									<tr>
										<td class="style1" valign="bottom">
											&nbsp;</td>
										<td>
											&nbsp;</td>
						</tr>
									<tr>
									   
									 <td class="style1">
									 
									 </td><td>
								<asp:Button ID="btnAddNewRole" runat="server" ClientIDMode="Static" 
												CssClass="btn btn-inverse" onclick="btnAddNewRole_Click" Text="Add" 
												Width="75px" />
											&nbsp;&nbsp;&nbsp;&nbsp;
								<asp:Button ID="btnCancel" runat="server" ClientIDMode="Static" CssClass="btn btn-inverse" 
												onclick="btnCancel_Click" Text="Cancel" Width="75px" />
										</td></tr>
										  <tr>
									   
									 <td class="style1">
									 
									 
									</td></tr>
										</table>
		   </div>
				</div>      
				<div id="DivErrorMessage" style="text-align: center">
					<asp:Label ID="lblErrorMsg" runat="server" CssClass="text-error"></asp:Label>
				</div>
			   <br>
			</ContentTemplate>
		</asp:UpdatePanel>
		</div>
	</div>

	<div id="footer" class="text-center" >
			</div>
	</form>
</body>
</html>
