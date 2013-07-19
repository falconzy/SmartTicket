using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.BizModule.Miscellaneous;
using System.Collections;

namespace webzy.WebApplication
{
	public partial class Login : webbase
	{
		# region Variables
		LoginHelper loginHelper = new LoginHelper();
		#endregion

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				EndSession();
				lblMessage.Text = string.Empty;
				panelError.Visible = false;
			}
			if (Request.QueryString["logout"] != null)
			{
				if (Request.Cookies["webzy_Name"] != null)
				{
					Request.Cookies["webzy_Name"].Expires =  DateTime.Now.AddDays(-1);
				}
			}
		}

		protected void btnLogin_Click(object sender, EventArgs e)
		{
			bool loginStatus;
			string LoginId = txtboxUsername.Text.ToString();
			string LoginPwd = txtboxPassword.Text.ToString();
			try
			{
				if (txtboxUsername.Text.Length != 0 && txtboxPassword.Text.Length != 0)
				{

					bool UserExist = loginHelper.CheckUser(LoginId);
					if (UserExist)
					{
						loginStatus = loginHelper.AuthenticateUser(LoginId, LoginPwd);
						if (loginStatus)
						{
                            ArrayList Rights = loginHelper.GetRightByUser(LoginId);
							bool RememberMe = chkboxRemember.Checked;
							AddUserloginCache(loginHelper.GetUser(LoginId), RememberMe,Rights);
							Response.Redirect("/Main.aspx");
						}
						else
						{
							lblMessage.Text = "Login Error : Sorry, you have entered incorrect User Id or Password.";
						}
					}
					else
					{
						loginStatus = false;
						lblMessage.Text = "Login Error : User not exist";
					}
				}
				else
				{
					loginStatus = false;
					lblMessage.Text = "Login Error : Please enter User Name and Password.";
				}

			}
			catch (Exception ex)
			{
				loginStatus = false;
				lblMessage.Text = "Login Error :" + ex.Message + "";
			}
			finally
			{
				if (lblMessage.Text.Length > 0)
				{
					panelError.Visible = true;
				}
			}
		}
		
	}
}