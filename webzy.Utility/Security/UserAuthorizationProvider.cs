using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Security;
using Microsoft.Practices.EnterpriseLibrary.Security.Configuration;
using System.Collections.Specialized;
using System.Security.Principal;

namespace webzy.Utility.Security
{
	[ConfigurationElementType(typeof(CustomAuthorizationProviderData))]
	public class UserAuthorizationProvider : AuthorizationProvider
	{
		public UserAuthorizationProvider(NameValueCollection configurationItems)
		{

		}

		public override bool Authorize(IPrincipal principal, string context)
		{
			bool authorized = false;
			if (principal == null)
			{
				throw new ArgumentNullException("principal");
			}
			if (context == null || context.Length == 0)
			{
				throw new ArgumentNullException("context");
			}

			UserPrincipal Principal = principal as UserPrincipal;

			for (int i = 0; i < Principal.Rights.Count; i++)
			{
				if (Principal.Rights[i].ToString().ToUpper().Equals(context.ToUpper()))
				{
					authorized = true;
				}
			}
			return authorized;

		}
	}
}
