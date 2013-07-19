using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.BizModule.Miscellaneous;
using webzy.BizModule.GroupManagement;
using System.Text.RegularExpressions;

namespace webzy.WebApplication.GroupManagement
{
    public partial class EditGroup : webbase
    {
		#region Variables
		LoginUser Current_User = new LoginUser();
		ControlHelper controlHelper = new ControlHelper();
		GroupHelper groupHelper = new GroupHelper();
		#endregion
		#region Page Events
		protected void Page_Load(object sender, EventArgs e)
		{

			Current_User = (LoginUser)Session["CurrentUser"];
			if (Current_User == null)
			{
				Response.Redirect("../Login.aspx");
			}
            if (!AccessRight(Current_User.Rights, "[Group]<0>"))
            {
                Response.Redirect("../Main.aspx?error=NoRights");
            }
			else
			{
				if (Request.QueryString["GroupId"] != null)
				{
					ViewState["GroupId"] = Request.QueryString["GroupId"] .ToString().Trim();
				}
				if (Current_User.keepLogin)
				{
					this.AddKeepAlive();
				}
				else
				{
					this.AddSessionEndPopup();
				}

			}
			if (!Page.IsPostBack)
			{
				LoadStatus();
				LoadGroupInfo();
			}

		}
		protected void btnCancel_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/GroupManagement/ViewGroupSummary.aspx");
		}
		protected void btnEdit_Click(object sender, EventArgs e)
		{
            if (!AccessRight(Current_User.Rights, "[Group]<2>"))
            {
                lblErrorMsg.Text = "Sorry, You do not have rights to edit this group";
            }
            else
            { 
			btnEdit.Visible = false;
			btnUpdate.Visible = true;
			btnCancel.Visible = true;
			ddlStatus.Enabled = true;
			txtGroupName.Enabled = true;
			SetViewableByCustomer();
			txtEmailAddress.Enabled = true;
			txtRemarks.Enabled = true;
			btnViewByCustomerNo.Visible = true;
			btnViewByCustomerYes.Visible = true;
            }
		}
		protected void btnUpdate_Click(object sender, EventArgs e)
		{
			lblErrorMsg.Text = "";
			try
			{
				if (this.ValidateUI())
				{
					DataEntities.Group GroupInfo = GenerateGroupInfo();
					if (groupHelper.UpdateGroup(GroupInfo) && groupHelper.AddNewgGroupLog(GroupInfo, ddlStatus.SelectedItem.Text, "Update"))
					{
						Response.Redirect("~/GroupManagement/ViewGroupSummary.aspx");
					}
					else
					{
						lblErrorMsg.Text = "Group Cannot update.";
					}
				}
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Group Cannot update. system error: " + ex.Message.ToString() + "";
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

		#endregion
		#region Private Events
		private DataEntities.Group GenerateGroupInfo()
		{
			DataEntities.Group GroupInfo = new DataEntities.Group();
			GroupInfo.Id = Convert.ToInt32(ViewState["GroupId"]);
			GroupInfo.GroupName = txtGroupName.Text.ToString().Trim();
			GroupInfo.Remark = txtRemarks.Text;
			GroupInfo.StatusFk = Convert.ToInt32(ddlStatus.SelectedValue);
			GroupInfo.ViewAbleByCustomer = btnViewByCustomerNo.Enabled;
			GroupInfo.EmailAccount = txtEmailAddress.Text;
			GroupInfo.ModifiedOn = DateTime.Now;
			GroupInfo.ModifiedBy = Current_User.Name;
			return GroupInfo;
		}

		private void SetViewableByCustomer()
		{
			int GroupId = Convert.ToInt32(ViewState["GroupId"]);
			DataEntities.Group GroupInfo = groupHelper.GetGroupsBy(GroupId);
			if (GroupInfo.ViewAbleByCustomer)
			{
				btnViewByCustomerYes.Enabled = false;
				btnViewByCustomerYes.Visible = true;
				btnViewByCustomerNo.Visible = false;
				btnViewByCustomerNo.Enabled = true;
			}
			else
			{
				btnViewByCustomerNo.Enabled = false;
				btnViewByCustomerNo.Visible = true;
				btnViewByCustomerYes.Visible = false;
				btnViewByCustomerYes.Enabled = true;
			}
		}

		private Boolean CheckEmailFormat(string email)
		{
			bool correctFormat = false;

			Regex rg = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
			Match mt = rg.Match(this.txtEmailAddress.Text);

			if (mt.Success)
			{
				correctFormat = true;
			}
			return correctFormat;
		}
		
		private Boolean ValidateUI()
		{
			if (string.IsNullOrWhiteSpace(this.txtGroupName.Text))
			{
				lblErrorMsg.Text = "Please enter Group Name";
				return false;
			}
			if (!(string.IsNullOrEmpty(this.txtEmailAddress.Text.Trim())))
			{
				if (!CheckEmailFormat(this.txtEmailAddress.Text.Trim()))
				{
					this.txtEmailAddress.Text = "Please enter the valid Email Address";
					return false;
				}
			}
			return true;
		}

		private void LoadStatus()
		{
			try
			{
				ddlStatus.DataSource = controlHelper.loadStatus();
				ddlStatus.DataTextField = "StatusName";
				ddlStatus.DataValueField = "Id";
				ddlStatus.DataBind();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Status Cannot be loaded:  " + ex.Message.ToString() + "";
			}
		}

		private void LoadGroupInfo()
		{
			try
			{
				int GroupId = Convert.ToInt32(ViewState["GroupId"]);
				lblErrorMsg.Text = "";
				DataEntities.Group GroupDetails = groupHelper.GetGroupsBy(GroupId);
				txtGroupName.Text = GroupDetails.GroupName;
				ddlStatus.SelectedValue = GroupDetails.StatusFk.ToString();
				SetViewableByCustomer();
				txtEmailAddress.Text = GroupDetails.EmailAccount;
				txtRemarks.Text = GroupDetails.Remark;
				disableControls();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Unable to load the Group Information : " + ex.Message.ToString() + "";
			}
		}

		private void disableControls()
		{
			btnUpdate.Visible = false;
			txtGroupName.Enabled = false;
			txtEmailAddress.Enabled = false;
			txtRemarks.Enabled = false;
			ddlStatus.Enabled = false;
			btnViewByCustomerYes.Enabled = false;
			btnViewByCustomerNo.Enabled = false;
		}
		#endregion

	
    }
}