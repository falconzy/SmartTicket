<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewRoleSummary.aspx.cs" Inherits="webzy.WebApplication.RoleManagement.ViewRoleSummary" %>

<%@ Register src="../Miscellaneous/WebHeader.ascx" tagname="WebHeader" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="RoleHead" runat="server">
	<title>Role Summary</title>
	<link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<form id="RoleSummary" runat="server">
	<div id="header" style="height: 50px">	   
		<asp:ScriptManager ID="ScriptManager1" runat="server">
		</asp:ScriptManager>
		<uc1:WebHeader ID="WebHeader1" runat="server" />
	   
		</div>
	<div id="contentForConManagement">
		<div>
			<asp:UpdatePanel ID="RoleSummaryPanel" runat="server" RenderMode="Inline" UpdateMode="Conditional">
				<ContentTemplate>
					<div id="SearchPannel" style="vertical-align: middle">
						<table style="border: thin solid #000000; width: 100%;" frame=" ">
							<tr >
								<td>
								  <asp:Label ID="RoleName" runat="server" CssClass="label" Text="Role Name :"></asp:Label>
									<asp:TextBox ID="txtRoleName" runat="server" CssClass="search-query" 
										Width="200px"></asp:TextBox>
									<td>
									<asp:Label ID="lblDesc" runat="server" CssClass="label" Text="Role Description :"></asp:Label>
									<asp:TextBox ID="txtDescription" runat="server" CssClass="search-query" 
											Width="200px"></asp:TextBox>
									</td>
										<td>
										 <br />
										  <asp:Button ID="btnRoleSearch" runat="server" CssClass="btn btn-inverse" 
												Text="Search" OnClick="btnSearch_Click"
										/>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<asp:Button ID="btnRoleAdd" runat="server" CssClass="btn btn-inverse" 
												onclick="btnAddRole_Click" Text="New Role" Width="100px" />
								</td>
							</tr>
						</table>
					</div>
					 <div style="text-align: center">
					<asp:Label ID="lblErrorMsg" runat="server" CssClass="text-error"></asp:Label>
				</div>
					<div id="RoleView">
					 <div style="margin: 5px 0px 5px 0px; text-align: center">
					<h2>Role Summary View</h2>
				</div>
						<div>
							
								  <asp:GridView ID="RoleViewSummary" runat="server" AllowPaging="True" 
						AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
						CellPadding="2" CssClass="gridview" 
						OnPageIndexChanging="RoleViewSummary_PageIndexChanging" 
						OnSelectedIndexChanging="RoleViewSummary_SelectedIndexChanging" 
						OnSorting="RoleViewSummary_OnSorting" Width="100%">

								<Columns> 		
										<asp:ButtonField ButtonType="Button" CommandName="Select" Text="View">
							<ControlStyle CssClass="btn btn-info" />
							</asp:ButtonField>
							<asp:BoundField DataField="RoleId" HeaderStyle-CssClass="hideGridColumn" 
								HeaderText="Role Id" ItemStyle-CssClass="hideGridColumn" 
								SortExpression="RoleId" >
							<HeaderStyle CssClass="hide " />
							<ItemStyle CssClass="hide" />
							</asp:BoundField>

									<asp:BoundField DataField="RoleName" HeaderText="Role Name" SortExpression="RoleName" />
									<asp:BoundField DataField="Description" HeaderText="Description" 
											SortExpression="Description" />
							  </Columns>
								<FooterStyle BackColor="White" ForeColor="#000066" />
								<HeaderStyle BackColor="#006699" Font-Bold="True" />
								<PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
								<SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
								<HeaderStyle ForeColor="White" HorizontalAlign="Center" />
							</asp:GridView>
						</div>
					</div>
				</ContentTemplate>
			</asp:UpdatePanel>
		  </div>
		</div>
   <div id="footer" class="txtCenter">
	</div>
	 </form>
</body>
</html>