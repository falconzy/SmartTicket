<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="webzy.WebApplication.Main" %>
<%@ Register src="Miscellaneous/WebHeader.ascx" tagname="WebHeader" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome</title>
	<link href="Styles/Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<form id="MainForm" class="mainbody" runat="server">
	<div><uc1:WebHeader ID="WebHeader1" runat="server" />
	</div>
	<div id="header" style="height: 50px">
		<asp:ScriptManager ID="ScriptManager1" runat="server">
		</asp:ScriptManager>
	</div>
	<div id="content" class="txtCenter">
	<div style="margin: 20%"> <h1>Welcome to Smart Ticket System</h1><br />
        <h3><asp:Label ID="lblMessage"  runat="server" CssClass="text-error"></asp:Label></h3></div>
        </div>
    </form>
</body>
</html>
