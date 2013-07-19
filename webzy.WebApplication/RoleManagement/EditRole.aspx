<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditRole.aspx.cs" Inherits="webzy.WebApplication.RoleManagement.EditRole" %>
<%@ Register src="../Miscellaneous/WebHeader.ascx" tagname="WebHeader" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="EditRoleHead" runat="server">
    <title>Edit Role</title>
	<link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.style1
		{
			width: 30%;
		}
	</style>
</head>
<body>
    <form id="EditRole" runat="server">
 <div id="header" style="height: 50px">
    	<uc1:WebHeader ID="WebHeader1" runat="server" />
		<asp:ScriptManager ID="ScriptManager1" runat="server">
		</asp:ScriptManager>
    </div>
	<div id="content" class="row-fluid">
		<div id ="contentDetails" class="span8 offset3">
		<div><h3>Edit Role</h3></div>
    <div>
        <asp:UpdatePanel ID="AddRolePanel" runat="server" 
            UpdateMode="Conditional">
            <ContentTemplate>
                    <div class="ContentInside">
                        <table style="width: 100%;">
                            <br\>
                       <br\>
                        <tr>
                                       <td class="style1">
                                    <asp:Label ID="lblRoleName" runat="server" CssClass="label" Text="Role Name: "></asp:Label>
                                    </td>
                                    <td>
                                    <asp:TextBox ID="txtRoleName" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                       </tr>

                           <tr>

                                 <td class="style1">
                                <asp:Label ID="lblDesc" runat="server" CssClass="label" Text="Role Description"></asp:Label>
                                </td>
                               <td>
                                <asp:TextBox ID="txtboxRoleDescription" runat="server" CssClass="textbox"
                                Font-Underline="False" Height="75px" TextMode="MultiLine" Width="250px"></asp:TextBox>
                                </td>
                             </tr>
                                
                                 <tr>
                                       <td class="style1">
                                    <asp:Label ID="lblRemarks" runat="server" CssClass="label" Text="Remarks"></asp:Label>
                                    </td>
                                    <td>
                                   <asp:TextBox ID="txtRemarks" runat="server" ClientIDMode="Static" 
                                CssClass="textbox" Height="50px" TextMode="MultiLine" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>
                               <tr>
                            <td class="style1">
                            </td>
                            <td>
                            <asp:Label ID="lblAssignRights" runat="server" CssClass="label" 
                                Text="Assign Rights" Font-Underline="True"></asp:Label>
                                <br />
                            </td>
                            </tr>
                            <tr>
                                <td valign="middle" class="style1">
                                 <asp:Label ID="rblRightsLabel1" runat="server" CssClass="label" 
                                Text="" Font-Underline="True"></asp:Label></td>
                               <td>
							<asp:RadioButtonList ID="rblRights1" runat="server" BorderStyle="none" 
									   CssClass="radio" RepeatDirection="Horizontal" Width="375px">                                                   
											 </asp:RadioButtonList>
							   
                            </tr> 
                             <tr>
                                <td  valign="middle" class="style1">
                                <asp:Label ID="rblRightsLabel2" runat="server" CssClass="label" 
                                Text="" Font-Underline="True"></asp:Label></td>
                               <td>
							<asp:RadioButtonList ID="rblRights2" runat="server" BorderStyle="none" 
									   CssClass="radio" RepeatDirection="Horizontal" Width="250px">                                                   
											 </asp:RadioButtonList>
                                </td>
                               </tr> 
                             <tr>
                                <td class="style1" valign="middle">
                                <asp:Label ID="rblRightsLabel3" runat="server" CssClass="label" 
										Font-Underline="True" Text=""></asp:Label></td>
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

							<asp:RadioButtonList ID="rblRights4" runat="server" BorderStyle="None" 
									   CssClass="radio" RepeatDirection="Horizontal" Width="250px">                                                   
											 </asp:RadioButtonList>
                           </tr> 

                             <tr>
                                <td   valign="bottom" class="style1">
                        
                               <asp:Label ID="rblRightsLabel5" runat="server" CssClass="label" 
                                Text="" Font-Underline="True"></asp:Label></td>
                               <td>
							<asp:RadioButtonList ID="rblRights5" runat="server" BorderStyle="None" 
									   CssClass="radio" RepeatDirection="Horizontal" Width="250px">                                                   
											 </asp:RadioButtonList>
                                                           </td></tr> 
                                                           <tr>
                                <td class="style1" valign="bottom"> 
                            
                                <asp:Label ID="rblRightsLabel6" runat="server" CssClass="label" 
										Font-Underline="True" Text=""></asp:Label>
                               </td>
                                <td>
								<asp:RadioButtonList ID="rblRights6" runat="server" BorderStyle="None" 
										CssClass="radio" RepeatDirection="Horizontal" Width="165px">
								</asp:RadioButtonList>
                                
                            </tr>
                             <tr>
                               <td class="style1">                       
                                  <asp:Label ID="lblStatus" runat="server" CssClass="label" Text="Status :"></asp:Label>
                            </td>
                          <td> 
                           <asp:DropDownList ID="ddlStatus" runat="server" AutoCompleteMode="Suggest" 
								  ClientIDMode="Static" Width="250px">
                                    </asp:DropDownList>
                        </td></tr>    
                        <tr>
                      <td class="style1">
				</td>
                      </tr>    
							<tr>
                                <td class=" ">&nbsp;</td>
                                <td>
                                <asp:Button ID="btnEdit" runat="server" ClientIDMode="Static" 
										CssClass="btn btn-inverse" onclick="btnEdit_Click" Text="Edit" Width="75px" />
                               
                                  &nbsp;&nbsp;&nbsp;&nbsp;
                               
                                  <asp:Button ID="btnUpdate" runat="server" ClientIDMode="Static" 
										CssClass="btn btn-inverse" onclick="btnUpdate_Click" Text="Update" 
										Width="75px" />
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Button ID="btnCancel" runat="server" ClientIDMode="Static" 
										CssClass="btn btn-inverse" onclick="btnCancel_Click" Text="Cancel" 
										Width="75px" />
                                </td>
                            </tr>

                                        </table>                    </div>
                <div id="DivErrorMessage" style="text-align: center">
                    <asp:Label ID="lblErrorMsg" runat="server" CssClass="text-error"></asp:Label>
                </div>
            </ContentTemplate>          
        </asp:UpdatePanel>
        </div>
    </div>
    <div id="footer" class="text-center">            </div>
    </form>
</body>
</html>
