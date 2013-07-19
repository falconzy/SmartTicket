using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.BizModule.UserManagement;
using webzy.BizModule.GroupManagement;
using webzy.DataEntities;
using System.Text.RegularExpressions;
using webzy.BizModule.Miscellaneous;

namespace webzy.WebApplication.GroupManagement
{
	public partial class AddGroup : webbase
	{
		# region Variables
		LoginUser Current_User = new LoginUser();
		GroupHelper groupHelper = new GroupHelper();
		ControlHelper controlHelper = new ControlHelper();  
		#endregion

		# region Page Method
		protected void Page_Load(object sender, EventArgs e)
		{
			Current_User = (LoginUser)Session["CurrentUser"];
			if (Current_User == null)
			{
				Response.Redirect("../Login.aspx");
			}
            if (!AccessRight(Current_User.Rights, "[Group]<1>"))
            {
                Response.Redirect("../Main.aspx?error=NoRights");
            }
           
		}
		protected void btnViewByCustomerYes_Click(object sender, EventArgs e)
		{
			btnViewByCustomerYes.Enabled = false;
			btnViewByCustomerNo.Enabled = true;
		}
		protected void btnViewByCustomerNo_Click(object sender, EventArgs e)
		{
			btnViewByCustomerYes.Enabled = true;
			btnViewByCustomerNo.Enabled = false;
		}
		protected void btnAdd_Click(object sender, EventArgs e)
		{
			lblErrorMsg.Text = string.Empty;
			try
			{
				if (this.ValidateUI())
				{
					bool ExisitingGroup= groupHelper.VerifyGroupDetails(txtGroupName.Text.ToString().Trim());
					if (ExisitingGroup)
					{
						lblErrorMsg.Text = "Group Already Exisits.";
					}
					else
					{
						webzy.DataEntities.Group groupDetails = GenerateGroupInfo();
						if (groupHelper.AddNewGroup(groupDetails) && groupHelper.AddNewgGroupLog(groupDetails, Active, "ADD"))
						{
							Response.Redirect("~/GroupManagement/ViewGroupSummary.aspx");
						}
						else
						{
							 lblErrorMsg.Text = "Group Cannot be Added.";
						}
					}
				}
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Group Cannot be Added. system error: " + ex.Message.ToString() + "";
			}
		}       
		protected void btnCancel_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/GroupManagement/ViewGroupSummary.aspx");
		}
		#endregion

		# region Private Method
		private bool ValidateUI()
		{
			if (string.IsNullOrWhiteSpace(this.txtGroupName.Text))
			{
				lblErrorMsg.Text = "Please enter Group Name";
				return false;
			}
		  
			if (this.txtGrpEmailAddress.Text.Length > 0)
			{
				if (!controlHelper.CheckEmailFormat(txtGrpEmailAddress.Text))
				{
					this.lblErrorMsg.Text = "Please enter the correct email foramt.";
					return false;
				}
			}

			return true;
		}
		private DataEntities.Group GenerateGroupInfo()
		{
			DataEntities.Group GroupInfo = new DataEntities.Group();
			GroupInfo.GroupName = txtGroupName.Text.ToString().Trim();
			GroupInfo.ViewAbleByCustomer = btnViewByCustomerNo.Enabled;
			GroupInfo.EmailAccount = txtGrpEmailAddress.Text;
			GroupInfo.StatusFk = ActiveId;
			GroupInfo.Remark = txtRemarks.Text;
			GroupInfo.ModifiedBy = Current_User.Name.ToString().Trim();
			GroupInfo.ModifiedOn = DateTime.Now;
			return GroupInfo;
		}
		#endregion
	}
}