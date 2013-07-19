using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webzy.WebApplication
{
	public partial class Main : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.QueryString["error"] != null)
			{
                if (Request.QueryString["error"].ToString().Trim() == "NoRights")
				lblMessage.Text = "Sorry,You do not have sufficient permissions to access this page.";
			}
		}
	}
}