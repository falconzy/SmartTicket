using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.BizModule.ContactManagement;
using webzy.BizModule.Miscellaneous;

namespace webzy.WebApplication.ContactPersonManagement
{
    public partial class AddContactPerson : webbase
    {
        #region Variables
        ContactHelper contactHelper = new ContactHelper();
        LoginUser Current_User = new LoginUser();
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
                if (!AccessRight(Current_User.Rights, "[Customer]<1>"))
                {
                    Response.Redirect("../Main.aspx?error=NoRights");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        LoadCustomer();
                    }
                }
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

        private bool ValidateUI()
        {
            if (string.IsNullOrWhiteSpace(this.txtContactName.Text))
            {
                lblErrorMsg.Text = "Please enter the Contact Person Name";
                return false;
            }
            return true;
        }
        #endregion

        #region Page Events
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ContactPersonManagement/ViewContactPersonSummary.aspx?");
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            lblErrorMsg.Text = string.Empty;
            int CustomerFk;
            string Name, HPNumber, OfficeNumber, EmailAddress, CustomerName,Remark;
            try
            {
                if (this.ValidateUI())
                {
                    if (contactHelper.DuplicateContactName(txtContactName.Text.Trim()))
                    {
                        lblErrorMsg.Text = "Contact person exisits.";
                    }
                    else
                    {
                       
                        Name = txtContactName.Text.ToString().Trim();
                        CustomerFk = Convert.ToInt32(ddlCustomers.SelectedValue);
                        CustomerName = ddlCustomers.SelectedItem.Text.ToString().Trim();
                        HPNumber = txtContactNo.Text;
                        OfficeNumber = txtOfficeNo.Text;
                        EmailAddress = txtEmailAdd.Text.ToString().Trim();
                        Remark = txtRemarks.Text;
                        bool result = contactHelper.AddContactPerson(Name, HPNumber, OfficeNumber, EmailAddress, CustomerName,CustomerFk, Remark,Current_User.Name,ActiveId,Active);
                        if (result)
                        {
                            Response.Redirect("~/ContactPersonManagement/ViewContactPersonSummary.aspx");
                        }
                        else
                        {
                            lblErrorMsg.Text = " Contact Person cannot be Added";
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "Contact Person Cannot be Added" + ex.Message.ToString() + "";
            }
        }

        #endregion
    }
}