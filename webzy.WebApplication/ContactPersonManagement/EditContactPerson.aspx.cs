using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.BizModule.ContactManagement;
using webzy.BizModule.Miscellaneous;
using webzy.DataEntities;

namespace webzy.WebApplication.ContactPersonManagement
{
	public partial class EditContactPerson : webbase
	{

        #region Variables
        LoginUser Current_User = new LoginUser();
        ContactHelper contactHelper = new ContactHelper();
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
            else
            {

            }
            {
                if (!AccessRight(Current_User.Rights, "[Customer]<0>"))
                {
                    Response.Redirect("../NoRights.aspx");
                }
                if (Request.QueryString["ContactId"] != null)
                {
                    ViewState["ContactId"] = Request.QueryString["ContactId"].ToString().Trim();
                }
            }
            if (!Page.IsPostBack)
            {
                LoadCustomer();
                LoadStatus();
                LoadContactPerson();
                DisableControls();
            }

        }
        private void LoadCustomer()
        {
            try
            {

                ddlCustomers.DataSource = controlHelper.loadCustomer();
                ddlCustomers.DataTextField = "Name";
                ddlCustomers.DataValueField = "Id";
                ddlCustomers.DataBind();
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


                ddlStatus.DataSource = controlHelper.loadStatus();
                ddlStatus.DataTextField = "StatusName";
                ddlStatus.DataValueField = "Id";
                ddlStatus.DataBind();
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "Customer Cannot be loaded:  " + ex.Message.ToString() + "";
            }
        }
        private void LoadContactPerson()
        {
            try
            {
                lblErrorMsg.Text = string.Empty;
                int ContactId = Convert.ToInt32(ViewState["ContactId"]);
                ContactPerson loadedContact = contactHelper.GetContactBy(ContactId);
                txtContactName.Text = loadedContact.Name;
                txtContactNo.Text = loadedContact.HPNumber;
                txtOfficeNo.Text = loadedContact.OfficeNumber;
                txtRemarks.Text = loadedContact.Remark;
                txtEmailAdd.Text = loadedContact.EmailAddress;
                ddlCustomers.SelectedValue = loadedContact.CustomerFk.ToString();
                ddlStatus.SelectedValue = loadedContact.StatusFk.ToString();
            }


            catch (Exception ex)
            {
                lblErrorMsg.Text = "Unable to load the Contact Information : " + ex.Message.ToString() + "";
            }
        }     
        #endregion

        #region Private Events
        private Boolean ValidateUI()
        {
            if (string.IsNullOrWhiteSpace(this.txtContactName.Text))
            {
                lblErrorMsg.Text = "Please enter Contact Name";
                return false;
            }

            return true;
        }
        private void DisableControls()
        {
            btnUpdate.Visible = false;
            txtContactName.Enabled = false;
            txtContactNo.Enabled = false;
            txtEmailAdd.Enabled = false;
            txtRemarks.Enabled = false;
            txtOfficeNo.Enabled = false;
            ddlCustomers.Enabled = false;
            ddlStatus.Enabled = false;
        }
        private void enableControls()
        {
            btnEdit.Visible = false;
            btnUpdate.Visible = true;
            btnCancel.Visible = true;
            ddlCustomers.Enabled = true;
            ddlStatus.Enabled = true;
            txtContactName.Enabled = true;
            txtContactNo.Enabled = true;
            txtEmailAdd.Enabled = true;
            txtOfficeNo.Enabled = true;
            txtRemarks.Enabled = true;
        }
        #endregion

        #region Page Events
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ContactPersonManagement/ViewContactPersonSummary.aspx?");
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (!AccessRight(Current_User.Rights, "[Customer]<2>"))
            {
                lblErrorMsg.Text = "Sorry, you have no rights to Edit this Contact Person.";
            }
            else
            {
                enableControls(); 
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            lblErrorMsg.Text = string.Empty;
            try
            {
                if (this.ValidateUI())
                {
                    ContactPerson Contactperson = new ContactPerson();
                    Contactperson.Id = Convert.ToInt32(ViewState["ContactId"]);
                    Contactperson.Name = txtContactName.Text.ToString().Trim();
                    Contactperson.EmailAddress = txtEmailAdd.Text.ToString().Trim();
                    Contactperson.CustomerFk = Convert.ToInt32(ddlCustomers.SelectedValue);
                    Contactperson.Remark = txtRemarks.Text;
                    Contactperson.HPNumber = txtContactNo.Text;
                    Contactperson.OfficeNumber = txtOfficeNo.Text;
                    Contactperson.ModifiedOn = DateTime.Now;
                    Contactperson.ModifiedBy = Current_User.Name;
                    Contactperson.StatusFk = Convert.ToInt32(ddlStatus.SelectedValue);

                    bool result = contactHelper.UpdateContact(Contactperson,ddlCustomers.SelectedItem.Text,ddlStatus.SelectedItem.Text);
                    if (result)
                    {
                        lblErrorMsg.Text = "Contact Updated Successfully";
                        DisableControls();
                    }
                    else
                    {
                        lblErrorMsg.Text = " Contact Person cannot be updated";
                    }
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "" + ex.Message.ToString() + "";
            }
        }
        #endregion
	}
}