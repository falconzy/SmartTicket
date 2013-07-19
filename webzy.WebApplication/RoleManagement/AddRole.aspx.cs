using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.BizModule.RoleManagement;
using webzy.DataEntities;
using System.Text.RegularExpressions;

namespace webzy.WebApplication.RoleManagement
{
	public partial class AddRole : webbase
	{
		# region Variables
		LoginUser Current_User = new LoginUser();
		RoleHelper roleHelper = new RoleHelper();
		RightHelper rightHelper = new RightHelper();
		public int RoleId;
		#endregion
		# region Load Control
		protected void Page_Load(object sender, EventArgs e)
		{
			Current_User = (LoginUser)Session["CurrentUser"];
			if (Current_User == null)
			{
				Response.Redirect("../Login.aspx");
			}
            if (!AccessRight(Current_User.Rights, "[Role]<1>"))
            {
                Response.Redirect("../Main.aspx?error=NoRights");
            }
			if (!Page.IsPostBack)
			{
				ResetControls();
				LoadrblTRights();
			}
		}
		private void ResetControls()
		{
			rblRightsLabel1.Text = string.Empty;
			rblRightsLabel2.Text = string.Empty;
			rblRightsLabel3.Text = string.Empty;
			rblRightsLabel4.Text = string.Empty;
			rblRightsLabel5.Text = string.Empty;

			rblRights1.Visible = false;
			rblRights2.Visible = false;
			rblRights3.Visible = false;
			rblRights4.Visible = false;
			rblRights5.Visible = false;
		}
		private void LoadRights(List<Right> result, RadioButtonList targetControl, string RightName, string TextField, string ValueField)
		{
			try
			{
				foreach (Right item in result)
				{
					string data = GetFormattedModuleName(item.Name);
					item.Name = data;
				}
				result.Insert(0, NoAccessRights()); //Insert No access rights;

				targetControl.Visible = true;
				targetControl.Attributes["RightName"] = RightName;
				targetControl.DataSource = result;
				targetControl.DataTextField = TextField;
				targetControl.DataValueField = ValueField;
				targetControl.DataBind();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Unable to Load Rights : " + ex.Message.ToString() + "";
			}
		}

		private Right NoAccessRights()
		{
			Right right = new Right();
			right.Name = "No Access";
			return right;
		}

		private void LoadrblTRights()
		{
			try
			{
				List<Right> AllRights = rightHelper.loadRights();
				List<string> RightName = AllRights.Select(a => a.Name).ToList();
				List<string> SortedRightName = new List<string>();

				for (int i = 0; i < RightName.Count; i++)
				{
					string data = RightName[i];
					data = Regex.Replace(data, "Add", "", RegexOptions.IgnoreCase);
					data = Regex.Replace(data, "VIEW", "", RegexOptions.IgnoreCase);
					data = Regex.Replace(data, "EDITOWN", "", RegexOptions.IgnoreCase);
					data = Regex.Replace(data, "EDITALL", "", RegexOptions.IgnoreCase);
					data = Regex.Replace(data, "EDIT", "", RegexOptions.IgnoreCase);
					data = Regex.Replace(data, "NOACCESS", "", RegexOptions.IgnoreCase);
					SortedRightName.Add(data);

				}
				SortedRightName = SortedRightName.Distinct().ToList();
				if (SortedRightName.Count == 0)
				{
					lblErrorMsg.Text = "There are no Rights to display";
				}
				for (int i = 0; i < SortedRightName.Count; i++)
				{
					string rightName = SortedRightName[i];
					/*
					 * load same module rights;
					 * Exampel :
					 * UserAdd,UserEdit,UserView
					 * replacce Add;Edit;View using GetFormattedtaskName method
					 * find all rights releted to User;
					 *  
					 */
					List<Right> rightEntity = AllRights.FindAll(delegate(Right r) { return GetFormattedtaskName(r.Name) == rightName; }); 

					switch (i)
					{
						case 0:
							rblRightsLabel1.Text = rightName;
							LoadRights(rightEntity, rblRights1, rightName, "Name", "Id");
							getDefaultSelectedRadiobuttons();
							break;
						case 1:
							rblRightsLabel2.Text = rightName;
							LoadRights(rightEntity, rblRights2, rightName, "Name", "Id");							
							getDefaultSelectedRadiobuttons();
							break;
						case 2:
							rblRightsLabel3.Text = rightName;
							LoadRights(rightEntity, rblRights3, rightName, "Name", "Id");							
							getDefaultSelectedRadiobuttons();
							break;
						case 3:
							rblRightsLabel4.Text = rightName;
							LoadRights(rightEntity, rblRights4, rightName, "Name", "Id");
							getDefaultSelectedRadiobuttons();
							break;
						case 4:
							rblRightsLabel5.Text = rightName;
							LoadRights(rightEntity, rblRights5, rightName, "Name", "Id");
							getDefaultSelectedRadiobuttons();
							break;
						case 5:
							rblRightsLabel6.Text = rightName;
							LoadRights(rightEntity, rblRights6, rightName, "Name", "Id");
							getDefaultSelectedRadiobuttons();
							break;
					}

				}
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Unable to load the information : " + ex.Message.ToString() + "";
			}


		}
		private Boolean ValidateUI()
		{
			if (String.IsNullOrWhiteSpace(this.txtRoleName.Text))
			{
				this.lblErrorMsg.Text = "Please enter Role Name";
				return false;
			}
			return true;
		}
		private string GetFormattedtaskName(string input)
		{
			string data = input;
			data = Regex.Replace(data, "Add", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "VIEW", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "EDITOWN", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "EDITALL", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "EDIT", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "NOACCESS", "", RegexOptions.IgnoreCase);
			return data;
		}
		#endregion
		# region Page Event
		protected void btnCancel_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/RoleManagement/ViewRoleSummary.aspx");
		}
		protected void btnAddNewRole_Click(object sender, EventArgs e)
		{
			lblErrorMsg.Text = "";
			try
			{
				if (this.ValidateUI())
				{
					if (roleHelper.CheckDuplicateRoleName(txtRoleName.Text.Trim()))
					{
						lblErrorMsg.Text = "Role Name  Already Exisits";
					}
					else
					{
						Role Role = LoadNewRole();
						List<RadioButtonList> rdbList = LoadBtnList();
						List<RoleRight> RoleRights = new List<RoleRight>();
						List<Right> Rights = new List<Right>();
					
						foreach (RadioButtonList rbListControl in rdbList)
						{
							RadioButtonList rblList = rbListControl;
							RoleRight RoleRight = new RoleRight();
							foreach (ListItem lstitem in rblList.Items)
							{
								if (lstitem.Selected == true)
								{
									string rightName = rbListControl.Attributes["RightName"].ToString();
									RoleRight.RightFk = Convert.ToInt32(lstitem.Value);
									Right Right = new Right();
									string data = lstitem.Text;
									if (lstitem.Text == "Edit Own")
										data = Regex.Replace(lstitem.Text, "Edit Own", "EditOwn", RegexOptions.IgnoreCase);
									else if (lstitem.Text == "Edit All")
										data = Regex.Replace(lstitem.Text, "Edit All", "EditAll", RegexOptions.IgnoreCase);
									else if (lstitem.Text == "No Access")
										data = Regex.Replace(lstitem.Text, "No Access", "NoAccess", RegexOptions.IgnoreCase);
									Right.Name = data;	
									RoleRights.Add(RoleRight);
									Rights.Add(Right);
								}
							}
						}

						bool result = roleHelper.AddRole(Role, RoleRights, Rights);
						if (result)
						{
							Response.Redirect("~/RoleManagement/ViewRoleSummary.aspx");
						}
						else
						{
							lblErrorMsg.Text = " Role cannot be Added";
						}
					}
				}
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Error during Adding the Roles: " + ex.Message.ToString() + "";
			}
		}
		private List<RadioButtonList> LoadBtnList()
		{
			List<RadioButtonList> rdbList = new List<RadioButtonList>();
			rdbList.Add(rblRights1);
			rdbList.Add(rblRights2);
			rdbList.Add(rblRights3);
			rdbList.Add(rblRights4);
			rdbList.Add(rblRights5);
			rdbList.Add(rblRights6);
			return rdbList;
		}
		private Role LoadNewRole()
		{
			Role Role = new Role();
			Role.Remark = txtRemarks.Text.ToString().Trim();
			Role.Description = txtDescription.Text.ToString().Trim();
			Role.Name = txtRoleName.Text.ToString().Trim();
			Role.ModifiedOn = DateTime.Now;
			Role.ModifiedBy = Current_User.Name;
			Role.StatusFk = ActiveId;
			return Role;
		}
		private void selectedRadiobuttons()
		{
			if (AddRolePanel.Controls.Count > 0)
			{
				Control mainControl = AddRolePanel.Controls[0];
				foreach (Control c in mainControl.Controls)
				{
					if (c is RadioButtonList)
					{
						RadioButtonList rblList = (RadioButtonList)c;

						foreach (ListItem lst in rblList.Items)
						{
							if (lst.Selected == true)
							{
								lst.Selected = true;
							}
						}
					}
				}
			}
		}
		private void getDefaultSelectedRadiobuttons()
		{
			if (AddRolePanel.Controls.Count > 0)
			{
				Control mainControl = AddRolePanel.Controls[0];
				foreach (Control c in mainControl.Controls)
				{
					if (c is RadioButtonList)
					{
						RadioButtonList rblList = (RadioButtonList)c;

						foreach (ListItem lst in rblList.Items)
						{
							if (lst.Selected == false)
							{
								if (lst.Text == "No Access")
								{
									lst.Selected = true;
								}
							}
						}
					}
				}
			}
		}
		private string GetFormattedModuleName(string input)
		{
			//Format Right Name; 
			string data = input;
			data = Regex.Replace(data, "Group", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "USER", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "REPORT", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "ROLE", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "Module", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "Customer", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "EditOwn", "Edit Own", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "EditAll", "Edit All", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "Edit", "Edit", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "NoAccess", "No Access", RegexOptions.IgnoreCase);
			return data;
		}
		#endregion
	}
}