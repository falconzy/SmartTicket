using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.BizModule.CustomerManagement;
using System.Data;
using webzy.BizModule.Miscellaneous;

namespace webzy.WebApplication.CustomerManagement
{
	public partial class CustomerManagementView : webbase
	{
		# region Variables
		LoginUser Current_User = new LoginUser();
		private const string AllCustomerSearch = "AllCustomerSearch";
		private const string AllCustomerSort = "AllCustomerSort";
		CustomerHelper customerHelper = new CustomerHelper();
		ControlHelper controlHelper = new ControlHelper();

		#endregion
		# region Load Control
		protected void Page_Load(object sender, EventArgs e)
		{
			Current_User = (LoginUser)Session["CurrentUser"];
			if (Current_User == null)
			{
				Response.Redirect("../Login.aspx");
			}
			if (!AccessRight(Current_User.Rights, "[Customer]<0>"))
			{
				Response.Redirect("../Main.aspx?error=NoRights");
			}
			if (!Page.IsPostBack)
			{
				this.GetSearchQueryDef();
				LoadStatus();
				loadCustomerSummary();
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
		private void loadCustomerSummary()
		{
			try
			{
				DataTable dtCustomerSummary = new DataTable();
				dtCustomerSummary = customerHelper.SearchCustomerSummary(this.CreateAllCustomerDataTable(), (string)ViewState[AllCustomerSearch]);
				if (dtCustomerSummary.Rows.Count > 0)
				{
					DataView dv = new DataView(dtCustomerSummary);
					dv.Sort = ViewState[AllCustomerSort].ToString();
					CustomerViewSummary.DataSource = dv;
					CustomerViewSummary.DataBind();
				}
				else
				{
					this.lblErrorMsg.Text = "No Customer found.";
					this.NoDataGridView(CustomerViewSummary);
				}
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Unable to load the Customers " + ex.Message.ToString() + "";
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
				ViewState[AllCustomerSearch] = customerHelper.GetCustomerSearch(string.Empty, "ALL");
				ViewState[AllCustomerSort] = "CustomerId" + " " + DESCENDING_ORDER;
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to get the Customer Information : " + ex.InnerException.Message + "");
			}
		}
		private void NoDataGridView(GridView gv)
		{
			DataTable dt = new DataTable();
			gv.DataSource = dt;
			gv.DataBind();
			dt = null;
			if (gv.ID == "CustomerViewSummary")
			{
				dt = CreateAllCustomerDataTable();
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
		private DataTable CreateAllCustomerDataTable()
		{
			DataTable dtCustomerSummary = new DataTable();
			DataColumn dcol = dtCustomerSummary.Columns.Add("CustomerId", typeof(System.Int32));
			dcol = dtCustomerSummary.Columns.Add("CustomerName", typeof(System.String));
			dcol = dtCustomerSummary.Columns.Add("CreatedBy", typeof(System.String));
			dcol = dtCustomerSummary.Columns.Add("ModifiedBy", typeof(System.String));
			dcol = dtCustomerSummary.Columns.Add("ModifiedOn", typeof(System.String));
			dcol = dtCustomerSummary.Columns.Add("Status", typeof(System.String));
			return dtCustomerSummary;
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
		protected void CustomerViewSummary_OnSorting(object sender, GridViewSortEventArgs e)
		{
			try
			{
				this.ChangeSortDetail(e.SortExpression.ToString(), e.SortDirection.ToString(), AllCustomerSort);
				this.loadCustomerSummary();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to Sort the Customers" + ex.Message + "");
			}
		}
		protected void CustomerViewSummary_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
			CustomerViewSummary.PageIndex = e.NewPageIndex;
			try
			{
				this.loadCustomerSummary();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Error : " + ex.Message + "");
			}
		}
		protected void CustomerViewSummary_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
		{
			try
			{
				int SelectedRow = e.NewSelectedIndex;
				GridViewRow row = CustomerViewSummary.Rows[SelectedRow];
				int CustomerId = Convert.ToInt32(row.Cells[1].Text.ToString().Trim());
				Response.Redirect("~/CustomerManagement/EditCustomer.aspx?CustomerId=" + CustomerId + "");
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to Select the Customer,: " + ex.Message + "");
			}
		}
		protected void btnSearch_Click(object sender, EventArgs e)
		{
			lblErrorMsg.Text = string.Empty;
			string CustomerName = txtCustomerName.Text.Trim();
			string Status = ddlStatus.SelectedItem.Text.ToString().Trim();
			ViewState[AllCustomerSearch] = customerHelper.GetCustomerSearch(CustomerName, Status);
			this.loadCustomerSummary();
		}
		protected void btnAddCustomer_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/CustomerManagement/AddCustomer.aspx");
		}
		#endregion

		
	}
}