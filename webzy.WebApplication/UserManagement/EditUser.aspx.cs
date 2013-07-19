using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.Utility.Encryption;
using webzy.BizModule.UserManagement;
using webzy.DataEntities;
using webzy.BizModule.Miscellaneous;
using System.Text.RegularExpressions;

namespace webzy.WebApplication.UserManagement
{
	public partial class EditUser : webbase
	{
		# region Variables
		LoginUser Current_User = new LoginUser();
		UserHelper userhelper = new UserHelper();
		EncryptionHelper Encrypetion = new EncryptionHelper();
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
			if (!AccessRight(Current_User.Rights, "[User]<0>"))
			{
				Response.Redirect("../Main.aspx?error=NoRights");
			}
			if (Request.QueryString["UserId"] != null)
			{
				ViewState["UserId"] = Request.QueryString["UserId"].ToString().Trim();
				if (!IsPostBack)
				{
					loadContrls(ViewState["UserId"].ToString());
					DisableControls();
				}
			}
			else
			{
				Response.Redirect("../UserManagement/UserManagementView.aspx");
			}
		  
		}
		protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (!AccessRight(Current_User.Rights, "[User]<2>"))
            {
                lblErrorMsg.Text = "Sorry,You do not have right to edit this user.";
            }
            else
            { 
			EnableControls();
			btnUpdate.Visible = true;
			btnEdit.Visible = false;
            }
		}
		protected void btnCancel_Click(object sender, EventArgs e)
		{
			Response.Redirect("../UserManagement/UserManagementView.aspx");
		}
		protected void btnUpdate_Click(object sender, EventArgs e)
		{
			try
			{
				if (ValidateUI())
				{
					WebUser webuser = GenerateUserInfo();
					if (userhelper.UpdateUser(webuser) && userhelper.AddNewUserLog(webuser, "UPDATE", ddlStatus.SelectedItem.Text))
					{
						if (userhelper.updateUserRole(webuser.Id, Convert.ToInt32(ddlRole.SelectedValue), ddlRole.SelectedItem.Text, txtUserName.Text.ToString().Trim(),Current_User.Name) && 
							userhelper.updateUserGroup(webuser.Id, Convert.ToInt32(ddlGroup.SelectedValue),ddlGroup.SelectedItem.Text,txtUserName.Text.ToString().Trim(),Current_User.Name))
						{
							Response.Redirect("~/UserManagement/UserManagementView.aspx");
						}
					
					}
				}
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "User Cannot be updated. system error: " + ex.Message.ToString() + "";
			}

		}	
		#endregion

		# region Private Method
		private void DisableControls()
		{
			txtUserName.Enabled = false;
			txtEmailAddress.Enabled = false;
			txtRemarks.Enabled = false;
			txtContactNumber.Enabled = false;
			txtPassword.Enabled = false;
			txtRePassword.Enabled = false;
			ddlStatus.Enabled = false;
			ddlRole.Enabled = false;
			ddlGroup.Enabled = false;
		}
		private void EnableControls()
		{
			txtUserName.Enabled = true;
			txtEmailAddress.Enabled = true;
			txtRemarks.Enabled = true;
			txtContactNumber.Enabled = true;
			txtPassword.Enabled = true;
			txtRePassword.Enabled = true;
			ddlStatus.Enabled = true;
			ddlRole.Enabled = true;
			ddlGroup.Enabled = true;
		}
		private void loadContrls(string UserId)
		{
			try
			{
				loadddlStatus();
				LoadGroupControl();
				LoadRoleControl();
				int Id = Convert.ToInt32(UserId);
				WebUserView EditUser = userhelper.GetUserViewBy(Id);
				txtUserName.Text = EditUser.Name;
				txtEmailAddress.Text = EditUser.EmailAddress;
				lblloginID.Text = EditUser.LoginId;
				txtRemarks.Text = EditUser.Remark;
				txtContactNumber.Text = EditUser.ContactNumber;
				ddlStatus.SelectedItem.Text = EditUser.Status;
				ddlGroup.SelectedItem.Text = EditUser.GroupName;
				ddlRole.SelectedItem.Text = EditUser.RoleName;
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Unable to load the User Information : " + ex.Message.ToString() + "";
			}
		}
		private void loadddlStatus()
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
				lblErrorMsg.Text = "StatusCannot be loaded:  " + ex.Message.ToString() + "";
			}
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
			if (this.txtPassword.Text != this.txtRePassword.Text)
			{
				this.lblErrorMsg.Text = "Password mis-match.Please re-enter your password.";
				return false;
			}
			if (this.txtEmailAddress.Text.Length > 0)
			{
				if (!CheckEmailFormat(txtEmailAddress.Text))
				{
					this.lblErrorMsg.Text = "Please enter the correct email foramt.";
					return false;
				}
			}

			return true;
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
		private WebUser GenerateUserInfo()
		{
			WebUser webuser = new WebUser();
			webuser.Id = Convert.ToInt32(ViewState["UserId"].ToString());
			webuser.Name = txtUserName.Text.ToString().Trim();
			webuser.EmailAddress = txtEmailAddress.Text.ToString().Trim();
			if (txtPassword.Text.Trim().Length > 0)
			{
				string EncryPassword = Encrypetion.EncrypToText(txtPassword.Text.Trim());
				webuser.Password = EncryPassword;
			}
			else
			{
				webuser.Password = string.Empty;
			}
			webuser.StatusFk = Convert.ToInt32(ddlStatus.SelectedValue);
			webuser.ContactNumber = txtContactNumber.Text;
			webuser.Remark = txtRemarks.Text;
			webuser.ModifiedOn = DateTime.Now;
			webuser.ModifiedBy = Current_User.Name;
			return webuser;
		}
		#endregion		
	}
}