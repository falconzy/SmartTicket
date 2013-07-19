using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.BizModule.RoleManagement;
using System.Text.RegularExpressions;
using webzy.BizModule.Miscellaneous;
using webzy.DataEntities;

namespace webzy.WebApplication.RoleManagement
{
	public partial class EditRole : webbase
	{
		# region Variables
		LoginUser Current_User = new LoginUser();
		RoleHelper roleHelper = new RoleHelper();
		RightHelper rightHelper = new RightHelper();
		ControlHelper controlHelper = new ControlHelper();
		public int CurrentRoleID;
		public int RightFk;
		#endregion

		# region Load Control
		protected void Page_Load(object sender, EventArgs e)
		{
			Current_User = (LoginUser)Session["CurrentUser"];
			if (Current_User == null)
			{
				Response.Redirect("../Login.aspx");
			}
			else
			{
				if (!AccessRight(Current_User.Rights, "[role]<0>"))
				{
					Response.Redirect("../Main.aspx?error=NoRights");
				}
				if (Request.QueryString["RoleId"] != null)
				{
					ViewState["RoleId"] = Request.QueryString["RoleId"].ToString().Trim();
				}
			}
			if (!Page.IsPostBack)
			{
				LoadStatus();
				LoadRoles();
				btnUpdate.Visible = false;
			}
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
		private string GetFormattedtaskName(string input)
		{
			string data = input;
			data = Regex.Replace(data, "Add", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "EDITOWN", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "EDITALL", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "EDIT", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "VIEW", "", RegexOptions.IgnoreCase);
			data = Regex.Replace(data, "NOACCESS", "", RegexOptions.IgnoreCase);
			return data;

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
				lblErrorMsg.Text = "Rights cannot be loaded " + ex.Message.ToString() + "";
			}
		}
		private void LoadRoles()
		{
			try
			{
				int RoleId = Convert.ToInt32(ViewState["RoleId"]);
				Role roleInfo = roleHelper.GetRoleBy(RoleId);
				List<RoleRight> RoleRightList = roleHelper.LoadRoleRights(RoleId);

				txtRoleName.Text = roleInfo.Name;
				txtboxRoleDescription.Text = roleInfo.Description;
				txtRemarks.Text = roleInfo.Remark;
				ddlStatus.SelectedValue = roleInfo.StatusFk.ToString();
				LoadRolesRightRbl();
				DisableEditControls();
				DisableRbl();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Roles Cannot be Updated, " + ex.Message.ToString() + "";
			}
		}
		private void LoadRolesRightRbl()
		{
			try
			{
				int RoleId = Convert.ToInt32(ViewState["RoleId"]);
				List<Right> AllRights = rightHelper.loadRights();
				List<RoleRight> SelectedRoleRight = roleHelper.GetRoleRightsBy(RoleId);
				List<string> RightName = AllRights.Select(a => a.Name).ToList();
				List<string> SortedRightName = new List<string>();

				for (int i = 0; i < RightName.Count; i++)
				{
					string data = RightName[i];
					data = Regex.Replace(data, "Add", "", RegexOptions.IgnoreCase);
					data = Regex.Replace(data, "EDITOWN", "", RegexOptions.IgnoreCase);
					data = Regex.Replace(data, "EDITALL", "", RegexOptions.IgnoreCase);
					data = Regex.Replace(data, "EDIT", "", RegexOptions.IgnoreCase);
					data = Regex.Replace(data, "VIEW", "", RegexOptions.IgnoreCase);
					data = Regex.Replace(data, "NOACCESS", "", RegexOptions.IgnoreCase);
					SortedRightName.Add(data);
				}

				SortedRightName = SortedRightName.Distinct().ToList();
				if (SortedRightName.Count == 0)
				{
					lblErrorMsg.Text = "Sorry,This Role dosent have any Rights to display";
				}
				for (int i = 0; i < SortedRightName.Count; i++)
				{
					string rightName = SortedRightName[i];
					List<Right> rightEntity = AllRights.FindAll(delegate(Right r) { return GetFormattedtaskName(r.Name) == rightName; });

					switch (i)
					{
						case 0:
							rblRights1.Visible = true;
							rblRightsLabel1.Visible = true;
							rblRightsLabel1.Text = GetFormattedtaskName(rightName);
							LoadRights(rightEntity, rblRights1, rblRightsLabel1.Text, "Name", "Id");

							foreach (ListItem item in rblRights1.Items)
							{
								List<RoleRight> SelectedRights = SelectedRoleRight.FindAll(delegate(RoleRight r) { return r.RightFk == Convert.ToInt32(item.Value); });
								if (SelectedRights != null && SelectedRights.Count > 0)
								{
									item.Selected = true;
									rblRights1.Enabled = false;
									lblErrorMsg.Text = "";
								}
							}
							break;
						case 1:
							rblRights2.Visible = true;
							rblRightsLabel2.Visible = true;
							rblRightsLabel2.Text = GetFormattedtaskName(rightName);
							LoadRights(rightEntity, rblRights2, rblRightsLabel2.Text, "Name", "Id");

							foreach (ListItem item in rblRights2.Items)
							{
								List<RoleRight> SelectedRights = SelectedRoleRight.FindAll(delegate(RoleRight r) { return r.RightFk == Convert.ToInt32(item.Value); });
								if (SelectedRights != null && SelectedRights.Count > 0)
								{
									item.Selected = true;
									rblRights2.Enabled = false;
									lblErrorMsg.Text = "";
								}
							}
							break;
						case 2:
							rblRights3.Visible = true;
							rblRightsLabel3.Visible = true;
							rblRightsLabel3.Text = GetFormattedtaskName(rightName);
							LoadRights(rightEntity, rblRights3, rblRightsLabel3.Text, "Name", "Id");

							foreach (ListItem item in rblRights3.Items)
							{
								List<RoleRight> SelectedRights = SelectedRoleRight.FindAll(delegate(RoleRight r) { return r.RightFk == Convert.ToInt32(item.Value); });
								if (SelectedRights != null && SelectedRights.Count > 0)
								{
									item.Selected = true;
									rblRights3.Enabled = false;
									lblErrorMsg.Text = "";
								}
							}
							break;
						case 3:
							rblRights4.Visible = true;
							rblRightsLabel4.Visible = true;
							rblRightsLabel4.Text = GetFormattedtaskName(rightName);
							LoadRights(rightEntity, rblRights4, rblRightsLabel4.Text, "Name", "Id");

							foreach (ListItem item in rblRights4.Items)
							{
								List<RoleRight> SelectedRights = SelectedRoleRight.FindAll(delegate(RoleRight r) { return r.RightFk == Convert.ToInt32(item.Value); });
								if (SelectedRights != null && SelectedRights.Count > 0)
								{
									item.Selected = true;
									rblRights4.Enabled = false;
									lblErrorMsg.Text = "";
								}
							}
							break;
						case 4:
							rblRights5.Visible = true;
							rblRightsLabel5.Visible = true;
							rblRightsLabel5.Text = GetFormattedtaskName(rightName);
							LoadRights(rightEntity, rblRights5, rblRightsLabel5.Text, "Name", "Id");

							foreach (ListItem item in rblRights5.Items)
							{
								List<RoleRight> SelectedRights = SelectedRoleRight.FindAll(delegate(RoleRight r) { return r.RightFk == Convert.ToInt32(item.Value); });
								if (SelectedRights != null && SelectedRights.Count > 0)
								{
									item.Selected = true;
									rblRights5.Enabled = false;
									lblErrorMsg.Text = "";
								}
							}
							break;
						case 5:
							rblRights6.Visible = true;
							rblRightsLabel6.Visible = true;
							rblRightsLabel6.Text = GetFormattedtaskName(rightName);
							LoadRights(rightEntity, rblRights6, rblRightsLabel6.Text, "Name", "Id");

							foreach (ListItem item in rblRights6.Items)
							{
								List<RoleRight> SelectedRights = SelectedRoleRight.FindAll(delegate(RoleRight r) { return r.RightFk == Convert.ToInt32(item.Value); });
								if (SelectedRights != null && SelectedRights.Count > 0)
								{
									item.Selected = true;
									rblRights6.Enabled = false;
									lblErrorMsg.Text = "";
								}
							}
							break;
					}
				}
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Roles Cannot be updated, " + ex.Message.ToString() + "";
			}

		}
		private void LoadRbl(List<RadioButtonList> rdbList)
		{

			rdbList.Add(rblRights1);
			rdbList.Add(rblRights2);
			rdbList.Add(rblRights3);
			rdbList.Add(rblRights4);
			rdbList.Add(rblRights5);
			rdbList.Add(rblRights6);
		}
		private Role LoadRole()
		{
			Role Role = new Role();
			Role.ModifiedOn = DateTime.Now;
			Role.Name = txtRoleName.Text.ToString();
			Role.Description = txtboxRoleDescription.Text.ToString();
			Role.ModifiedBy = Current_User.Name;
			Role.Remark = txtRemarks.Text.ToString();
			Role.Id = Convert.ToInt32(ViewState["RoleId"]);
			Role.StatusFk = Convert.ToInt32(ddlStatus.SelectedValue);
			return Role;
		}
		#endregion
		# region Page Event
		protected void btnEdit_Click(object sender, EventArgs e)
		{
			
			if (!AccessRight(Current_User.Rights, "[Role]<2>"))
			{

				lblErrorMsg.Text = "Sorry, you have no rights to Edit this Role.";
			}
			else
			{
				int RoleId = Convert.ToInt32(ViewState["RoleId"]);
				int UserFk = Current_User.Id;
				this.EnableEditControls();
				this.EnableRbl();
			}

		}
		protected void btnUpdate_Click(object sender, EventArgs e)
		{
			/* Logic on update rights
			 * Add All new seletced rights and remove all old rights
			 */

			try
			{
				int RoleId = Convert.ToInt32(ViewState["RoleId"]);
				List<RoleRight> RoleRights = new List<RoleRight>();
				List<RoleRight> ExistingRoleRights = roleHelper.LoadRoleRights(RoleId);
				List<RoleRight> Tobeadded = new List<RoleRight>();
				List<RoleRight> Tobedeleted = new List<RoleRight>();
				List<RoleRight> TobeUpdated = new List<RoleRight>();
				List<RadioButtonList> rdbList = new List<RadioButtonList>();

				DisableEditControls();
				DisableRbl();
				Role Role = LoadRole();
				LoadRbl(rdbList);

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
							Right Right = FormatRightName(lstitem);
							RoleRight.Right = Right;
							RoleRight.RoleFk = RoleId;
							RoleRights.Add(RoleRight);
						}
					}
				}
				foreach (RoleRight roleRight in RoleRights)
				{
						Tobeadded.Add(roleRight);
				}
				foreach (RoleRight roleRight in ExistingRoleRights)
				{
					List<RoleRight> matching = Tobeadded.FindAll(delegate(RoleRight rr) { return rr.RightFk == roleRight.RightFk; });
					if (matching.Count <= 0)
					{
						Tobedeleted.Add(roleRight);
					}
				}
				bool Result = roleHelper.UpdateRole(Role,Current_User.Name, RoleRights, Tobeadded, Tobedeleted);
				
				if (Result)
				{
					Response.Redirect("~/RoleManagement/ViewRoleSummary.aspx");
				}
				else
				{
					lblErrorMsg.Text = " Role cannot be updated";
				}
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Roles Cannot be Updated, " + ex.Message.ToString() + "";
			}

		}	
		protected void btnCancel_Click(object sender, EventArgs e)
		{
			btnEdit.Enabled = false;
			Response.Redirect("~/RoleManagement/ViewRoleSummary.aspx");
		}
		protected void btnAddNewRole_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/RoleManagement/AddRole.aspx");
		}
		#endregion
		# region Private Method
		private static Right FormatRightName(ListItem lstitem)
		{
			Right Right = new Right();
			string data = lstitem.Text;
			if (lstitem.Text == "Edit Own")
				data = Regex.Replace(lstitem.Text, "Edit Own", "EditOwn", RegexOptions.IgnoreCase);
			else if (lstitem.Text == "Edit All")
				data = Regex.Replace(lstitem.Text, "Edit All", "EditAll", RegexOptions.IgnoreCase);
			else if (lstitem.Text == "No Access")
				data = Regex.Replace(lstitem.Text, "No Access", "NoAccess", RegexOptions.IgnoreCase);
			Right.Name = data;
			return Right;
		}
		private string GetFormattedModuleName(string input)
		{
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
		private Right NoAccessRights()
		{
			Right right = new Right();
			right.Name = "No Access";
			return right;
		}
		private void DisableEditControls()
		{
			btnEdit.Visible = true;
			btnCancel.Enabled = true;
			btnUpdate.Visible = false;
			txtRoleName.Enabled = false;
			txtboxRoleDescription.Enabled = false;
			txtRemarks.Enabled = false;
			ddlStatus.Enabled = false;
		
			lblErrorMsg.Text = string.Empty;
		}
		private void DisableRbl()
		{
			rblRights1.Enabled = false;
			rblRights2.Enabled = false;
			rblRights3.Enabled = false;
			rblRights4.Enabled = false;
			rblRights5.Enabled = false;
			rblRights6.Enabled = false;
		}
		private void EnableEditControls()
		{
			txtRoleName.Enabled = true;
			txtboxRoleDescription.Enabled = true;
			txtRemarks.Enabled = true;
			btnUpdate.Visible = true;
			btnUpdate.Enabled = true;
			btnCancel.Enabled = true;
			ddlStatus.Enabled = true;
			btnEdit.Visible = false;
		}
		private void EnableRbl()
		{
			rblRights1.Enabled = true;
			rblRights2.Enabled = true;
			rblRights3.Enabled = true;
			rblRights4.Enabled = true;
			rblRights5.Enabled = true;
			rblRights6.Enabled = true;
		}
		private void DisableRblLabel()
		{
			rblRightsLabel1.Visible = false;
			rblRightsLabel2.Visible = false;
			rblRightsLabel3.Visible = false;
			rblRightsLabel4.Visible = false;
			rblRightsLabel5.Visible = false;
			rblRightsLabel6.Visible = false;
		}
		#endregion

	}
}