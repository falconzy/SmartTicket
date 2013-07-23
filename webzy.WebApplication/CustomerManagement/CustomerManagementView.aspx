<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerManagementView.aspx.cs" Inherits="webzy.WebApplication.CustomerManagement.CustomerManagementView" %>

<%@ Register src="../Miscellaneous/WebHeader.ascx" tagname="WebHeader" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>Customer View</title>s
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
			<asp:UpdatePanel ID="CustomerSummaryPanel" runat="server" RenderMode="Inline" UpdateMode="Conditional">
				<ContentTemplate>
					<div id="SearchPannel" style="vertical-align: middle">
						<table style="padding: 5px; margin: 0px; border: thin solid #000000; width: 100%; height: 50px; vertical-align: bottom;">
							<tr >
								<td>
								  <asp:Label ID="lblCustomerName" runat="server" CssClass="label" 
										Text="Customer Name :"></asp:Label>
									&nbsp;<asp:TextBox ID="txtCustomerName" runat="server" CssClass="search-query" 
										Width="200px"></asp:TextBox>
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
												Text="New Customer" Width="125px" onclick="btnAddCustomer_Click" />
										</td>
							</tr>
						</table>
					</div>
					 <div style="text-align: center">
					<asp:Label ID="lblErrorMsg" runat="server" CssClass="text-error"></asp:Label>
				</div>
				  <div style="margin: 10px 0px 10px 0px; text-align: center">
				   <h2>Customer Summary View</h2>
				</div>
				  <div style="margin-right: 5px; margin-left:5px;">
							<asp:GridView ID="CustomerViewSummary" runat="server" AllowPaging="True" AllowSorting="True"
								AutoGenerateColumns="False" CellPadding="3"
								Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
								onpageindexchanging="CustomerViewSummary_PageIndexChanging" 
								onselectedindexchanging="CustomerViewSummary_SelectedIndexChanging" 
								onsorting="CustomerViewSummary_OnSorting" >
								<Columns>
									<asp:ButtonField ButtonType="Button" CommandName="Select" Text="View">
										<ControlStyle CssClass="btn btn-info" Width="75px" />
									<ItemStyle Width="100px" Wrap="False" />
									</asp:ButtonField>
									<asp:BoundField DataField="CustomerId" HeaderText="Customer ID" 
										SortExpression="CustomerId">
									<ControlStyle CssClass="hiden" />
									<FooterStyle CssClass="hiden" />
									<HeaderStyle CssClass="hiden" />
									<ItemStyle CssClass="hiden" />
									</asp:BoundField>
									<asp:BoundField DataField="CustomerName" HeaderText="Customer Name" 
										SortExpression="CustomerName" >
									<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
									</asp:BoundField>
									 <asp:BoundField DataField="CreatedBy" HeaderText="Created By" 
										SortExpression="CreatedBy" />
									<asp:BoundField DataField="ModifiedBy" HeaderText="Modified By" 
										SortExpression="ModifiedBy" />
									<asp:BoundField DataField="ModifiedOn" HeaderText="Modified On" 
										SortExpression="ModifiedOn" />
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
					<asp:AsyncPostBackTrigger ControlID="CustomerViewSummary" 
						EventName="PageIndexChanging" />
					<asp:AsyncPostBackTrigger ControlID="CustomerViewSummary" 
						EventName="SelectedIndexChanging" />
					<asp:AsyncPostBackTrigger ControlID="CustomerViewSummary" EventName="Sorting" />
				</Triggers>
			</asp:UpdatePanel>
		  </div>
	</div>
	<div id="footer" class="txtCenter"></div>
	</form>
</body>
</html>
