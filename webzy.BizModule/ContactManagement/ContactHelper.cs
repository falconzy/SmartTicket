using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using webzy.DataEntities;
using System.Data;
using System.Data.Entity.Infrastructure;

namespace webzy.BizModule.ContactManagement
{
    public class ContactHelper
    {
        #region Add Contact Person       
        public bool DuplicateContactName(string ContactName)
        {
            try
            {
                using (webzyEntities ctx = new webzyEntities())
                {
                    var contactperson = from c in ctx.ContactPersons where c.Name == ContactName select c;
                    if (contactperson.Count() > 0)
                    {
                        return true;
                    }
                    else
                    { return false;  }
                }
                
            }
            catch (Exception ex)
            {
                throw ex;

            }
        }
        public bool AddContactPerson(string Name, string HPNumber, string OfficeNumber, string EmailAddress, string CustomerName,int CustomerId, string Remark, string UserName,int StatusId,string StatusName)
        {
            try
            {
                bool result = false;
                ContactPerson contactPerson = new ContactPerson();
                contactPerson.Name = Name;
                contactPerson.CustomerFk = CustomerId;
                contactPerson.HPNumber = HPNumber;
                contactPerson.OfficeNumber = OfficeNumber;
                contactPerson.EmailAddress = EmailAddress;
                contactPerson.StatusFk = StatusId;
                contactPerson.Remark = Remark;
                contactPerson.ModifiedOn = DateTime.Now;
                contactPerson.ModifiedBy = UserName;

                using (webzyEntities ctx = new webzyEntities())
                {
                    ctx.ContactPersons.Add(contactPerson);
                    ctx.SaveChanges();
                    AddContactPersonLog(contactPerson, CustomerName, StatusName,"ADD");
                    result = true;
                }
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private void AddContactPersonLog(ContactPerson contactPerson, string CustomerName, string StatusName,string Action)
        {
            try
            {
                ContactPersonLog contactPersonLog = new ContactPersonLog();
                contactPersonLog.Name = contactPerson.Name;
                contactPersonLog.CustomerName = CustomerName;
                contactPersonLog.HPNumber = contactPerson.HPNumber;
                contactPersonLog.OfficeNumber = contactPerson.OfficeNumber;
                contactPersonLog.EmailAddress = contactPerson.EmailAddress;
                contactPersonLog.Status = StatusName;
                contactPersonLog.Remark = Action;
                contactPersonLog.ModifiedOn = DateTime.Now;
                contactPersonLog.ModifiedBy = contactPerson.ModifiedBy;

                using (webzyEntities ctx = new webzyEntities())
                {
                    ctx.ContactPersonLogs.Add(contactPersonLog);
                    ctx.SaveChanges();   
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region Edit Contact Person
        public ContactPerson GetContactBy(int ContactId)
        {
            try
            {
                using (webzyEntities ctx = new webzyEntities())
                {
                    var contact = (from c in ctx.ContactPersons where c.Id == ContactId select c).SingleOrDefault();
                    return contact;
                }             
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        public bool UpdateContact(ContactPerson contactperson, string CustomerName, string StatusName)
        {
            bool result = false;

            ContactPerson Exisitingcontactperson = new ContactPerson();
            try
            {
                using (webzyEntities ctx = new webzyEntities())
                {
                    Exisitingcontactperson = (from c in ctx.ContactPersons
                                              where c.Id == contactperson.Id
                                              select c).SingleOrDefault();
                    Exisitingcontactperson.Name = contactperson.Name;
                    Exisitingcontactperson.CustomerFk = contactperson.CustomerFk;
                    Exisitingcontactperson.HPNumber = contactperson.HPNumber;
                    Exisitingcontactperson.OfficeNumber = contactperson.OfficeNumber;
                    Exisitingcontactperson.EmailAddress = contactperson.EmailAddress;
                    Exisitingcontactperson.Remark = contactperson.Remark;
                    Exisitingcontactperson.Status = contactperson.Status;
                    Exisitingcontactperson.ModifiedBy = contactperson.ModifiedBy;
                    Exisitingcontactperson.ModifiedOn = contactperson.ModifiedOn;
                    if (Exisitingcontactperson.Id >= 0)
                    {
                        ctx.SaveChanges();
                        AddContactPersonLog(contactperson, CustomerName, StatusName, "UPDATE");
                        result = true;
                    }
                    else
                    {
                        result = false;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return result;
        }

        #region Summary Contact Person
        public string GetContactPerson(string ContactName, string EmailAddrss, string Customer,string Status)
        {
            String command = @"SELECT * FROM ContactPersonView ";
            if ((!(string.IsNullOrWhiteSpace(ContactName))) || (!(string.IsNullOrWhiteSpace(EmailAddrss))) || (!(string.IsNullOrWhiteSpace(Customer))) || (!(string.IsNullOrWhiteSpace(Status))))
            {
                command += "where ";
                if ((!(string.IsNullOrWhiteSpace(ContactName))))
                {
                    command += " Name like '%" + ContactName + "%' AND ";
                }
                if (!(string.IsNullOrWhiteSpace(EmailAddrss)))
                {
                    command += " EmailAddress like '%" + EmailAddrss + "%' AND ";
                }
                if (!(string.IsNullOrWhiteSpace(Customer)) && Customer.ToUpper() != "ALL")
                {
                    command += " CustomerName like '%" + Customer + "%' AND ";
                }
                if (!(string.IsNullOrWhiteSpace(Status)) && Status.ToUpper() != "ALL")
                {
                    command += " StatusName like '%" + Status + "%'";
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

        public DataTable SearchContactPerson(DataTable ContactPersonList, string command)
        {
            string ContactName, CustomerName,HPNumber,OfficeNumber , EmailAddress, status;
            try
            {
                List<ContactPersonView> ContactPersonInfo = new List<ContactPersonView>();
                using (webzyEntities ctx = new webzyEntities())
                {
                    var objectContext = (ctx as IObjectContextAdapter).ObjectContext;
                    ContactPersonInfo = objectContext.ExecuteStoreQuery<ContactPersonView>(command).ToList();
                    foreach (ContactPersonView ContactInfo in ContactPersonInfo)
                    {
                        ContactName = ContactInfo.Name.ToString().Trim();
                        CustomerName = ContactInfo.CustomerName.ToString().Trim();
                        EmailAddress = ContactInfo.EmailAddress;
                        OfficeNumber = ContactInfo.OfficeNumber;
                        HPNumber = ContactInfo.HPNumber;
                        status = ContactInfo.StatusName;
                        ContactPersonList.Rows.Add(ContactInfo.Id, ContactName, CustomerName, HPNumber, OfficeNumber, EmailAddress, status);
                    }
                    return ContactPersonList;
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
