<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManagementView.aspx.cs" Inherits="webzy.WebApplication.UserManagementView" %>

<%@ Register src="../Miscellaneous/WebHeader.ascx" tagname="WebHeader" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>User View</title>
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<form id="MainForm" class="mainbody" runat="server">
	<div>
		<uc1:WebHeader ID="WebHeader1" runat="server" />
	</div>
	<div id="header" style="height: 50px">
		<asp:ScriptManager ID="ScriptManager1" runat="server">
		</asp:ScriptManager>
	</div>
	<div id="content">
		<div>
			<asp:UpdatePanel ID="UserSummaryPanel" runat="server" RenderMode="Inline" UpdateMode="Conditional">
				<ContentTemplate>
					<div id="SearchPannel" style="vertical-align: middle">
						<table style="padding: 5px; margin: 0px; border: thin solid #000000; width: 100%; height: 50px; vertical-align: bottom;">
							<tr >
								<td>
								  <asp:Label ID="lblUserName" runat="server" CssClass="label" Text="User Name :"></asp:Label>
									&nbsp;<asp:TextBox ID="txtUserName" runat="server" CssClass="search-query" 
										Width="200px"></asp:TextBox>
									  <td>
										  <asp:Label ID="lblGroup" runat="server" CssClass="label" Text="Group :"></asp:Label>
										  <asp:DropDownList ID="ddlGroup" runat="server" Width="200px">
										  </asp:DropDownList>
									
									
									</td>
									
									<td>
										<asp:Label ID="lblUserRole" runat="server" CssClass="label" Text="Role :"></asp:Label>
										<asp:DropDownList ID="ddlRole" runat="server" Width="200px">
										</asp:DropDownList>
									</td>
									<td>
										<asp:Label ID="lblStatus" runat="server" CssClass="label" Text="Status  :"></asp:Label>
										&nbsp;
										<asp:DropDownList ID="ddlStatus" runat="server" ClientIDMode="Static" 
											Width="200px">
										</asp:DropDownList>
									</td>
									
									</td>
									<td>
										&nbsp;&nbsp;
										<td>
									 <br\>
									 <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-inverse" Text="Search" 
												Width= "75px" onclick="btnSearch_Click"
										 />
									
										<td class="style1">
									
									 <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-inverse" 
												Text="New User" Width="100px" onclick="btnNewUser_Click" />
										</td>
							</tr>
						</table>
					</div>
					 <div style="text-align: center">
					<asp:Label ID="lblErrorMsg" runat="server" CssClass="text-error"></asp:Label>
				</div>
				  <div style="margin: 10px 0px 10px 0px; text-align: center">
				   <h2>User Summary View</h2>
				</div>
				  <div style="margin-right: 5px; margin-left: 5px">
							<asp:GridView ID="UserViewSummary" runat="server" AllowPaging="True" AllowSorting="True"
								AutoGenerateColumns="False" CellPadding="3"
								Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
								onpageindexchanging="UserViewSummary_PageIndexChanging" 
								onselectedindexchanging="UserViewSummary_SelectedIndexChanging" 
								onsorting="UserViewSummary_OnSorting" >
								<Columns>
									<asp:ButtonField ButtonType="Button" CommandName="Select" Text="View">
										<ControlStyle CssClass="btn btn-info" Width="75px" />
									<ItemStyle Width="100px" Wrap="False" />
									</asp:ButtonField>
									<asp:BoundField DataField="UserId" HeaderText="User ID" SortExpression="UserId">
									<ControlStyle CssClass="hiden" />
									<FooterStyle CssClass="hiden" />
									<HeaderStyle CssClass="hiden" />
									<ItemStyle CssClass="hiden" />
									</asp:BoundField>
									<asp:BoundField DataField="LoginId" HeaderText="Login ID" 
										SortExpression="LoginId" >
									<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
									</asp:BoundField>
									<asp:BoundField DataField="Name" HeaderText="User Name" SortExpression="Name" >
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
										</asp:BoundField>
									 <asp:BoundField DataField="Group" HeaderText="Group" SortExpression="Group">
									<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
									</asp:BoundField>
									<asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role">
									<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
									</asp:BoundField>
									 <asp:BoundField DataField="Status" HeaderText="Status" 
										SortExpression="Status" >
								  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
									</asp:BoundField>
							  </Columns>
							<FooterStyle BackColor="White" ForeColor="#000066" />
						<HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
						<PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066" />
								<RowStyle ForeColor="#000066" />
						<SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
								<SortedAscendingCellStyle BackColor="#F1F1F1" />
								<SortedAscendingHeaderStyle BackColor="#007DBB" />
								<SortedDescendingCellStyle BackColor="#CAC9C9" />
								<SortedDescendingHeaderStyle BackColor="#00547E" />
							</asp:GridView>
						</div>
				</ContentTemplate>
				<Triggers>
					<asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
					<asp:AsyncPostBackTrigger ControlID="UserViewSummary" 
						EventName="PageIndexChanging" />
					<asp:AsyncPostBackTrigger ControlID="UserViewSummary" 
						EventName="SelectedIndexChanging" />
					<asp:AsyncPostBackTrigger ControlID="UserViewSummary" EventName="Sorting" />
				</Triggers>
			</asp:UpdatePanel>
		  </div>
	</div>
	<div id="footer" class="txtCenter"></div>
	</form>
</body>
</html>
