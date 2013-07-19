using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using webzy.DataEntities;
using webzy.Utility.Security;
using System.Collections;

namespace webzy.BizModule.Miscellaneous
{
	public class LoginHelper
	{
		public bool CheckUser(string LoginId)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					var user = from u in ctx.WebUsers where u.LoginId == LoginId select u;
					if (user.Count() > 0)
					{
						return true;
					}
					else
					{
						return false;
					}

				}
			}
			catch (Exception ex)
			{
				throw new Exception("Error happens in Account Checking,Details:" + ex.Message + "");

			}
		}
		public bool AuthenticateUser(string LoginId, string Password)
		{
			bool LoginStatus;
			using (SecurityHelper loginHelper = new SecurityHelper())
			{
				LoginStatus = loginHelper.Authenticate(LoginId, Password);
			}
			return LoginStatus;
		}
		public WebUser GetUser(string LoginId)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					var user = (from u in ctx.WebUsers where u.LoginId == LoginId select u).FirstOrDefault();
					return user;
				}
			}
			catch (Exception ex)
			{
				throw new Exception("Error happens in Get User,Details:" + ex.Message + "");
			}
		}
        public ArrayList GetRightByUser(string LoginId)
        {
            try
            {
                ArrayList rightsname = new ArrayList();
                using (webzyEntities ctx = new webzyEntities())
                {
                    var UserRoleRights = from u in ctx.UserRightsViews where u.LoginId == LoginId select u;
                    foreach (UserRightsView UserRights in UserRoleRights)
                    {
                        rightsname.Add("[" + UserRights.Rights + "]<" + UserRights.Priority + ">");
                    }
                }
                return rightsname;
            }
            catch (Exception ex)
            {
                throw new Exception("Error happens in Get User Rights,Details:" + ex.Message + "");
            }
        }
    }
}
