using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using webzy.DataEntities;
using System.Text.RegularExpressions;

namespace webzy.BizModule.Miscellaneous
{
	public class ControlHelper
	{

		public List<Status> loadSummaryStatus()
		{
			try
			{
				List<Status> dtStatus = new List<Status>();
				using (webzyEntities ctx = new webzyEntities())
				{
					dtStatus = (from c in ctx.Status
								orderby c.StatusName ascending
								select c).ToList<Status>();
				}
				Status status = new Status();
				status.StatusName = "ALL";
				dtStatus.Insert(0, status);
				return dtStatus;
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message.ToString());
			}
		}

		public List<Status> loadStatus()
		{
			try
			{
				List<Status> dtStatus = new List<Status>();
				using (webzyEntities ctx = new webzyEntities())
				{
					dtStatus = (from c in ctx.Status
								orderby c.StatusName ascending
								select c).ToList<Status>();
				}
				return dtStatus;
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message.ToString());
			}
		}

		public bool CheckEmailFormat(string email)
		{
			bool correctFormat = false;

			Regex rg = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
			Match mt = rg.Match(email);

			if (mt.Success)
			{
				correctFormat = true;
			}
			return correctFormat;
		}

		public List<webzy.DataEntities.Group> loadGroup()
		{
			try
			{
				List<webzy.DataEntities.Group> dtGroup = new List<webzy.DataEntities.Group>();
				using (webzyEntities ctx = new webzyEntities())
				{
					dtGroup = (from c in ctx.Groups
								orderby c.GroupName ascending
							   select c).ToList<webzy.DataEntities.Group>();
				}
				return dtGroup;
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message.ToString());
			}
		}

		public List<Role> loadRole()
		{
			try
			{
				List<Role> dtRole = new List<Role>();
				using (webzyEntities ctx = new webzyEntities())
				{
					dtRole = (from c in ctx.Roles
								orderby c.Name ascending
								select c).ToList<Role>();
				}
				return dtRole;
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message.ToString());
			}
		}

		public List<Country> loadCountry()
		{
			try
			{
				List<Country> dtCountry = new List<Country>();
				using (webzyEntities ctx = new webzyEntities())
				{
					dtCountry = (from c in ctx.Countries
							  orderby c.Id ascending
								 select c).ToList <Country>();
				}
				return dtCountry;
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message.ToString());
			}
		}

		public string GetCountryNameBy(int countryId)
		{
			try
			{
				using (webzyEntities ctx = new webzyEntities())
				{
					var CountryInfo = (from c in ctx.Countries
								   where c.Id == countryId
								   select c).SingleOrDefault();
					return CountryInfo.CountryName;
				}
				
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message.ToString());
			}

		}

		public List<Customer> loadCustomer()
		{
			try
			{
				List<Customer> dtCustomer = new List<Customer>();

				using (webzyEntities ctx = new webzyEntities())
				{
					dtCustomer = (from c in ctx.Customers
								  orderby c.Name ascending
								  select c).ToList<Customer>();
				}
				return dtCustomer;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

        public List<Customer> loadSummaryCustomer()
		{
			try
			{
				List<Customer> dtSummaryCustomer = new List<Customer>();

				using (webzyEntities ctx = new webzyEntities())
				{
                    dtSummaryCustomer = (from c in ctx.Customers
								  orderby c.Name ascending
								  select c).ToList<Customer>();
				}
                Customer customer = new Customer();
                customer.Name = "ALL";
                dtSummaryCustomer.Insert(0, customer);
                return dtSummaryCustomer;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
	}
}
