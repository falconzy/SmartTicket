using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using webzy.DataEntities;
using System.Data.Entity.Infrastructure;
using System.Collections;
using System.Text.RegularExpressions;
using System.Data.Entity;

namespace webzy.BizModule.RoleManagement
{
	public class RoleHelper
	{
		# region View Role Summary Page
		public DataTable SearchRoleSummary(DataTable RoleLists, string command)
		{
			try
			{
				List<Role> Role = new List<Role>();
				using (webzyEntities ctx = new webzyEntities())
				{
					var objectContext = (ctx as IObjectContextAdapter).ObjectContext;
					Role = objectContext.ExecuteStoreQuery<Role>(command).ToList();
					foreach (Role RoleInfo in Role)
					{
						RoleLists.Rows.Add(RoleInfo.Id, RoleInfo.Name, RoleInfo.Description);
					}

				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
			return RoleLists;
		}

		public string GetRoleSearch(string RoleName, string Description)
		{
			String command = @"SELECT * FROM Role";
			if ((!(string.IsNullOrWhiteSpace(RoleName))) || (!(string.IsNullOrWhiteSpace(Description))))
			{
				command += "where ";
				if ((!(string.IsNullOrWhiteSpace(RoleName))) && !(string.IsNullOrWhiteSpace(Description)))
				{
					command += " Name like '%" + RoleName + "%'" + "AND Description like '%" + Description + "%' ";
				}
				else if (!(string.IsNullOrWhiteSpace(RoleName)))
				{
					command += " Name like '%" + RoleName + "%' ";
				}
				else if (!(string.IsNullOrWhiteSpace(Description)) && Description != "ALL")
				{
					command += " Description like '%" + Description + "%' ";
				}

			}

			return command;
		}
		#endregion

		# region Add Role
		public bool CheckDuplicateRoleName(string RoleName)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					var Roles = from u in ctx.Roles where u.Name == RoleName select u;
					if (Roles.Count() > 0)
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
				throw new Exception(ex.Message);
			}
		}
		public bool AddRole(Role role, List<RoleRight> roleRights, List<Right> Rights)
		{
			bool result = false;
			RoleLog NewRoleLog = new RoleLog();
			RoleRightLog NewRoleRightsLog = new RoleRightLog();
			int counter = 0;
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					ctx.Roles.Add(role); //Add Role

					NewRoleLog.RoleName = role.Name;
					NewRoleLog.Description = role.Description;
					NewRoleLog.Remark = role.Remark;
					NewRoleLog.Status = "Active";
					NewRoleLog.ModifiedOn = role.ModifiedOn.Value;
					NewRoleLog.ModifiedBy = role.ModifiedBy;
					NewRoleLog = ctx.RoleLogs.Add(NewRoleLog);
					//Add Role Log

					foreach (RoleRight roleRight in roleRights)
					{
						//Add Role Right
						RoleRight NewRoleRight = new RoleRight();
						NewRoleRight.RightFk = roleRight.RightFk;
						NewRoleRight.ModifedOn = role.ModifiedOn.Value;
						NewRoleRight.ModifiedBy = role.ModifiedBy;
						if (!Rights[counter].Name.ToUpper().Contains("NOACCESS"))
						{
							role.RoleRights.Add(NewRoleRight);
						}

						//Add Role Right Log
						NewRoleRightsLog.RoleName = role.Name;
						NewRoleRightsLog.RightsName = Rights[counter].Name;
						NewRoleRightsLog.ModifiedBy = role.ModifiedBy;
						NewRoleRightsLog.ModifiedOn = role.ModifiedOn.Value;
						ctx.RoleRightLogs.Add(NewRoleRightsLog);
						counter++;
					}
					ctx.SaveChanges();
					result = true;
				}
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}
			return result;
		}
		#endregion


		# region Edit Role
		public List<RoleRight> LoadRoleRights(int RoleId)
		{
			try
			{

				using (webzyEntities ctx = new webzyEntities())
				{
					var dtLoadRights = (from c in ctx.RoleRights
										join d in ctx.Roles on c.RoleFk equals d.Id
										join e in ctx.Rights on c.RightFk equals e.Id
										where c.RoleFk == RoleId
										select c).ToList<RoleRight>();

					return dtLoadRights;
				}

			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message.ToString());
			}
		}
		public bool UpdateRole(Role role, string UserName, List<RoleRight> roleRights, List<RoleRight> tobeadded, List<RoleRight> tobedeleted)
		{
			try
			{
				if (AddRoleRights(role, tobeadded) && DeleteRoleRights(role,tobedeleted) && updateRoleRights(role))
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}
		}
		private bool updateRoleRights(Role role)
		{
			try
			{

				using (webzyEntities ctx = new webzyEntities())
				{
					var ExistingRole = (from c in ctx.Roles
										where c.Id == role.Id
										select c).SingleOrDefault();

					ExistingRole = ctx.Roles.Single(a => a.Id == role.Id);
					ExistingRole.ModifiedOn = DateTime.Now;
					ExistingRole.ModifiedBy = role.ModifiedBy;
					ExistingRole.Name = role.Name;
					ExistingRole.Description = role.Description;
					ExistingRole.Remark = role.Remark;
					ExistingRole.StatusFk = role.StatusFk;

					RoleLog roleLog = new RoleLog();
					roleLog.Description = role.Description;
					roleLog.Remark = "Update";
					roleLog.ModifiedOn = DateTime.Now;
					roleLog.ModifiedBy = role.ModifiedBy;
					roleLog.RoleName = role.Name;
					roleLog.Remark = role.Remark;
					roleLog.Status = GetStatusName(role.StatusFk.Value);
					ctx.RoleLogs.Add(roleLog);
					ctx.SaveChanges();
					return true;
				}
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}
		}

		private string GetStatusName(int StatusFk)
		{
			using (webzyEntities ctx = new webzyEntities())
			{
				string StatusName = (from c in ctx.Status where c.Id == StatusFk select c).SingleOrDefault().StatusName;
				return StatusName;
			}
		}
		private bool DeleteRoleRights(Role role, List<RoleRight> tobedeleted)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					foreach (RoleRight rolerights in tobedeleted)
					{
						if (rolerights.Id != 0)
						{
							RoleRight roleRight = (from c in ctx.RoleRights.Include("Right") where c.RightFk == rolerights.RightFk && c.RoleFk == rolerights.RoleFk  select c).SingleOrDefault();
							string RightName = roleRight.Right.Name;
							if (rolerights.RightFk > 0)
							{
								ctx.RoleRights.Remove(roleRight);
							
							RoleRightLog NewRoleRightsLog = new RoleRightLog();
							NewRoleRightsLog.Remark = "Remove";
							NewRoleRightsLog.RoleName = role.Name;
							NewRoleRightsLog.RightsName = FormatRightsName(RightName) + "NoAccess";
							NewRoleRightsLog.ModifiedBy = role.ModifiedBy;
							NewRoleRightsLog.ModifiedOn = role.ModifiedOn.Value;
							ctx.RoleRightLogs.Add(NewRoleRightsLog);
							}						
						}
					}
					ctx.SaveChanges();
					return true;
				}
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}
		}
		private string FormatRightsName(string rightName)
		{
			rightName = Regex.Replace(rightName, "Add", "", RegexOptions.IgnoreCase);
			rightName = Regex.Replace(rightName, "EDITOWN", "", RegexOptions.IgnoreCase);
			rightName = Regex.Replace(rightName, "EDITALL", "", RegexOptions.IgnoreCase);
			rightName = Regex.Replace(rightName, "EDIT", "", RegexOptions.IgnoreCase);
			rightName = Regex.Replace(rightName, "VIEW", "", RegexOptions.IgnoreCase);
			rightName = Regex.Replace(rightName, "NOACCESS", "", RegexOptions.IgnoreCase);
			return rightName;
		}
		private bool AddRoleRights(Role role, List<RoleRight> roleRights)
		{
			bool result = false;
			Role NewRole = new Role();
			RoleLog NewRoleLog = new RoleLog();
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					foreach (RoleRight roleRight in roleRights)
					{
						RoleRight NewRoleRight = new RoleRight();
						RoleRightLog NewRoleRightsLog = new RoleRightLog();

						NewRoleRight.RoleFk = roleRight.RoleFk;
						NewRoleRight.RightFk = roleRight.RightFk;
						NewRoleRight.Remark = role.Remark;
						NewRoleRight.ModifiedBy = role.ModifiedBy;
						NewRoleRight.ModifedOn = role.ModifiedOn.Value;

						NewRoleRightsLog.Remark = "Add";
						NewRoleRightsLog.RoleName = role.Name;
						NewRoleRightsLog.RightsName = roleRight.Right.Name;
						NewRoleRightsLog.ModifiedBy = role.ModifiedBy;
						NewRoleRightsLog.ModifiedOn = role.ModifiedOn.Value;
						if (!NewRoleRightsLog.RightsName.ToUpper().Contains("NOACCESS"))
						{
							var RoleRightid = (from c in ctx.RoleRights where c.RoleFk == roleRight.RoleFk && c.RightFk == roleRight.RightFk select c).ToList();
							if (RoleRightid.Count <= 0)
							{
								ctx.RoleRights.Add(NewRoleRight);
							}
						}
						ctx.RoleRightLogs.Add(NewRoleRightsLog);
					}
					ctx.SaveChanges();
				}

				result = true;
			}

			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}
			return result;
		}
		public Role GetRoleBy(int RoleId)
		{
			using (webzyEntities ctx = new webzyEntities())
			{
				var roleInfo = (from c in ctx.Roles where c.Id == RoleId select c).SingleOrDefault();
				return roleInfo;
			}
		}
		public List<RoleRight> GetRoleRightsBy(int RoleId)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					var dtLoadRights = (from c in ctx.RoleRights
										join d in ctx.Roles on c.RoleFk equals d.Id
										where c.RoleFk == RoleId
										select c);

					return dtLoadRights.ToList();
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
