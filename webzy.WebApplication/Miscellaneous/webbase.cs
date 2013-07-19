using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Practices.EnterpriseLibrary.Security;
using System.Web.Security;
using System.Security.Principal;
using System.Collections;
using webzy.DataEntities;
using System.Configuration;
using System.Text;
using System.Text.RegularExpressions;
using webzy.Utility.Security;
using webzy.Utility.Encryption;


namespace webzy.WebApplication.Miscellaneous
{
	public class webbase : System.Web.UI.Page
	{
		# region Variables
		public const string ASCENDING_ORDER = "ASC";
		public const string DESCENDING_ORDER = "DESC";	
		public const int ActiveId = 1;
		public const string Active = "Active";
		EncryptionHelper Encrypetion = new EncryptionHelper();
		#endregion

		# region Public Method
		public bool AccessRight(ArrayList rights, string RequiredRights)
		{
			try
			{
				string RightName, RequiredRight;
				int Priority, RequiredPriority;
				string Reg = "(\\[.*?\\])(<\\d+>)";
				Regex r = new Regex(Reg, RegexOptions.IgnoreCase | RegexOptions.Singleline);
				Match RequiredMatch = r.Match(RequiredRights);

				if (RequiredMatch.Success)
				{
					RequiredRight = RequiredMatch.Groups[1].ToString().Replace("[", string.Empty).Replace("]", string.Empty).Trim();
					RequiredPriority = Convert.ToInt32(RequiredMatch.Groups[2].ToString().Replace("<", string.Empty).Replace(">", string.Empty).Trim());
				}
				else
				{
					return false;
				}
				if (rights != null)
				{
					if (RequiredRights == "login")
					{ return true; }
					else
					{
						foreach (string right in rights)
						{
							Match RightsMatch = r.Match(right);
							if (RightsMatch.Success)
							{
								RightName = RightsMatch.Groups[1].ToString().Replace("[", string.Empty).Replace("]", string.Empty).Trim();
								Priority = Convert.ToInt32(RightsMatch.Groups[2].ToString().Replace("<", string.Empty).Replace(">", string.Empty).Trim());
								if (RightName.ToUpper().Contains(RequiredRight.ToUpper()))
								{
									if (Priority >= RequiredPriority)
									{
										return true;
									}
								}
							}
							else
							{
								return false;
							}
						}
						return false;
					}
				}
				else
				{
					return false;
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}

		}
		public void EndSession()
		{
			FormsAuthentication.SignOut();
			Session.Abandon();
		}

		public void AddKeepAlive()
		{
			int int_MilliSecondsTimeOut = (this.Session.Timeout * 60000) - 30000;
			StringBuilder str_Script = new StringBuilder();
			str_Script.Append("<script type='text/javascript'>");
			str_Script.Append("var count=0;");
			str_Script.Append("var max = 5;");
			str_Script.Append("function Reconnect()");
			str_Script.Append("{count++;");
			str_Script.Append(" if (count < max) {");
			str_Script.Append("window.status = 'Link to Server Refreshed ' + count.toString() + ' time(s)';");
			str_Script.Append("var img = new Image(1, 1);");
			str_Script.Append(" img.src = '../Reconnect.aspx';");
			str_Script.Append("  }}window.setInterval('Reconnect()'," + int_MilliSecondsTimeOut.ToString() + @");");
			str_Script.Append("</script>");
			ClientScript.RegisterClientScriptBlock(this.GetType(), "Reconnect", str_Script.ToString());
			//this.Page.RegisterClientScriptBlock("Reconnect", str_Script.ToString());

		}

		public void AddSessionEndPopup()
		{
			int int_MilliSecondsTimeOut = (this.Session.Timeout * 60000) - 60000;
			int int_MilliSecondsSessionOut = int_MilliSecondsTimeOut + 60000;
			StringBuilder str_Script = new StringBuilder();
			str_Script.Append("<script type='text/javascript'>");
			str_Script.Append("var SessionTime = window.setInterval('SessionTimeout()'," + int_MilliSecondsTimeOut.ToString() + @");");
			str_Script.Append("var logoutTime = window.setInterval('SessionOut()'," + int_MilliSecondsSessionOut.ToString() + @");");
			str_Script.Append("</script>");
			ClientScript.RegisterStartupScript(this.GetType(), "Reconnect", str_Script.ToString());
		}

		public void AddUserloginCache(WebUser user, bool keeplogin,ArrayList rights)
		{
			string UserId = Encrypetion.EncrypToText(user.LoginId);
			string password = Encrypetion.EncrypToText("webzy"+user.Password);
			if (keeplogin)
			{
				Response.Cookies["webzy_Name"]["userName"] = UserId;
				Response.Cookies["webzy_Name"]["securityString"] = password;
				Response.Cookies["webzy_Name"].Expires = DateTime.Now.AddDays(3);
			}
            AddSession(user, rights);
		}


		#endregion

		# region Private Method
		private void AddSession(WebUser user, ArrayList UserRights)
		{
			LoginUser userinfo = new LoginUser();
			userinfo.Id = user.Id;
			userinfo.Name = user.Name.ToString();	
			userinfo.LoginTime = DateTime.Now;
			userinfo.Rights = UserRights;
			Session["CurrentUser"] = userinfo;
		}
		#endregion
	}
}

