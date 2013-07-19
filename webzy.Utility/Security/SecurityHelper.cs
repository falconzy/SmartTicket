using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using webzy.Utility.Encryption;
using System.Collections;
using webzy.DataEntities;

namespace webzy.Utility.Security
{
	public class SecurityHelper : System.IDisposable
	{
		private bool disposed = false;
		private IntPtr handle;
		private Component component = new Component();
		EncryptionHelper Encrypetion = new EncryptionHelper();
		#region Public Methods
		public bool Authenticate(string Login, string Password)
		{
			bool isAuthenticate = false;
			isAuthenticate = WebAuthenticate(Login, Password);
			return isAuthenticate;
		}
		public UserPrincipal GetPrincipal(UserIdentity identity)
		{
			ArrayList rights = this.GetRightByUser(identity.User);
			return new UserPrincipal(identity, rights);
		}
		public void Dispose()
		{
			Dispose(true);
			GC.SuppressFinalize(this);
		}

		public ArrayList GetRightByUser(WebUser user)
		{
			ArrayList rightsname = new ArrayList();
			using (webzyEntities ctx = new webzyEntities())
			{
				var UserRoleRights = from u in ctx.UserRightsViews where user.Id == u.Id select u;
				foreach (UserRightsView UserRights in UserRoleRights)
				{
					rightsname.Add("[" + UserRights.Rights + "]<" + UserRights.Priority + ">");
				}
			}
			return rightsname;
		}
		#endregion
		#region Private Methods
		private bool WebAuthenticate(string Login, string Password)
		{
			bool Authenticate = false;
			try
			{
				string EncrypPwd = Encrypetion.EncrypToText(Password);
				using (webzyEntities ctx = new webzyEntities())
				{
					var Pwd = (from u in ctx.WebUsers where u.LoginId == Login select u.Password).SingleOrDefault();

					if (Pwd != null && Pwd.ToString() == EncrypPwd)
					{
						Authenticate = true;
					}
				}
				return Authenticate;
			}
			catch (Exception ex)
			{
				throw new Exception("Error happens in Web Authenticate,details :" + ex.Message);
			}
		}

		protected virtual void Dispose(bool disposing)
		{
			// Check to see if Dispose has already been called.
			if (!this.disposed)
			{

				if (disposing)
				{
					// Dispose managed resources.
					component.Dispose();
				}
				CloseHandle(handle);
				handle = IntPtr.Zero;
				disposed = true;

			}
		}
		[System.Runtime.InteropServices.DllImport("Kernel32")]
		private extern static Boolean CloseHandle(IntPtr handle);
		~SecurityHelper()
		{
			Dispose(false);
		}
		#endregion
	}
}
