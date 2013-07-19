using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using webzy.DataEntities;
using System.Data.Entity.Infrastructure;
using System.Data;

namespace webzy.BizModule.UserManagement
{
	public class UserHelper
	{
		# region View User Summary Page

		public DataTable SearchUser(DataTable UserList, string command)
		{
			string UserName, LoginId, StatusName, GroupName, RoleName;
			try
			{
				List<WebUserView> User = new List<WebUserView>();
				using (webzyEntities ctx = new webzyEntities())
				{
					var objectContext = (ctx as IObjectContextAdapter).ObjectContext;
					User = objectContext.ExecuteStoreQuery<WebUserView>(command).ToList();
					foreach (WebUserView UserInfo in User)
					{
						UserName = UserInfo.Name.ToString().Trim();
						LoginId = UserInfo.LoginId.ToString().Trim();
						StatusName = UserInfo.Status.ToString().Trim();
						GroupName = UserInfo.GroupName;
						RoleName = UserInfo.RoleName;
						UserList.Rows.Add(UserInfo.Id, LoginId, UserName, GroupName,RoleName, StatusName);
					}
				}
				return UserList;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		public string GetUserSearchQuery(string UserName,string GroupName,string RoleName, string Status)
		{
			String command = @"SELECT * FROM WebUserView ";
			if ((!(string.IsNullOrWhiteSpace(UserName))) || (!(string.IsNullOrWhiteSpace(Status))) || (!(string.IsNullOrWhiteSpace(GroupName))) || (!(string.IsNullOrWhiteSpace(RoleName))))
			{
				command += "where ";
				if (((!(string.IsNullOrWhiteSpace(UserName)))) && !(string.IsNullOrWhiteSpace(Status)))
				{
					command += " Name like '%" + UserName + "%'" + "AND Status like '%" + Status + "%' AND ";
				}
				else if (!(string.IsNullOrWhiteSpace(UserName)))
				{
					command += " Name like '%" + UserName + "%' AND ";
				}
				else if (!(string.IsNullOrWhiteSpace(Status)) && Status.ToUpper() != "ALL")
				{
					command += " Status like '%" + Status + "%' AND ";
				}
				else if (!(string.IsNullOrWhiteSpace(GroupName)) && GroupName.ToUpper() != "ALL")
				{
					command += "GroupName like '%" + GroupName + "%' AND  ";
				}
				else if (!(string.IsNullOrWhiteSpace(RoleName)) && RoleName.ToUpper() != "ALL")
				{
					command += " RoleName like '%" + RoleName + "%' ";
				}
				if (command.Trim().Substring((command.Trim().Length) - 5).ToUpper().Equals("WHERE"))
				{
					command = command.Trim().Substring(0, (command.Trim().Length) - 5);
				}
				if (command.Trim().Substring((command.Trim().Length) - 3).ToUpper().Equals("AND"))
				{
					command = command.Trim().Substring(0, (command.Trim().Length) - 3);
				}

			}
			return command;
		}
		#endregion

		# region Add User Page
		public bool VerifuUserDetails(string LoginId)
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
				}
				return false;
			}
			catch (Exception ex)
			{
				throw new Exception("Problem in Checking the User Login Name info:" + ex.Message + "");

			}
		}
		public bool AddNewUser(WebUser webuser)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					ctx.WebUsers.Add(webuser);
					ctx.SaveChanges();
					return true;
				}
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}

		}
		public bool AddNewUserLog(WebUser webuser,string Action,string Status)
		{
			try
			{
				WebUserLog userlog = new WebUserLog();
				userlog.Name = webuser.Name;
				userlog.EmailAddress = webuser.EmailAddress;
				userlog.ContactNumber = webuser.ContactNumber;
				userlog.LoginId = webuser.LoginId;
				userlog.ModifiedBy = webuser.ModifiedBy;
				userlog.Password = webuser.Password;
				userlog.ModifiedOn = DateTime.Now;
				userlog.Status = Status;
				userlog.Remark = Action;
				using (webzyEntities ctx = new webzyEntities())
				{
					ctx.WebUserLogs.Add(userlog);
					ctx.SaveChanges();
				}
				return true;
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}
		}
		public bool AddUserRole(int UserId, int RoleId, string RoleName, string ModifiedUserName, string UserName)
		{
			try
			   {
					using (webzyEntities ctx = new webzyEntities())
					{
				
						WebUserRole NewUserRole = new WebUserRole();
						NewUserRole.WebUserFk =UserId;
						NewUserRole.RoleFk = RoleId;
						NewUserRole.ModifiedBy = UserName;
						NewUserRole.ModifiedOn = DateTime.Now;
						ctx.WebUserRoles.Add(NewUserRole);
						
						//Insert to Log;
						WebUserRoleLog NewUserRoleLog = new WebUserRoleLog();
						NewUserRoleLog.RoleName = RoleName;
						NewUserRoleLog.WebUserName = ModifiedUserName;
						NewUserRoleLog.Remark = "ADD";
						NewUserRoleLog.ModifiedBy = UserName;
						NewUserRoleLog.ModifiedOn = DateTime.Now;
						ctx.WebUserRoleLogs.Add(NewUserRoleLog);
						ctx.SaveChanges();

						return true;
					}
				}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}
		}

		public bool AddUserGroup(int UserId, int GroupId, string GroupName, string ModifiedUserName, string UserName)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
						UserGroup NewUserGroup = new UserGroup();
						NewUserGroup.UserFk =UserId;
						NewUserGroup.GroupFk = GroupId;
						NewUserGroup.ModifiedBy = UserName;
						NewUserGroup.ModifiedOn = DateTime.Now;
						ctx.UserGroups.Add(NewUserGroup);

						//Insert to Log;
						UserGroupLog NewUserGroupLog = new UserGroupLog();
						NewUserGroupLog.GroupName = GroupName;
						NewUserGroupLog.UserName = ModifiedUserName;
						NewUserGroupLog.Remark = "ADD";
						NewUserGroupLog.ModifiedBy = UserName;
						NewUserGroupLog.ModifiedOn = DateTime.Now;
						ctx.UserGroupLogs.Add(NewUserGroupLog);
						ctx.SaveChanges();

						return true;
					}
				}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}
		}
		#endregion

		# region Eidt User Page
		public WebUserView GetUserViewBy(int Id)
		{
			using (webzyEntities ctx = new webzyEntities())
			{
				WebUserView User = (from c in ctx.WebUserViews where c.Id == Id select c).SingleOrDefault();
				return User;
			}
		}
		public bool UpdateUser(WebUser webuser)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					WebUser ExistingUser = (from c in ctx.WebUsers where c.Id == webuser.Id select c).SingleOrDefault();
					ExistingUser.Name = webuser.Name;
					ExistingUser.EmailAddress = webuser.EmailAddress;
					if (webuser.Password.ToString().Trim().Length > 0)
					{
						ExistingUser.Password = webuser.Password;
					}
					ExistingUser.StatusFk = webuser.StatusFk;
					ExistingUser.ContactNumber = webuser.ContactNumber;
					ExistingUser.Remark = webuser.Remark;
					ExistingUser.ModifiedOn = webuser.ModifiedOn;
					ExistingUser.ModifiedBy = webuser.ModifiedBy;

					ctx.SaveChanges();
					return true;
				}

			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}
		}
		public bool updateUserRole(int UserId, int RoleId,string RoleName,string ModifiedUserName,string UserName)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					var ExsitingUserRole = (from c in ctx.WebUserRoles where c.WebUserFk == UserId && c.RoleFk == RoleId select c).ToList();
					if (ExsitingUserRole.Count > 0)
					{
						return true;
					}
					else
					{
						var ModifiedUserRole = (from c in ctx.WebUserRoles where c.WebUserFk == UserId select c).SingleOrDefault();
						ModifiedUserRole.RoleFk = RoleId;
						ModifiedUserRole.ModifiedBy = UserName;
						ModifiedUserRole.ModifiedOn = DateTime.Now;

						//Insert to Log;
						WebUserRoleLog NewUserRoleLog = new WebUserRoleLog();
						NewUserRoleLog.RoleName = RoleName;
						NewUserRoleLog.WebUserName = ModifiedUserName;
						NewUserRoleLog.Remark = "UPDATE";
						NewUserRoleLog.ModifiedBy = UserName;
						NewUserRoleLog.ModifiedOn = DateTime.Now;
						ctx.WebUserRoleLogs.Add(NewUserRoleLog);
						ctx.SaveChanges();

						return true;
					}
				}

			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}
		}
		public bool updateUserGroup(int UserId, int GroupId,string GroupName,string ModifiedUserName,string UserName)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					var ExsitingUserGroup = (from c in ctx.UserGroups where c.UserFk == UserId && c.GroupFk == GroupId select c).ToList();
					if (ExsitingUserGroup.Count > 0)
					{
						return true;
					}
					else
					{
						var ModifiedUserGroup = (from c in ctx.UserGroups where c.UserFk == UserId select c).SingleOrDefault();
						ModifiedUserGroup.GroupFk = GroupId;
						ModifiedUserGroup.ModifiedBy = UserName;
						ModifiedUserGroup.ModifiedOn = DateTime.Now;

						//Insert to Log;
						UserGroupLog NewUserGroupLog = new UserGroupLog();
						NewUserGroupLog.GroupName = GroupName;
						NewUserGroupLog.UserName = ModifiedUserName;
						NewUserGroupLog.Remark = "UPDATE";
						NewUserGroupLog.ModifiedBy = UserName;
						NewUserGroupLog.ModifiedOn = DateTime.Now;
						ctx.UserGroupLogs.Add(NewUserGroupLog);
						ctx.SaveChanges();

						return true;
					}
				}

			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}
		}
		#endregion

		
	}
}
