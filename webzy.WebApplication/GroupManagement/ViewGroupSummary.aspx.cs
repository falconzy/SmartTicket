using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webzy.WebApplication.Miscellaneous;
using webzy.BizModule.GroupManagement;
using webzy.BizModule.Miscellaneous;
using System.Data;

namespace webzy.WebApplication.GroupManagement
{
    public partial class ViewGroupSummary : webbase
    {
        #region Variables
        private const string AllGroupSortSearch = "AllGroupSortSearch";
        private const string AllGroupSort = "AllGroupSort";
        LoginUser Current_User = new LoginUser();
        GroupHelper groupHelper = new GroupHelper();
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
            if (!AccessRight(Current_User.Rights, "[Group]<0>"))
            {
                Response.Redirect("../Main.aspx?error=NoRights");
            }
            if (!Page.IsPostBack)
            {
                this.GetSearchQueryDef();
                LoadStatus();
                loadGroupSummary();
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
        private void loadGroupSummary()
        {
            try
            {
                DataTable dtGroupSummary = new DataTable();

                dtGroupSummary = groupHelper.SearchGroup(this.CreateAllGroupDataTable(), (string)ViewState[AllGroupSortSearch]);
                if (dtGroupSummary.Rows.Count > 0)
                {
                    DataView dv = new DataView(dtGroupSummary);
                    dv.Sort = ViewState[AllGroupSort].ToString();
                    GroupViewSummary.DataSource = dv;
                    GroupViewSummary.DataBind();
                }
                else
                {
                    this.lblErrorMsg.Text = "No Group found.";
                    this.NoDataGridView(GroupViewSummary);
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "Unable to load the Group : " + ex.Message.ToString() + "";
            }

        }
        private void NoDataGridView(GridView gv)
        {
            DataTable dt = new DataTable();
            gv.DataSource = dt;
            gv.DataBind();
            dt = null;
            if (gv.ID == "GroupViewSummary")
            {
                dt = CreateAllGroupDataTable();
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
            gv.Rows[0].Cells[0].Text = "No Group Found";
            gv.Rows[0].Visible = false;
        }
        private DataTable CreateAllGroupDataTable()
        {
            DataTable dtGroupSummary = new DataTable();
            DataColumn dcol = dtGroupSummary.Columns.Add("GroupId", typeof(System.Int32));
            dcol = dtGroupSummary.Columns.Add("GroupName", typeof(System.String));
            dcol = dtGroupSummary.Columns.Add("ViewAbleByCustomer", typeof(System.String));
            dcol = dtGroupSummary.Columns.Add("Status", typeof(System.String));
            return dtGroupSummary;
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
                lblErrorMsg.Text = ("Unable to Sort the Group,Please Contact Support : " + ex.InnerException.Message + "");
            }
        }
        private void GetSearchQueryDef()
        {
            try
            {
				ViewState[AllGroupSortSearch] = groupHelper.GetGroupSearchQuery(string.Empty, "ALL");
                ViewState[AllGroupSort] = "GroupId" + " " + DESCENDING_ORDER;

            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ("Unable to Search the Group : " + ex.InnerException.Message + "");
            }
        }
        #endregion
        #region PageEvents
        protected void GroupViewSummary_OnSorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                this.ChangeSortDetail(e.SortExpression.ToString(), e.SortDirection.ToString(), AllGroupSort);
                this.loadGroupSummary();

            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ("Unable to sort the Group,Contact Support : " + ex.Message + "");
            }
        }
        protected void GroupViewSummary_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GroupViewSummary.PageIndex = e.NewPageIndex;
            try
            {
                this.loadGroupSummary();
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ("Unable to select the Group : " + ex.Message + "");
            }
        }
        protected void GroupViewSummary_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            try
            {
                int SelectedRow = e.NewSelectedIndex;
                GridViewRow row = GroupViewSummary.Rows[SelectedRow];
                int GroupId = Convert.ToInt32(row.Cells[1].Text.ToString().Trim());
                Response.Redirect("~/GroupManagement/EditGroup.aspx?GroupId=" + GroupId + "");
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ("Unable to Select the Group : " + ex.Message + "");
            }
        }
        protected void btnGroupSearch_Click(object sender, EventArgs e)
        {
            try
            {
                lblErrorMsg.Text = "";
                string GroupName = txtGroupName.Text.Trim();
                string Status = ddlStatus.SelectedItem.Text.ToString();
                ViewState[AllGroupSortSearch] = groupHelper.GetGroupSearchQuery(GroupName, Status);
                this.loadGroupSummary();
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "Unable to load the Group Info : " + ex.Message.ToString() + "";
            }


        }
        protected void btnGroupAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GroupManagement/AddGroup.aspx");
        }
        #endregion
    }
}