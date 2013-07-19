using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using webzy.DataEntities;
using System.Data;
using System.Data.Entity.Infrastructure;

namespace webzy.BizModule.CustomerManagement
{
	public class CustomerHelper
	{
		# region Add Customer Page

		public bool duplicateNames(string CustomerName)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					var Customer = from u in ctx.Customers where u.Name == CustomerName select u;
					if (Customer.Count() > 0)
					{
						return true;
					}
				}
				return false;
			}
			catch (Exception ex)
			{
				throw new Exception("Problem in Checking Customer Name info:" + ex.Message + "");

			}
		}

		public int InsertCustomer(string CustomerName, string UserName, int UserID, int ActiveId, string Active)
		{
			try
			{

				using (webzyEntities ctx = new webzyEntities())
				{
					Customer NewCustomer = new Customer();
					NewCustomer.Name = CustomerName;
					NewCustomer.StatusFk = ActiveId;
					NewCustomer.CreatedByFk = UserID;
					NewCustomer.ModifiedBy = UserName;
					NewCustomer.ModifiedOn = DateTime.Now;

					ctx.Customers.Add(NewCustomer);
					ctx.SaveChanges();
					if (NewCustomer.Id > 0)
					{
						CustomerLog NewCustomerLog = new CustomerLog();
						NewCustomerLog.Name = NewCustomer.Name;
						NewCustomerLog.Status = Active;
						NewCustomerLog.CreatedBy = UserName;
						NewCustomerLog.ModifiedBy = UserName;
						NewCustomer.ModifiedOn = DateTime.Now;

						ctx.CustomerLogs.Add(NewCustomerLog);
						ctx.SaveChanges();
					}
					return NewCustomer.Id;
				}
			}
			catch (Exception ex)
			{
				throw new Exception("Problem in add in new Customer info:" + ex.Message + "");

			}
		}

		public void InsertSite(int CustomerId, string CustomerName, string SiteName, string SiteAddress, int CountryId,string CountryName, int ActiveId, string Active, string UserName)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					Site Newsite = new Site();
					Newsite.SiteName = SiteName;
					Newsite.CustomerFk = CustomerId;
					Newsite.CountryFk = CountryId;
					Newsite.Address = SiteAddress;
					Newsite.StatusFk = ActiveId;
					Newsite.ModifiedBy = UserName;
					Newsite.ModifiedOn = DateTime.Now;
					ctx.Sites.Add(Newsite);
					ctx.SaveChanges();
					if (Newsite.Id > 0)
					{
						SiteLog NewSiteLog = new SiteLog();
						NewSiteLog.SiteName = SiteName;
						NewSiteLog.CustomerName = CustomerName;
						NewSiteLog.Country = CountryName;
						NewSiteLog.Address = SiteAddress;
						NewSiteLog.Status = Active;
						NewSiteLog.ModifiedBy = UserName;
						NewSiteLog.ModifiedOn = DateTime.Now;

						ctx.SiteLogs.Add(NewSiteLog);
						ctx.SaveChanges();
					}
				}
			}
			catch (Exception ex)
			{
				throw new Exception("Problem in add  site info:" + ex.Message + "");
			}
		}

		#endregion

		# region Customer Summary Page
		public DataTable SearchCustomerSummary(DataTable CustomerLists, string command)
		{
			try
			{
				List<CustomerView> Customers = new List<CustomerView>();
				using (webzyEntities ctx = new webzyEntities())
				{
					var objectContext = (ctx as IObjectContextAdapter).ObjectContext;
					Customers = objectContext.ExecuteStoreQuery<CustomerView>(command).ToList();
					foreach (CustomerView CustomerInfo in Customers)
					{
						CustomerLists.Rows.Add(CustomerInfo.CustomerId, CustomerInfo.CustomerName, CustomerInfo.CreatedBy, CustomerInfo.ModifiedBy, CustomerInfo.ModifiedOn, CustomerInfo.CustomerStatus);
					}
					return CustomerLists;
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
			
		}

		public string GetCustomerSearch(string CustomerName, string CustomerStatus)
		{
			String command = @"SELECT * FROM CustomerView ";
			if ((!(string.IsNullOrWhiteSpace(CustomerName))) || (!(string.IsNullOrWhiteSpace(CustomerStatus))))
			{
				command += "where ";
				if (((!(string.IsNullOrWhiteSpace(CustomerName)))) && !(string.IsNullOrWhiteSpace(CustomerStatus)) && CustomerStatus.ToUpper() != "ALL")
				{
					command += " CustomerName like '%" + CustomerName + "%'" + "AND CustomerStatus like '%" + CustomerStatus + "%' AND ";
				}
				else if (!(string.IsNullOrWhiteSpace(CustomerName)))
				{
					command += " CustomerName like '%" + CustomerName + "%' AND ";
				}
				else if (!(string.IsNullOrWhiteSpace(CustomerStatus)) && CustomerStatus.ToUpper() != "ALL")
				{
					command += " CustomerStatus like '%" + CustomerStatus + "%' AND ";
				}
				if (command.Trim().Substring((command.Trim().Length) - 5).ToUpper().Equals("WHERE"))
				{
					command = command.Trim().Substring(0, (command.Trim().Length) - 5);
				}
				if (command.Trim().Substring((command.Trim().Length) - 3).ToUpper().Equals("AND"))
				{
					command = command.Trim().Substring(0, (command.Trim().Length) - 3);
				}

			}
			return command;
		}

		#endregion	
	
		# region Edit Customer Page
		public Customer GetCustomerBy(int CustomerId)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					var Cust = (from c in ctx.Customers where c.Id == CustomerId select c).SingleOrDefault();
					return Cust;
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		public DataTable SearchSiteInfo(DataTable SiteLists, int CustomerId)
		{
			try
			{
				List<SiteView> Sites = new List<SiteView>();
				using (webzyEntities ctx = new webzyEntities())
				{
					Sites = (from c in ctx.SiteViews where c.CustomerId == CustomerId select c).ToList();
					foreach (SiteView SiteInfo in Sites)
					{
						SiteLists.Rows.Add(SiteInfo.SiteId, SiteInfo.SiteName, SiteInfo.SiteAddress, SiteInfo.SiteStatus);
					}
					return SiteLists;
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		public SiteView GetSiteInfoBy(int SiteId)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					var SiteInfo = (from c in ctx.SiteViews where c.SiteId == SiteId select c).SingleOrDefault();
					return SiteInfo;
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		#endregion







		
	}
}
