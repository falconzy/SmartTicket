using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

namespace webzy.WebApplication.Miscellaneous
{
	public class LoginUser
	{
		public int Id { get; set; }
		public string Name { get; set; }
		public ArrayList Rights { get; set; }
		public bool keepLogin { get; set; }
		public DateTime LoginTime { get; set; }
	}
}