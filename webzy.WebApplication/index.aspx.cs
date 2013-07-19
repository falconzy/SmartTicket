using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.BizModule.Miscellaneous;
using webzy.Utility.Encryption;
using webzy.DataEntities;

namespace webzy.WebApplication
{
	public partial class index : webbase 
	{
		LoginHelper loginHelper = new LoginHelper();
		EncryptionHelper Encrypetion = new EncryptionHelper();
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				bool loginStatus = false;
				if (Request.Cookies["webzy_Name"] != null)
				{
					string userId = Server.HtmlEncode(Request.Cookies["webzy_Name"]["userName"]);
					string Pwd = Server.HtmlEncode(Request.Cookies["webzy_Name"]["securityString"]);
					string LoginId = Encrypetion.DecryptToText(userId);
					string LoginPwd = Encrypetion.DecryptToText(Encrypetion.DecryptToText(Pwd).Replace("webzy", string.Empty));

					loginStatus = loginHelper.AuthenticateUser(LoginId, LoginPwd);

					if (loginStatus)
					{
						WebUser user = loginHelper.GetUser(LoginId);
                        AddUserloginCache(user, false, loginHelper.GetRightByUser(LoginId));
						Response.Redirect("/Main.aspx");
					}
					else
					{
						Response.Redirect("~/Login.aspx");
					}
				}
				else
				{
					Response.Redirect("~/Login.aspx");
				}
			}
			catch (Exception)
			{

			}
		}
	}
}