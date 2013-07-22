using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.BizModule.CustomerManagement;
using webzy.BizModule.Miscellaneous;
using System.Data;

namespace webzy.WebApplication.CustomerManagement
{
	public partial class AddCustomer : webbase
	{	
		# region Variables
		LoginUser Current_User = new LoginUser();
		CustomerHelper customerHelper = new CustomerHelper();
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
			if (!AccessRight(Current_User.Rights, "[Customer]<1>"))
			{
				Response.Redirect("../Main.aspx?error=NoRights");
			}
			if (!IsPostBack)
			{
				LoadCountry();
			}
		}
		protected void btnInsertSite_Click(object sender, EventArgs e)
		{
			try
			{

				lblSiteErrorMsg.Text = string.Empty;
				if (ValidateSiteUI())
				{
					string SiteName = (txtSiteName.Text.Length > 0) ? txtSiteName.Text.ToString().Trim() : string.Empty;
					string SiteAddress = txtSiteAddress.Text;					
					int CountryFk = Convert.ToInt32(ddlCountry.SelectedValue);
					DataTable SiteInfo = new DataTable();
					if (ViewState["tblSite"] != null)
					{
						SiteInfo = (DataTable)ViewState["tblSite"];
						SiteInfo.Rows.Add(CountryFk, SiteName, SiteAddress);
						ViewState["tblSite"] = SiteInfo;
					}
					else
					{
						SiteInfo = CreateNewtblSite(CountryFk, SiteName, SiteAddress);
						ViewState["tblSite"] = SiteInfo;
					}
					LoadSiteGridView();
					CleanUpSiteEntery();
				}
			}
			catch (Exception ex)
			{
				lblSiteErrorMsg.Text = "Error Occurs during adding site information, error message " + ex.Message + ""; 
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
		protected void GridViewSiteInfo_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
		{
			try
			{
				int SelectedRow = e.NewSelectedIndex;
				GridViewRow row = GridViewSiteInfo.Rows[SelectedRow];
				string Address = row.Cells[2].Text.ToString().Trim();
				string Name = row.Cells[1].Text.ToString().Trim();
				DataTable SiteInfo = (DataTable)ViewState["tblSite"];
				for (int i = SiteInfo.Rows.Count - 1; i >= 0; i--)
				{
					DataRow dr = SiteInfo.Rows[i];
					if (dr["SiteAddress"].ToString().Trim() == Address && dr["SiteName"].ToString().Trim() == Name)
					{
						dr.Delete();
						ViewState["tblSite"] = SiteInfo;
						break;
					}
				}
				this.LoadSiteGridView();
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = ("Unable to Select the Site : " + ex.Message + "");
			}

		}
		protected void btnAdd_Click(object sender, EventArgs e)
		{
			try
			{
				if (ValidateCustomerUI())
				{
					string CustomerName = txtCustomerName.Text.ToString().Trim();
					if (customerHelper.duplicateNames(CustomerName))
					{
						lblErrorMsg.Text = "Customer Name already exsit in database.";
					}
					else
					{
						int CustomerId = customerHelper.InsertCustomer(CustomerName, Current_User.Name, Current_User.Id, ActiveId,Active);
						if (CustomerId > 0)
						{
							DataTable SiteDetails = (DataTable)ViewState["tblSite"];
							for (int i = SiteDetails.Rows.Count - 1; i >= 0; i--)
							{
								DataRow dr = SiteDetails.Rows[i];
								string SiteAddress = dr["SiteAddress"].ToString().Trim();
								string SiteName = dr["SiteName"].ToString().Trim();
								int CountryId = Convert.ToInt32(dr["CountryId"].ToString().Trim());
								string CountryName = controlHelper.GetCountryNameBy(CountryId);
								customerHelper.InsertSite(CustomerId,CustomerName, SiteName, SiteAddress, CountryId,CountryName, ActiveId, Active,Current_User.Name);
								lblErrorMsg.Text = "Site Add succussfully.";
							}
						}
						else
						{
							throw new Exception("Fail to add customer");
						}
					}
				}
			}
			catch (Exception ex)
			{
				lblErrorMsg.Text = "Error occurs during adding customer information, error message " + ex.Message + "";
			}
		}
		#endregion

		# region Private Method
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
		private void LoadSiteGridView()
		{
			DataTable SiteInfo = (DataTable)ViewState["tblSite"];
			DataView dv = new DataView(SiteInfo);
			GridViewSiteInfo.DataSource = dv;
			GridViewSiteInfo.DataBind();

		}
		private DataTable CreateNewtblSite(int CountryFk, string SiteName, string SiteAddress)
		{
			DataTable NewtbleSite = new DataTable();
			DataColumn dcol = NewtbleSite.Columns.Add("CountryId", typeof(System.Int32));
			dcol = NewtbleSite.Columns.Add("SiteName", typeof(System.String));
			dcol = NewtbleSite.Columns.Add("SiteAddress", typeof(System.String));
			NewtbleSite.Rows.Add(CountryFk, SiteName, SiteAddress);
			return NewtbleSite;
		}
		private bool ValidateSiteUI()
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
			if (ViewState["tblSite"] != null)
			{
				DataTable SiteInfo = (DataTable)ViewState["tblSite"];
				if (!(SiteInfo.Rows.Count > 0))
				{
					lblErrorMsg.Text = "Please enter the site information";
					return false;
				}
			}
			if (string.IsNullOrWhiteSpace(txtCustomerName.Text))
			{
				lblErrorMsg.Text = "Please enter the Customer name";
				return false;
			}
			return true;
		}
		private void CleanUpSiteEntery()
		{
			txtSiteName.Text = string.Empty;
			txtSiteAddress.Text = string.Empty;
			LoadCountry();
		}
		#endregion



	

	
	}
}