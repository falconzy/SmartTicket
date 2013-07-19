using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.BizModule.UserManagement;
using System.Text.RegularExpressions;
using webzy.DataEntities;
using webzy.Utility.Encryption;
using webzy.BizModule.Miscellaneous;

namespace webzy.WebApplication.UserManagement
{
	public partial class AddUser : webbase
	{
		# region Variables
		LoginUser Current_User = new LoginUser();
		UserHelper userhelper = new UserHelper();
		EncryptionHelper Encrypetion = new EncryptionHelper();
		ControlHelper controlHelper = new ControlHelper();  
		#endregion
		# region Page Event
		protected void Page_Load(object sender, EventArgs e)
		{
			Current_User = (LoginUser)Session["CurrentUser"];
			if (Current_User == null)
			{
				Response.Redirect("../Login.aspx");
			}
            if (!AccessRight(Current_User.Rights, "[User]<1>"))
            {
                Response.Redirect("../Main.aspx?error=NoRights");
            }
			if (!IsPostBack)
			{
				LoadControlState();
			}
		}	
		protected void btnAdd_Click(object sender, EventArgs e)
		{
			lblErrorMsg.Text = string.Empty;
			try
			{
				if (this.ValidateUI())
				{
					bool ExisitingUser = userhelper.VerifuUserDetails(txtloginId.Text.Trim());
					if (ExisitingUser)
					{
						lblErrorMsg.Text = "User Already Exisits.";
					}
					else
					{
						WebUser webuser = GenerateUserInfo();
						if (userhelper.AddNewUser(webuser) && userhelper.AddNewUserLog(webuser, Active, "ADD"))
						{
							if (userhelper.AddUserRole(webuser.Id, Convert.ToInt32(ddlRole.SelectedValue), ddlRole.SelectedItem.Text, txtUserName.Text.ToString().Trim(), Current_User.Name) &&
							userhelper.AddUserGroup(webuser.Id, Convert.ToInt32(ddlGroup.SelectedValue), ddlGroup.SelectedItem.Text, txtUserName.Text.ToString().Trim(), Current_User.Name))
								Response.Redirect("~/UserManagement/UserManagementView.aspx");
						}
					}
				}
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "User Cannot be Added. system error: " + ex.Message.ToString() + "";
			}
		}
		protected void btnCancel_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/UserManagement/UserManagementView.aspx");
		}
		#endregion
		# region Private Method
		private void LoadControlState()
		{
			LoadRoleControl();
			LoadGroupControl();
		}
		private void LoadGroupControl()
		{
			try
			{
				ddlGroup.DataSource = controlHelper.loadGroup();
				ddlGroup.DataTextField = "GroupName";
				ddlGroup.DataValueField = "Id";
				ddlGroup.DataBind();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Group Cannot be loaded:  " + ex.Message.ToString() + "";
			}
		}
		private void LoadRoleControl()
		{
			try
			{
				ddlRole.DataSource = controlHelper.loadRole();
				ddlRole.DataTextField = "Name";
				ddlRole.DataValueField = "Id";
				ddlRole.DataBind();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Role Cannot be loaded:  " + ex.Message.ToString() + "";
			}
		}
		private Boolean ValidateUI()
		{
			if (string.IsNullOrWhiteSpace(this.txtUserName.Text))
			{
				lblErrorMsg.Text = "Please enter User Name";
				return false;
			}
			if (string.IsNullOrWhiteSpace(this.txtloginId.Text))
			{
				this.lblErrorMsg.Text = "Please enter User LoginName";
				return false;
			}
			if (string.IsNullOrWhiteSpace(this.txtPassword.Text) && string.IsNullOrWhiteSpace(this.txtRePassword.Text))
			{
				this.lblErrorMsg.Text = "Please enter Password";
				return false;
			}
			if (this.txtPassword.Text!=this.txtRePassword.Text)
			{
				this.lblErrorMsg.Text = "Password mis-match.Please re-enter your password.";
				return false;
			}
			if (this.txtEmailAddress.Text.Length > 0)
			{
				if (!controlHelper.CheckEmailFormat(txtEmailAddress.Text))
				{
					this.lblErrorMsg.Text = "Please enter the correct email foramt.";
					return false;
				}
			}

			return true;
		}
		private WebUser GenerateUserInfo()
		{
			WebUser webuser = new WebUser();
			webuser.Name = txtUserName.Text.ToString().Trim();
			webuser.LoginId = txtloginId.Text.ToString().Trim();
			webuser.EmailAddress = txtEmailAddress.Text.ToString().Trim();
			string EncryPassword = Encrypetion.EncrypToText(txtPassword.Text.Trim());
			webuser.Password = EncryPassword;
			webuser.StatusFk = ActiveId;
			webuser.ContactNumber = txtContactNumber.Text;
			webuser.Remark = txtRemarks.Text;
			webuser.ModifiedOn = DateTime.Now;
			webuser.ModifiedBy = Current_User.Name;
			return webuser;
		}
		#endregion
	}
}