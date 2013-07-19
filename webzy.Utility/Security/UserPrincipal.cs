using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Security.Principal;

namespace webzy.Utility.Security
{
	public class UserPrincipal : IPrincipal
	{
		UserIdentity _identity;
		ArrayList _rights;
		# region Constructors
		public UserPrincipal()
		{

		}
		public UserPrincipal(UserIdentity identity, ArrayList rights)
		{
			this._identity = identity;

			if (identity == null)
			{
				throw new ArgumentException("Identity is blank");
			}
			else
			{
				this._rights = rights;
				this._identity = identity;
			}
		}
		# endregion

		# region Public Methods
		public bool IsInRole(string role)
		{ return false; }
		# endregion
		# region Public Properties
		public ArrayList Rights
		{
			get
			{
				return this._rights;
			}
		}
		public IIdentity Identity
		{
			get
			{
				return this._identity;
			}
		}
		# endregion

	}
}
