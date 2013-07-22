using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.BizModule.CustomerManagement;
using webzy.BizModule.Miscellaneous;
using webzy.DataEntities;
using System.Data;

namespace webzy.WebApplication.CustomerManagement
{
	public partial class EditCustomer : webbase
	{
		# region Variables
		LoginUser Current_User = new LoginUser();
		CustomerHelper customerHelper = new CustomerHelper();
		ControlHelper controlHelper = new ControlHelper();
		private const string SiteSort = "SiteSort";
		#endregion

		# region Page Event
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
			if (Request.QueryString["CustomerId"] != null)
			{
				ViewState["CustomerId"] = Request.QueryString["CustomerId"].ToString().Trim();
				if (!IsPostBack)
				{
					int CustomerId = Convert.ToInt32(ViewState["CustomerId"].ToString().Trim());
					LoadControls();
					LoadCustomerDetails(CustomerId);
					disableControls();
				}
			}
			else
			{
				Response.Redirect("../CustomerManagement/CustomerManagementView.aspx");
			}

		}
	
		#endregion

		# region Private Method
		private void LoadControls()
		{
			LoadCountry();
			LoadCustomerStatus();
			LoadSiteStatus();
		}

		private void disableControls()
		{
			txtCustomerName.Enabled = false;
			ddlCustomerStatus.Enabled = false;
			GridViewSiteInfo.Enabled = false;
		}

		private void LoadCustomerDetails(int CustomerId)
		{
			LoadCustomerInfo(CustomerId);
			LoadSiteGridView();
		}
		
		private void LoadSiteGridView()
		{
			try
			{
				int CustomerId = Convert.ToInt32(ViewState["CustomerId"].ToString().Trim());
				DataTable dtSiteInfo = new DataTable();
				dtSiteInfo = customerHelper.SearchSiteInfo(this.CreateNewtblSite(), CustomerId);
				ViewState[SiteSort] = "SiteId" + " " + DESCENDING_ORDER;
				if (dtSiteInfo.Rows.Count > 0)
				{
					DataView dv = new DataView(dtSiteInfo);
					dv.Sort = ViewState[SiteSort].ToString();
					GridViewSiteInfo.DataSource = dv;
					GridViewSiteInfo.DataBind();
				}
				else
				{
					this.lblErrorMsg.Text = "No Customer found.";
					this.NoDataGridView(GridViewSiteInfo);
				}
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Unable to load the Customers " + ex.Message.ToString() + "";
			}
		}

		private void NoDataGridView(GridView gv)
		{
			DataTable dt = new DataTable();
			gv.DataSource = dt;
			gv.DataBind();
			dt = null;
			if (gv.ID == "GridViewSiteInfo")
			{
				dt = CreateNewtblSite();
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

		private DataTable CreateNewtblSite()
		{
			DataTable NewtbleSite = new DataTable();
			DataColumn dcol = NewtbleSite.Columns.Add("SiteId", typeof(System.Int32));
			dcol = NewtbleSite.Columns.Add("SiteName", typeof(System.String));
			dcol = NewtbleSite.Columns.Add("SiteAddress", typeof(System.String));
			dcol = NewtbleSite.Columns.Add("Status", typeof(System.String));
			return NewtbleSite;
		}

		private void LoadCustomerInfo(int CustomerId)
		{
			Customer customer = customerHelper.GetCustomerBy(CustomerId);
			txtCustomerName.Text = customer.Name.ToString().Trim();
			ddlCustomerStatus.SelectedValue = customer.StatusFk.Value.ToString();	
		}

		private void LoadSiteStatus()
		{
			try
			{
				ddlSiteStatus.DataSource = controlHelper.loadStatus();
				ddlSiteStatus.DataTextField = "StatusName";
				ddlSiteStatus.DataValueField = "Id";
				ddlSiteStatus.DataBind();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Site Status Cannot be loaded:  " + ex.Message.ToString() + "";
			}
		}

		private void LoadCustomerStatus()
		{
			try
			{
				ddlCustomerStatus.DataSource = controlHelper.loadStatus();
				ddlCustomerStatus.DataTextField = "StatusName";
				ddlCustomerStatus.DataValueField = "Id";
				ddlCustomerStatus.DataBind();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Customer Status Cannot be loaded:  " + ex.Message.ToString() + "";
			}
		}

		private void LoadCountry()
		{
			try
			{
				ddlCountry.DataSource = controlHelper.loadCountry();
				ddlCountry.DataTextField = "CountryName";
				ddlCountry.DataValueField = "Id";
				ddlCountry.DataBind();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Group Cannot be loaded:  " + ex.Message.ToString() + "";
			}
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

		private void LoadSitePanel(int SiteId)
		{
			SiteView SiteInfo = customerHelper.GetSiteInfoBy(SiteId);
			txtSiteName.Text = SiteInfo.SiteName;
			txtSiteAddress.Text = SiteInfo.SiteAddress.ToString();
			ddlCountry.SelectedValue = SiteInfo.CountryFk.ToString();
			ddlSiteStatus.SelectedValue = SiteInfo.SiteStatusId.ToString();
			ShowSitePanel(SiteId);
		}

		private void ShowSitePanel(int SiteId)
		{
			SiteInfoPannel.Visible = true;
			SiteInfoPannel.CssClass = "PopupBox";
			backgroudContact.Visible = true;
			backgroudContact.CssClass = "Popup_background_Pannel";
			if (ViewState["UpdateSiteId"] != null)
			{
				ViewState["UpdateSiteId"] = null;
			}
			ViewState["UpdateSiteId"] = SiteId;
		}
		
		private void HideSiteInfoPanel()
		{
			SiteInfoPannel.Visible = false;
			SiteInfoPannel.CssClass = "";
			backgroudContact.Visible = false;
			backgroudContact.CssClass = "";
			ViewState["UpdateSiteId"] = null;
		}

		private bool ValidateUI()
		{
			if (string.IsNullOrWhiteSpace(this.txtSiteAddress.Text))
			{
				lblSiteErrorMsg.Text = "Please enter the site address";
				return false;
			}
			else
			{
				return true;
			}
		}

		private bool ValidateCustomerUI()
		{
			if (string.IsNullOrWhiteSpace(txtCustomerName.Text))
			{
				lblErrorMsg.Text = "Please enter the Customer name";
				return false;
			}
			return true;
		}

		#endregion

		# region Page Event
		protected void GridViewSiteInfo_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
		{
			try
			{
				int SelectedRow = e.NewSelectedIndex;
				GridViewRow row = GridViewSiteInfo.Rows[SelectedRow];
				int SiteId = Convert.ToInt32(row.Cells[1].Text.ToString().Trim());
				LoadSitePanel(SiteId);
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to Select the Customer,: " + ex.Message + "");
			}
		}

		protected void GridViewSiteInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
			GridViewSiteInfo.PageIndex = e.NewPageIndex;
			try
			{
				this.LoadSiteGridView();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Error : " + ex.Message + "");
			}
		}

		protected void btnSiteUpdate_Click(object sender, EventArgs e)
		{
			try
			{
				if (ValidateUI())
				{
					int SiteId = Convert.ToInt32(ViewState["UpdateSiteId"].ToString().Trim());
					string SiteName = (txtSiteName.Text.Length > 0) ? txtSiteName.Text.ToString().Trim() : string.Empty;
					string SiteAddress = txtSiteAddress.Text;
					int CountryFk = Convert.ToInt32(ddlCountry.SelectedValue);
					int SiteStatus = Convert.ToInt32(ddlSiteStatus.SelectedValue);
					int CustomerFK = Convert.ToInt32(ViewState["CustomerId"].ToString().Trim());
					customerHelper.updateSite(SiteId,CustomerFK, CountryFk, SiteName, SiteAddress, SiteStatus, Current_User.Name, txtCustomerName.Text, ddlCountry.SelectedItem.Text, ddlSiteStatus.SelectedItem.Text);
					lblErrorMsg.Text = " Site update succesfully.";
					HideSiteInfoPanel();
				}
				LoadSiteGridView();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to update the site details" + ex.Message + "");
			}
		}

		protected void btnCustomerUpdate_Click(object sender, EventArgs e)
		{
			if(ValidateCustomerUI())
			{
				string CustomerName = txtCustomerName.Text.ToString().Trim();
				int CustomerId =  Convert.ToInt32(ViewState["CustomerId"].ToString().Trim());
				if (customerHelper.duplicateUpdateNames(CustomerName))
				{
					lblErrorMsg.Text = "Customer Name already exsit in database.";
					return;
				}
				int statusId = Convert.ToInt32(ddlCustomerStatus.SelectedValue);
				customerHelper.updateCustomer(CustomerId, CustomerName, statusId, Current_User.Name, ddlCustomerStatus.SelectedItem.Text);
				lblErrorMsg.Text = "Update Customer successfully.";
				disableControls();
			}
		}

		

		protected void GridViewSiteInfo_Sorting(object sender, GridViewSortEventArgs e)
		{
			try
			{
				this.ChangeSortDetail(e.SortExpression.ToString(), e.SortDirection.ToString(), SiteSort);
				this.LoadSiteGridView();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to Sort the Customers" + ex.Message + "");
			}
		}

		protected void btnEdit_Click(object sender, EventArgs e)
		{
			if (AccessRight(Current_User.Rights, "[Customer]<2>"))
			{
				txtCustomerName.Enabled = true;
				ddlCustomerStatus.Enabled = true;
				GridViewSiteInfo.Enabled = true;
				btnCustomerUpdate.Visible = true;
				btnEdit.Visible = false;
			}
			else
			{
				lblErrorMsg.Text = "Sorry, You do not have rights to edit this customer";
			}
		}

		protected void btnSiteCancel_Click(object sender, EventArgs e)
		{
			HideSiteInfoPanel();
		}

		protected void btnCancel_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/CustomerManagement/CustomerManagementView.aspx");
		}

		#endregion		

	}
}