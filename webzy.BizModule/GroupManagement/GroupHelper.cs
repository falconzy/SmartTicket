using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using webzy.DataEntities;
using System.Data.Entity.Infrastructure;

namespace webzy.BizModule.GroupManagement
{
    public class GroupHelper
	{
		# region View Group Summary Page

        public string GetGroupSearchQuery(string GroupName, string Status)
        {
            String command = @"SELECT * FROM GroupView ";
            if ((!(string.IsNullOrWhiteSpace(GroupName))) || (!(string.IsNullOrWhiteSpace(Status))))
            {
                command += "where ";
                if (((!(string.IsNullOrWhiteSpace(GroupName)))) && !(string.IsNullOrWhiteSpace(Status)) && Status.ToUpper() != "ALL")
                {
                    command += " GroupName like '%" + GroupName + "%'" + "AND Status like '%" + Status + "%' ";
                }
                else if (!(string.IsNullOrWhiteSpace(GroupName)))
                {
                    command += " GroupName like '%" + GroupName + "%' ";
                }
                else if (!(string.IsNullOrWhiteSpace(Status)) && Status.ToUpper() != "ALL")
                {
                    command += " Status like '%" + Status + "%' ";
                }
                if (command.Trim().Substring((command.Trim().Length) - 5).ToUpper().Equals("WHERE"))
                {
                    command = command.Trim().Substring(0, (command.Trim().Length) - 5);
                }
            }
            return command;
        }
        public DataTable SearchGroup(DataTable GroupList, string command)
        {
            string GroupName, ViewAbleByCustomer, Status;
            try
            {
                List<GroupView> Groups = new List<GroupView>();
                using (webzyEntities ctx = new webzyEntities())
                {
                    var objectContext = (ctx as IObjectContextAdapter).ObjectContext;
                    Groups = objectContext.ExecuteStoreQuery<GroupView>(command).ToList();
                    foreach (GroupView GroupInfo in Groups)
                    {
                        GroupName = GroupInfo.GroupName.ToString().Trim();
                        ViewAbleByCustomer = GroupInfo.ViewAbleByCustomer.ToString().Trim();
                        Status = GroupInfo.Status.ToString().Trim();
                        GroupList.Rows.Add(GroupInfo.Id, GroupName, ViewAbleByCustomer, Status);
                    }
                }
                return GroupList;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
		#endregion

		# region Add Group Page
		public bool VerifyGroupDetails(string GroupName)
        {
            try
            {
                using (webzyEntities ctx = new webzyEntities())
                {
                    var Group = from c in ctx.Groups where c.GroupName == GroupName select c;
                    if (Group.Count() > 0)
                    {
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                throw new Exception("Problem in Checking the Group Name info:" + ex.Message + "");

            }
        }
        public bool AddNewGroup(Group groupDetails)
        {
            try
            {
                using (webzyEntities ctx = new webzyEntities())
                {
                    ctx.Groups.Add(groupDetails);
                    ctx.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
		public bool AddNewgGroupLog(Group groupDetails, string Status, string Action)
        {
            try
            {
                using (webzyEntities ctx = new webzyEntities())
                {
                    DataEntities.GroupLog GroupInfo = new DataEntities.GroupLog();
                    GroupInfo.GroupName = groupDetails.GroupName;
                    GroupInfo.ViewAbleByCustomer = groupDetails.ViewAbleByCustomer;
                    GroupInfo.EmailAccount = groupDetails.EmailAccount;
                    GroupInfo.Status = Status;
                    GroupInfo.Remark = Action;
                    GroupInfo.ModifiedBy = groupDetails.ModifiedBy;
                    GroupInfo.ModifiedOn = DateTime.Now;
                    ctx.GroupLogs.Add(GroupInfo);
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

		# region Edit Group Page
		public Group GetGroupsBy(int GroupId)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					var Group = (from c in ctx.Groups where c.Id == GroupId select c).SingleOrDefault();
					return Group;
				}
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}
		}
		public bool UpdateGroup(Group GroupInfo)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					var ExsitingGroup = (from c in ctx.Groups where c.Id == GroupInfo.Id select c).SingleOrDefault();
					ExsitingGroup.GroupName = GroupInfo.GroupName;
					ExsitingGroup.ViewAbleByCustomer = GroupInfo.ViewAbleByCustomer;
					ExsitingGroup.EmailAccount = GroupInfo.EmailAccount;
					ExsitingGroup.StatusFk = GroupInfo.StatusFk;
					ExsitingGroup.Remark = GroupInfo.Remark;
					ExsitingGroup.ModifiedBy = GroupInfo.ModifiedBy;
					ExsitingGroup.ModifiedOn = DateTime.Now;
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
	}
}
