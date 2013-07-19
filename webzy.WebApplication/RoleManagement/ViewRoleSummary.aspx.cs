using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.Utility.Encryption;
using webzy.BizModule.RoleManagement;
using System.Data;

namespace webzy.WebApplication.RoleManagement
{
	public partial class ViewRoleSummary : webbase
	{
		# region Variables
		LoginUser Current_User = new LoginUser();
		private const string AllRoleSort = "AllRoleSort";
		private const string AllRoleSortSearch = "AllRoleSortSearch";
		public const string AllRoleSortbyRole = "AllRoleSortbyRole";
		RoleHelper roleHelper = new RoleHelper();
		
		#endregion
		# region Load Control
		protected void Page_Load(object sender, EventArgs e)
		{
			Current_User = (LoginUser)Session["CurrentUser"];
			if (Current_User == null)
			{
				Response.Redirect("../Login.aspx");
			}
			if (!AccessRight(Current_User.Rights, "[Role]<0>"))
			{
				Response.Redirect("../Main.aspx?error=NoRights");
			}
			if (!Page.IsPostBack)
			{
				this.GetSearchQueryDef();
				loadRoleSummary();
			}
		}
		private void loadRoleSummary()
		{
			try
			{
				DataTable dtRoleSummary = new DataTable();

				dtRoleSummary = roleHelper.SearchRoleSummary(this.CreateAllRoleDataTable(), (string)ViewState[AllRoleSortSearch]);
				if (dtRoleSummary.Rows.Count > 0)
				{
					DataView dv = new DataView(dtRoleSummary);
					dv.Sort = ViewState[AllRoleSort].ToString();
					RoleViewSummary.DataSource = dv;
					RoleViewSummary.DataBind();
				}
				else
				{
					this.lblErrorMsg.Text = "No Role found.";
					this.NoDataGridView(RoleViewSummary);
				}
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Unable to load the Roles " + ex.Message.ToString() + "";
			}

		}
		#endregion
		# region Private Method
		private void GetSortDirection(string sortDirection, string column)
		{
			if (sortDirection != null)
			{
				string lastDirection = ViewState["SortDirection"] as string;
				if ((lastDirection != null) && (lastDirection == "Ascending"))
				{
					sortDirection = "DESC";
				}
			}
			ViewState["SortDirection"] = sortDirection;
			ViewState["SortExpression"] = column;
		}
		private void GetSearchQueryDef()
		{
			try
			{
				ViewState[AllRoleSortSearch] = roleHelper.GetRoleSearch(this.txtRoleName.Text, this.txtDescription.Text);
				ViewState[AllRoleSort] = "RoleId" + " " + DESCENDING_ORDER;

			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to get the Role Information : " + ex.InnerException.Message + "");
			}
		}
		private void NoDataGridView(GridView gv)
		{
			DataTable dt = new DataTable();
			gv.DataSource = dt;
			gv.DataBind();
			dt = null;
			if (gv.ID == "RoleViewSummary")
			{
				dt = CreateAllRoleDataTable();
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
			gv.Rows[0].Cells[0].Text = "No Records Found";
			gv.Rows[0].Visible = false;
		}
		private DataTable CreateAllRoleDataTable()
		{
			DataTable dtRoleSummary = new DataTable();
			DataColumn dcol = dtRoleSummary.Columns.Add("RoleId", typeof(System.Int32));
			dcol = dtRoleSummary.Columns.Add("RoleName", typeof(System.String));
			dcol = dtRoleSummary.Columns.Add("Description", typeof(System.String));
			return dtRoleSummary;
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
				lblErrorMsg.Text = ("Error In Sorting,Please Contact Support : " + ex.InnerException.Message + "");
			}
		}
		#endregion
		# region Page Event
		protected void RoleViewSummary_OnSorting(object sender, GridViewSortEventArgs e)
		{
			try
			{
				this.ChangeSortDetail(e.SortExpression.ToString(), e.SortDirection.ToString(), AllRoleSort);
				this.loadRoleSummary();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to Sort the Roles" + ex.Message + "");
			}
		}
		protected void RoleViewSummary_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
			RoleViewSummary.PageIndex = e.NewPageIndex;
			try
			{
				this.loadRoleSummary();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Error : " + ex.Message + "");
			}
		}
		protected void RoleViewSummary_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
		{
			try
			{
				int SelectedRow = e.NewSelectedIndex;
				GridViewRow row = RoleViewSummary.Rows[SelectedRow];
				int RoleId = Convert.ToInt32(row.Cells[1].Text.ToString().Trim());
				Response.Redirect("~/RoleManagement/EditRole.aspx?RoleId=" + RoleId + "");
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to Select the Role,: " + ex.Message + "");
			}
		}
		protected void btnSearch_Click(object sender, EventArgs e)
		{
			lblErrorMsg.Text = string.Empty;
			string RoleName = txtRoleName.Text.Trim();
			String Description = txtDescription.Text.Trim();
			ViewState[AllRoleSortSearch] = roleHelper.GetRoleSearch(RoleName, Description);
			this.loadRoleSummary();
		}
		protected void btnAddRole_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/RoleManagement/AddRole.aspx");
		}
		#endregion
	}
}