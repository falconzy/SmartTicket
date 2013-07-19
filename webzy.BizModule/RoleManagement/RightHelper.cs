using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using webzy.DataEntities;

namespace webzy.BizModule.RoleManagement
{
	public class RightHelper
	{
		public List<Right> loadRights()
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					var rightList = (from c in ctx.Rights
									select c).ToList();
					return rightList;
				}				
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message.ToString());
			}
		}

	}
}
