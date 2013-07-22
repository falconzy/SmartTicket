<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCustomer.aspx.cs" Inherits="webzy.WebApplication.CustomerManagement.EditCustomer" %>

<%@ Register src="../Miscellaneous/WebHeader.ascx" tagname="WebHeader" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>Edit Customer</title>
		<link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.Colstyle
		{
			width: 15%;
		}
	</style>
</head>
<body>
	<form id="AddCustomerForm" class="mainbody" runat="server">
	<div>
		<uc1:WebHeader ID="WebHeader1" runat="server" />
	</div>
	<div id="header" style="height: 50px">
		<asp:ScriptManager ID="ScriptManager1" runat="server">
		</asp:ScriptManager>
	</div>
	<div id="content" class="row-fluid">
		<div id ="contentDetails" class="span8 offset2">
		<div><h3>Edit Customer</h3></div>
	  <div>
		  <asp:UpdatePanel ID="UpdatePanelEditCustomer" runat="server" 
			UpdateMode="Conditional">
		<ContentTemplate>
			<div class="ContentInside" style="text-align: center">
				<table style="width:100%;">
					<tr>
						<td class="ColStyle" height="25" style="text-align: left">
							<asp:Label ID="lblCustomerName" runat="server" CssClass="label" 
								Text="Customer Name   : "></asp:Label>
							<asp:TextBox ID="txtCustomerName" runat="server" CssClass="textbox" 
								Width="350px"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td class="ColStyle" height="25" style="text-align: left">
							<asp:Label ID="lblCustomerStatus" runat="server" CssClass="label" 
								Text="Customer Status :"></asp:Label>
							<asp:DropDownList ID="ddlCustomerStatus" runat="server" Width="150px">
							</asp:DropDownList>
						</td>
					</tr>
				</table>
				<div id="SiteSummary">
				 <h4 style="text-align: left">&nbsp;Site Info</h4>
				<div>
					<asp:GridView ID="GridViewSiteInfo" runat="server" AutoGenerateColumns="False" 
						BackColor="White" BorderColor="#333333" BorderStyle="Solid" BorderWidth="1px" 
						CellPadding="3" Width="100%" AllowPaging="True" PageSize="5" AllowSorting="True" 
						onpageindexchanging="GridViewSiteInfo_PageIndexChanging" 
						onselectedindexchanging="GridViewSiteInfo_SelectedIndexChanging" 
						onsorting="GridViewSiteInfo_Sorting">
						<Columns>
							<asp:ButtonField ButtonType="Button" Text="EDIT" CommandName="select">
							<ControlStyle CssClass="btn btn-info" Width="75px" Font-Size="X-Small" />
							<HeaderStyle Width="150px" />
							<ItemStyle Width="150px" />
							</asp:ButtonField>
							<asp:BoundField DataField="SiteId" HeaderText="Site Id" SortExpression="SiteId">
							<ControlStyle CssClass="hiden" />
							<HeaderStyle CssClass="hiden" />
							<ItemStyle CssClass="hiden" />
							</asp:BoundField>
							<asp:BoundField DataField="SiteName" HeaderText="Site Name" 
								SortExpression="SiteName">
							<HeaderStyle Width="20%" />
							<ItemStyle Width="20%" />
							</asp:BoundField>
							<asp:BoundField DataField="SiteAddress" HeaderText="Site Address" 
								SortExpression="SiteAddress" />
							<asp:BoundField DataField="Status" HeaderText="Status" 
								SortExpression="Status" />
						</Columns>
						<FooterStyle BackColor="#CCCC99" />
						<HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
						<PagerStyle HorizontalAlign="Right" BackColor="#F7F7DE" ForeColor="Black" />
								<RowStyle BackColor="#F7F7DE" />
								<SortedAscendingCellStyle BackColor="#FBFBF2" />
								<SortedAscendingHeaderStyle BackColor="#848384" />
								<SortedDescendingCellStyle BackColor="#EAEAD3" />
								<SortedDescendingHeaderStyle BackColor="#575357" />
					</asp:GridView>
					</div>
				</div>
				<asp:Label ID="lblErrorMsg" runat="server" CssClass="text-error"></asp:Label><br />
				<asp:Button ID="btnEdit" runat="server" CssClass="btn btn-inverse" Text="EDIT" 
					Width="100px" onclick="btnEdit_Click" />
				&nbsp;&nbsp;&nbsp;<asp:Button ID="btnCustomerUpdate" runat="server" 
					CssClass="btn btn-inverse" Text="UPDATE" Visible="False" Width="100px" 
					onclick="btnCustomerUpdate_Click" />
&nbsp;
				&nbsp;
				<asp:Button ID="btnCancel" runat="server" CssClass="btn btn-inverse" 
					Text="BACK" Width="100px" onclick="btnCancel_Click" />
			</div>
		</ContentTemplate>
		<Triggers>
			<asp:AsyncPostBackTrigger ControlID="GridViewSiteInfo" 
				EventName="PageIndexChanging" />
			<asp:AsyncPostBackTrigger ControlID="GridViewSiteInfo" 
				EventName="SelectedIndexChanging" />
			<asp:AsyncPostBackTrigger ControlID="GridViewSiteInfo" EventName="Sorting" />
			<asp:AsyncPostBackTrigger ControlID="btnSiteUpdate" EventName="Click" />
		</Triggers>
		</asp:UpdatePanel>
		</div>
	</div>
	</div>
	<asp:UpdatePanel ID="UpdatePanelPopup" runat="server" UpdateMode="Conditional">
			<ContentTemplate>
				<asp:Panel ID="SiteInfoPannel" runat="server" BorderStyle="Solid" 
					BorderWidth="2px" Visible="False" Width="40%">
					<div id="SiteInfo"  Width="40%" Height="400px">
					<table style="width:100%;">
					<tr>
						<td class="ColStyle" height="25" style="text-align: left">
							<asp:Label ID="lblSiteName" runat="server" CssClass="label" 
								Text="Site Name (Option) : "></asp:Label>
						</td>
						<td style="text-align: left">
							<asp:TextBox ID="txtSiteName" runat="server" CssClass="textbox" Width="250px"></asp:TextBox>
						</td>
					</tr>
						<tr>
							<td class="ColStyle" height="25" style="text-align: left">
								<asp:Label ID="lblSiteAddress" runat="server" CssClass="label" 
									Text="Site Address :"></asp:Label>
							</td>
							<td style="text-align: left">
								<asp:TextBox ID="txtSiteAddress" runat="server" CssClass="textbox" 
									Width="250px" Height="100px" TextMode="MultiLine"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td class="ColStyle" height="25" style="text-align: left">
								<asp:Label ID="lblCountry" runat="server" CssClass="label" Text="Country :"></asp:Label>
							</td>
							<td style="text-align: left">
								<asp:DropDownList ID="ddlCountry" runat="server" Width="265px">
								</asp:DropDownList>
							</td>
						</tr>
						<tr>
							<td class="ColStyle" height="25" style="text-align: left">
								<asp:Label ID="lblSiteStatus" runat="server" CssClass="label" 
									Text="Site Status :"></asp:Label>
							</td>
							<td style="text-align: left">
								<asp:DropDownList ID="ddlSiteStatus" runat="server" Width="265px">
								</asp:DropDownList>
							</td>
						</tr>
						<tr>
							<td class="ColStyle" colspan="2" height="25" style="text-align: center">
								<asp:Label ID="lblSiteErrorMsg" runat="server" CssClass="text-error"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="ColStyle" colspan="2" height="25" style="text-align: center">
								<asp:Button ID="btnSiteUpdate" runat="server" CssClass="btn btn-inverse" 
									Text="UPDATE" Width="100px" onclick="btnSiteUpdate_Click" />
								&nbsp;&nbsp;
								<asp:Button ID="btnSiteCancel" runat="server" CssClass="btn btn-inverse" 
									Text="CANCEL" Width="100px" onclick="btnSiteCancel_Click" />
							</td>
						</tr>
				</table>
				</div>
					
				</asp:Panel>
				<asp:Panel ID="backgroudContact" runat="server" Visible="False"></asp:Panel>	
			</ContentTemplate>
			<Triggers>
				<asp:AsyncPostBackTrigger ControlID="GridViewSiteInfo" 
					EventName="SelectedIndexChanging">
				</asp:AsyncPostBackTrigger>
				<asp:AsyncPostBackTrigger ControlID="btnSiteUpdate" EventName="Click" />
				<asp:AsyncPostBackTrigger ControlID="btnSiteCancel" EventName="Click" />
				<asp:AsyncPostBackTrigger ControlID="GridViewSiteInfo" 
					EventName="RowDeleting" />
			</Triggers>
		</asp:UpdatePanel>
	 
	</form>
</body>
</html>
