<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewGroupSummary.aspx.cs" Inherits="webzy.WebApplication.GroupManagement.ViewGroupSummary" %>

<%@ Register src="../Miscellaneous/WebHeader.ascx" tagname="WebHeader" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="GroupHead" runat="server">
	<title>Group Summary</title>
	<link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		#header
		{
			margin-left: 120px;
		}
	</style>
</head>
<body>
	<form id="GroupSummary" runat="server">
	<div id="header" style="height: 50px">	   
		<asp:ScriptManager ID="ScriptManager1" runat="server">
		</asp:ScriptManager>
		<uc1:WebHeader ID="WebHeader1" runat="server" />
		</div>
	<div id="contentForConManagement">
		<div>
			<asp:UpdatePanel ID="GroupSummaryPanel" runat="server" RenderMode="Inline" UpdateMode="Conditional">
				<ContentTemplate>
					<div id="SearchPannel" style="vertical-align: middle">
						<table style="border: thin solid #000000; width: 100%;" frame=" ">
							<tr >
								<td>
								  <asp:Label ID="GroupName" runat="server" CssClass="label" Text="Group Name :"></asp:Label>
									<asp:TextBox ID="txtGroupName" runat="server" CssClass="search-query" 
										Width="200px"></asp:TextBox>
									<br/>
										<td>
										    <asp:Label ID="lblStatus" runat="server" CssClass="label" Text="Status  :"></asp:Label>
                                            <asp:DropDownList ID="ddlStatus" runat="server" ClientIDMode="Static" 
                                                CssClass="dl-horizontal" Width="200px">
                                            </asp:DropDownList>
                                            <td>
                                                <br />
                                                <asp:Button ID="btnGroupSearch" runat="server" CssClass="btn btn-inverse" 
                                                    onclick="btnGroupSearch_Click" Text="Search" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btnGroupAdd" runat="server" CssClass="btn btn-inverse" 
                                                    onclick="btnGroupAdd_Click" Text="New Group" Width="100px" />
                                            </td>
								</td>
							</tr>
						</table>
					</div>
					 <div style="text-align: center">
					<asp:Label ID="lblErrorMsg" runat="server" CssClass="text-error"></asp:Label>
				</div>
					<div id="GroupView">
					 <div style="margin: 5px 0px 5px 0px; text-align: center">
					<h2>Group Summary View</h2>
				</div>
						<div>		
								  <asp:GridView ID="GroupViewSummary" runat="server" AllowPaging="True" 
						AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
						CellPadding="3" CssClass="gridview" Width="100%" BorderColor="#CCCCCC" BorderStyle="Solid" 
									  BorderWidth="1px" onpageindexchanging="GroupViewSummary_PageIndexChanging" 
                                      onselectedindexchanging="GroupViewSummary_SelectedIndexChanging" 
                                      onsorting="GroupViewSummary_OnSorting">

								<Columns> 
									
										<asp:ButtonField ButtonType="Button" CommandName="Select" Text="View">
							<ControlStyle CssClass="btn btn-info" />
							</asp:ButtonField>
							<asp:BoundField DataField="GroupId" HeaderStyle-CssClass="hideGridColumn" 
								HeaderText="Group Id" ItemStyle-CssClass="hideGridColumn" 
								SortExpression="GroupId" >
							<HeaderStyle CssClass="hiden" />
							<ItemStyle CssClass="hiden" />
							</asp:BoundField>
									<asp:BoundField DataField="GroupName" HeaderText="Group Name" SortExpression="GroupName" />
							            <asp:BoundField DataField="ViewAbleByCustomer" HeaderText="View by Customer" 
                                            SortExpression="ViewAbleByCustomer" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" 
                                            SortExpression="Status" />
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
			    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnGroupSearch" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="GroupViewSummary" 
                        EventName="PageIndexChanging" />
                    <asp:AsyncPostBackTrigger ControlID="GroupViewSummary" 
                        EventName="SelectedIndexChanging" />
                    <asp:AsyncPostBackTrigger ControlID="GroupViewSummary" EventName="Sorting" />
                </Triggers>
			</asp:UpdatePanel>
		  </div>
		</div>
   <div id="footer" class="txtCenter">
	</div>
	 </form>
</body>
</html>
