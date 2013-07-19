using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Principal;
using webzy.DataEntities;

namespace webzy.Utility.Security
{
	public class UserIdentity : IIdentity
	{
		private string _authenticationType;
		private WebUser _user;
		private bool _Authenticated;


		public UserIdentity(WebUser user, string authenticationType, bool Authenticated)
		{
			if (user == null)
			{
				throw new ArgumentException("User is empty");
			}
			else
			{
				this._user = user;
			}
			this._authenticationType = authenticationType;
			this._Authenticated = Authenticated;
		}

		#region Iidentity Member
		public bool IsAuthenticated
		{
			get
			{
				if (this._Authenticated)
				{
					return true;
				}
				return false;
			}
		}
		public string Name
		{
			get
			{
				return this._user.Name;
			}
		}
		public string AuthenticationType
		{
			get
			{
				return this._authenticationType;
			}
		}
		#endregion
		# region Public Properties
		
		public WebUser User
		{
			get
			{
				return this._user;
			}
		}
		# endregion
	}
}
