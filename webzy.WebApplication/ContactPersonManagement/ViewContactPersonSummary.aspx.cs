using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.BizModule.ContactManagement;
using System.Data;
using webzy.BizModule.Miscellaneous;
using webzy.DataEntities;

namespace webzy.WebApplication.ContactPersonManagement
{
	public partial class ViewContactPersonSummary : webbase
	{
		#region Varibales
		private const string AllContactSearch = "AllContactSearch";
		private const string AllContactSort = "AllContactSort";
        ContactHelper contactHelper = new ContactHelper();
        ControlHelper controlHelper = new ControlHelper();
		LoginUser Current_User = new LoginUser();
		#endregion

		#region Load Events
		protected void Page_Load(object sender, EventArgs e)
		{
			Current_User = (LoginUser)Session["CurrentUser"];
			if (Current_User == null)
			{
				Response.Redirect("../Login.aspx");
			}
			else
			{
				if (!AccessRight(Current_User.Rights, "[Customer]<0>"))
				{
                    Response.Redirect("../Main.aspx?error=NoRights");
				}
				else
				{
					this.lblErrorMsg.Text = string.Empty;
				}				
			}
			if (!Page.IsPostBack)
			{
				this.GetSearchQueryDef();
                LoadStatus();
                LoadCustomer();
				loadContactPersonSummary();
			}
		}

        private void LoadCustomer()
        {
            try
            {
                ddlCustomer.DataSource = controlHelper.loadSummaryCustomer();
                ddlCustomer.DataTextField = "Name";
                ddlCustomer.DataValueField = "Id";
                ddlCustomer.DataBind();
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "Customer Cannot be loaded:  " + ex.Message.ToString() + "";
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
                lblErrorMsg.Text = "Customer Cannot be loaded:  " + ex.Message.ToString() + "";
            }
        }
	
		private void loadContactPersonSummary()
		{
			try
			{
				DataTable dtContactPersonSummary = new DataTable();
                dtContactPersonSummary = contactHelper.SearchContactPerson(this.CreateAllContactPersonDataTable(), (string)ViewState[AllContactSearch]);
				if (dtContactPersonSummary.Rows.Count > 0)
				{
					DataView dv = new DataView(dtContactPersonSummary);
					dv.Sort = ViewState[AllContactSort].ToString();
					ContactPersonSummaryView.DataSource = dv;
					ContactPersonSummaryView.DataBind();
				}
				else
				{
					this.lblErrorMsg.Text = "No Contact Person found.";
					this.NoDataGridView(ContactPersonSummaryView);
				}
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Unable to load the Contact Person Info  : " + ex.Message.ToString() + "";
			}

		}
		#endregion

		#region Page Events
		protected void ContactPersonSummaryView_OnSorting(object sender, GridViewSortEventArgs e)
		{
			try
			{
				this.ChangeSortDetail(e.SortExpression.ToString(), e.SortDirection.ToString(), AllContactSort);
				this.loadContactPersonSummary();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to Sort the Contact Person: " + ex.Message + "");
			}
		}


		protected void ContactPersonSummaryView_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
			ContactPersonSummaryView.PageIndex = e.NewPageIndex;
			try
			{
				this.loadContactPersonSummary();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = (" : " + ex.Message + "");
			}
		}

		private void NoDataGridView(GridView gv)
		{
			DataTable dt = new DataTable();
			gv.DataSource = dt;
			gv.DataBind();
			dt = null;
			if (gv.ID == "ContactPersonSummaryView")
			{
				dt = CreateAllContactPersonDataTable();
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
			gv.Rows[0].Cells[0].Text = "No Contact Person Found";
			gv.Rows[0].Visible = false;
		}
		private DataTable CreateAllContactPersonDataTable()
		{
			DataTable dtContactPersonSummary = new DataTable();
			DataColumn dcol = dtContactPersonSummary.Columns.Add("ContactPersonId", typeof(System.Int32));
			dcol = dtContactPersonSummary.Columns.Add("Name", typeof(System.String));
			dcol = dtContactPersonSummary.Columns.Add("Customer", typeof(System.String));
			dcol = dtContactPersonSummary.Columns.Add("HPNumber", typeof(System.String));
			dcol = dtContactPersonSummary.Columns.Add("OfficeNumber", typeof(System.String));
			dcol = dtContactPersonSummary.Columns.Add("EmailAddress", typeof(System.String));			
			dcol = dtContactPersonSummary.Columns.Add("Status", typeof(System.String));
			return dtContactPersonSummary;
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
				lblErrorMsg.Text = (" : " + ex.InnerException.Message + "");
			}
		}

		private void GetSearchQueryDef()
		{
			try
			{				
				ViewState[AllContactSearch] = contactHelper.GetContactPerson(string.Empty, string.Empty,"ALL","ALL");
				ViewState[AllContactSort] = "ContactPersonId" + " " + DESCENDING_ORDER;

			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = (" : " + ex.InnerException.Message + "");
			}
		}
		protected void ContactPersonSummaryView_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
		{
			try
			{
				int SelectedRow = e.NewSelectedIndex;
				GridViewRow row = ContactPersonSummaryView.Rows[SelectedRow];
				int ContactPersonId = Convert.ToInt32(row.Cells[1].Text.ToString().Trim());
                Response.Redirect("~/ContactPersonManagement/EditContactPerson.aspx?ContactId=" + ContactPersonId + "");
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to Select This ContactPerson: " + ex.Message + "");
			}
		}

		protected void btnSearch_Click(object sender, EventArgs e)
		{
			try
			{
				lblErrorMsg.Text = string.Empty;
                string ContactName = txtContactPersonName.Text.Trim();
                string EmailAddrss = txtContactPersonEmail.Text.Trim();
                string Status = ddlStatus.SelectedItem.Text.Trim();
                string Customer = ddlCustomer.SelectedItem.Text.Trim();
                ViewState[AllContactSearch] = contactHelper.GetContactPerson(ContactName, EmailAddrss,Customer, Status);
				this.loadContactPersonSummary();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Unable to load the Search Info  : " + ex.Message.ToString() + "";
			}


		}

        protected void btnAddContactPerson_Click(object sender, EventArgs e)
		{
            Response.Redirect("~/ContactPersonManagement/AddContactPerson.aspx");
		}


		#endregion

	}
}