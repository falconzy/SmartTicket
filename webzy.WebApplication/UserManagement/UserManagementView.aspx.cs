using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.Utility.Encryption;
using webzy.BizModule.UserManagement;
using webzy.BizModule.Miscellaneous;
using System.Data;
using webzy.DataEntities;

namespace webzy.WebApplication
{
	public partial class UserManagementView : webbase
	{
		#region Variables
		private const string AllUserSortSearch = "AllUserSortSearch";
		private const string AllUserSort = "AllUserSort";
		EncryptionHelper encryptionHelper = new EncryptionHelper();
		LoginUser Current_User = new LoginUser();
		UserHelper userHelper = new UserHelper();
		ControlHelper controlHelper = new ControlHelper();
		#endregion
		#region Load Events
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
			if (!Page.IsPostBack)
			{
				this.GetSearchQueryDef();
				LoadControls();			
				loadUserSummary();
			}
		}

		private void LoadControls()
		{
			LoadStatus();
			LoadGroup();
			LoadRole();
		}

		private void LoadRole()
		{
			try
			{
				List<Role> RoleList = controlHelper.loadRole();
				Role RoleALL = new Role();
				RoleALL.Name = "ALL";
				RoleList.Insert(0, RoleALL);
				ddlRole.DataSource = RoleList;
				ddlRole.DataTextField = "Name";
				ddlRole.DataValueField = "Id";
				ddlRole.DataBind();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Role Cannot be loaded:  " + ex.Message.ToString() + "";
			}
		}

		private void LoadGroup()
		{
			try
			{
				List<Group> GroupList = controlHelper.loadGroup();
				Group GroupALL = new Group();
				GroupALL.GroupName = "ALL";
				GroupList.Insert(0, GroupALL);
				ddlGroup.DataSource = GroupList;
				ddlGroup.DataTextField = "GroupName";
				ddlGroup.DataValueField = "Id";
				ddlGroup.DataBind();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Group Cannot be loaded:  " + ex.Message.ToString() + "";
			}
		}

		private void LoadStatus()
		{
			try
			{
				ddlStatus.DataSource = controlHelper.loadSummaryStatus();
				ddlStatus.DataTextField = "StatusName";
				ddlStatus.DataValueField = "Id";
				ddlStatus.DataBind();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "StatusCannot be loaded:  " + ex.Message.ToString() + "";
			}
		}
		#endregion
		#region Private Events
		private void loadUserSummary()
		{
			try
			{
				DataTable dtUserSummary = new DataTable();

				dtUserSummary = userHelper.SearchUser(this.CreateAllUserDataTable(), (string)ViewState[AllUserSortSearch]);
				if (dtUserSummary.Rows.Count > 0)
				{
					DataView dv = new DataView(dtUserSummary);
					dv.Sort = ViewState[AllUserSort].ToString();
					UserViewSummary.DataSource = dv;
					UserViewSummary.DataBind();
				}
				else
				{
					this.lblErrorMsg.Text = "No Contact found.";
					this.NoDataGridView(UserViewSummary);
				}
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Unable to load the User Names : " + ex.Message.ToString() + "";
			}

		}
		private void NoDataGridView(GridView gv)
		{
			DataTable dt = new DataTable();
			gv.DataSource = dt;
			gv.DataBind();
			dt = null;
			if (gv.ID == "UserViewSummary")
			{
				dt = CreateAllUserDataTable();
			}
			dt.Rows.Add(dt.NewRow());
			gv.DataSource = dt;
			gv.DataBind();
			int columnsCount = gv.Columns.Count;
			gv.Rows[0].Cells.Clear();
			gv.Rows[0].Cells.Add(new TableCell());
			gv.Rows[0].Cells[0].ColumnSpan = columnsCount;
			gv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
			gv.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
			gv.Rows[0].Cells[0].Font.Bold = true;
			gv.Rows[0].Cells[0].Text = "No User Found";
			gv.Rows[0].Visible = false;
		}
		private DataTable CreateAllUserDataTable()
		{
			DataTable dtUserSummary = new DataTable();
			DataColumn dcol = dtUserSummary.Columns.Add("UserId", typeof(System.Int32));
			dcol = dtUserSummary.Columns.Add("LoginId", typeof(System.String));
			dcol = dtUserSummary.Columns.Add("Name", typeof(System.String));
			dcol = dtUserSummary.Columns.Add("Group", typeof(System.String));
			dcol = dtUserSummary.Columns.Add("Role", typeof(System.String));
			dcol = dtUserSummary.Columns.Add("Status", typeof(System.String));
			return dtUserSummary;
		}
		private void ChangeSortDetail(string sortExpression, string sortDirection, string viewStateName)
		{
			try
			{
				string sortdetail = ViewState[viewStateName].ToString();
				string sortE = string.Empty;
				string sortD = string.Empty;
				if (sortdetail.Contains(ASCENDING_ORDER))
				{
					sortD = ASCENDING_ORDER;
				}
				else
				{
					sortD = DESCENDING_ORDER;
				}
				sortE = (sortdetail.Remove(sortdetail.IndexOf(sortD))).Trim();

				if (sortExpression.Equals(sortE))
				{
					if (sortD.Equals(ASCENDING_ORDER))
						sortdetail = sortE + " " + DESCENDING_ORDER;
					else
						sortdetail = sortE + " " + ASCENDING_ORDER;
				}
				else
				{
					sortdetail = sortExpression + " " + ASCENDING_ORDER;
				}
				ViewState[viewStateName] = sortdetail;
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to Sort the User,Please Contact Support : " + ex.InnerException.Message + "");
			}
		}
		private void GetSearchQueryDef()
		{
			try
			{
				ViewState[AllUserSortSearch] = userHelper.GetUserSearchQuery(string.Empty, string.Empty, string.Empty, "ALL");
				ViewState[AllUserSort] = "UserId" + " " + DESCENDING_ORDER;

			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to Search the User : " + ex.InnerException.Message + "");
			}
		}
		private bool ValidateUI()
		{
			if (string.IsNullOrWhiteSpace(this.txtUserName.Text))
			{
				lblErrorMsg.Text = "Please enter User Name";
				return false;
			}
			return true;
		}
		#endregion
		#region PageEvents
		protected void UserViewSummary_OnSorting(object sender, GridViewSortEventArgs e)
		{
			try
			{
				this.ChangeSortDetail(e.SortExpression.ToString(), e.SortDirection.ToString(), AllUserSort);
				this.loadUserSummary();

			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to sort the User,Contact Support : " + ex.Message + "");
			}
		}
		protected void UserViewSummary_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
			UserViewSummary.PageIndex = e.NewPageIndex;
			try
			{
				this.loadUserSummary();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to select the User : " + ex.Message + "");
			}
		}
		protected void UserViewSummary_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
		{
			try
			{
				int SelectedRow = e.NewSelectedIndex;
				GridViewRow row = UserViewSummary.Rows[SelectedRow];
				int UserId = Convert.ToInt32(row.Cells[1].Text.ToString().Trim());
				Response.Redirect("~/UserManagement/EditUser.aspx?UserId=" + UserId + "");
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to Select the User : " + ex.Message + "");
			}
		}
		protected void btnSearch_Click(object sender, EventArgs e)
		{
			try
			{
				lblErrorMsg.Text = "";
				string UserName = txtUserName.Text.Trim();
				string Status = ddlStatus.SelectedItem.Text.ToString();
				string GroupName = ddlGroup.SelectedItem.Text.ToString();
				string RoleName = ddlRole.SelectedItem.Text.ToString();
				ViewState[AllUserSortSearch] = userHelper.GetUserSearchQuery(UserName, GroupName, RoleName,Status);
				this.loadUserSummary();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Unable to load the User Info : " + ex.Message.ToString() + "";
			}


		}
		protected void btnNewUser_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/UserManagement/AddUser.aspx");
		}
		#endregion
	}
}