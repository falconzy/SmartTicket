<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="webzy.WebApplication.CustomerManagement.AddCustomer" %>

<%@ Register src="../Miscellaneous/WebHeader.ascx" tagname="WebHeader" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>Add Customer</title>
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
		<div><h3>Add Customer</h3></div>
	  <div>
		  <asp:UpdatePanel ID="UpdatePanelAddCustomer" runat="server" 
			UpdateMode="Conditional">
		<ContentTemplate>
			<div class="ContentInside" style="text-align: center">
				<table style="width:100%;">
					<tr>
						<td class="ColStyle" height="25" style="text-align: left">
							<asp:Label ID="lblCustomerName" runat="server" CssClass="label" 
								Text="Customer Name : "></asp:Label>
							<asp:TextBox ID="txtCustomerName" runat="server" CssClass="textbox" 
								Width="250px"></asp:TextBox>
						</td>
					</tr>
				</table>
				<div id="SiteInfor" style="border: thin solid #000000; padding-left: 10px;">
				 <h4>New Site</h4>
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
							<td style="text-align: left" rowspan="3">
								<asp:TextBox ID="txtSiteAddress" runat="server" CssClass="textbox" 
									Width="250px" Height="100px" TextMode="MultiLine"></asp:TextBox>
								<ajaxToolkit:TextBoxWatermarkExtender ID="txtSiteAddress_TextBoxWatermarkExtender" 
									runat="server" TargetControlID="txtSiteAddress" WatermarkText="Address Line 1">
								</ajaxToolkit:TextBoxWatermarkExtender>
							</td>
						</tr>
						<tr>
							<td class="ColStyle" height="25" style="text-align: left">
								&nbsp;</td>
						</tr>
						<tr>
							<td class="ColStyle" height="25" style="text-align: left">
								&nbsp;</td>
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
							<td colspan="2" height="25" style="text-align: center">
								<asp:Label ID="lblSiteErrorMsg" runat="server" CssClass="text-error"></asp:Label>
							</td>
						</tr>
						<tr>
							<td colspan="2" height="25" style="text-align: center">
								<asp:Button ID="btnInsertSite" runat="server" CssClass="btn btn-inverse" 
									Text="ADD SITE" Width="150px" onclick="btnInsertSite_Click" />
							</td>
						</tr>
				</table>
				<div style="margin: 20px; text-align: center">
					<asp:GridView ID="GridViewSiteInfo" runat="server" AutoGenerateColumns="False" 
						BackColor="White" BorderColor="#333333" BorderStyle="Solid" BorderWidth="1px" 
						CellPadding="4" Width="100%" AllowPaging="True" PageSize="5" ForeColor="Black" 
						GridLines="Vertical" onpageindexchanging="GridViewSiteInfo_PageIndexChanging" 
						onselectedindexchanging="GridViewSiteInfo_SelectedIndexChanging">
						<AlternatingRowStyle BackColor="White" />
						<Columns>
							<asp:ButtonField ButtonType="Button" Text="REMOVE" CommandName="Select">
							<ControlStyle CssClass="btn btn-info" Width="75px" Font-Size="X-Small" />
							<HeaderStyle Width="100px" />
							<ItemStyle Width="100px" Font-Size="X-Small" />
							</asp:ButtonField>
							<asp:BoundField DataField="SiteName" HeaderText="Site Name" 
								SortExpression="SiteName">
							<HeaderStyle Width="20%" />
							<ItemStyle Width="20%" />
							</asp:BoundField>
							<asp:BoundField DataField="SiteAddress" HeaderText="Site Address" 
								SortExpression="SiteAddress" />
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
				<asp:Button ID="btnAdd" runat="server" CssClass="btn btn-inverse" Text="ADD" 
					Width="100px" onclick="btnAdd_Click" />
				&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btnCancel" runat="server" CssClass="btn btn-inverse" 
					Text="BACK" Width="100px" />
			</div>
		</ContentTemplate>
		<Triggers>
			<asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
			<asp:AsyncPostBackTrigger ControlID="btnInsertSite" EventName="Click" />
			<asp:AsyncPostBackTrigger ControlID="GridViewSiteInfo" 
				EventName="PageIndexChanging" />
			<asp:AsyncPostBackTrigger ControlID="GridViewSiteInfo" 
				EventName="SelectedIndexChanging" />
		</Triggers>
		</asp:UpdatePanel>
		</div>
	</div>
	</div>
	</form>
</body>
</html>
